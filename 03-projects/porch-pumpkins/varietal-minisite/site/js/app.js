const money = (n) =>
  n == null || Number.isNaN(n) ? "—" : new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(n);

function vendorLabel(id, vendors) {
  return vendors[id]?.name || id;
}

async function loadCatalog() {
  const res = await fetch("./data/varietals.json");
  return res.json();
}

function hasLocalPhoto(it) {
  const st = it.image && it.image.status;
  return st === "own-photo" || st === "chosen";
}

function thumbCell(it) {
  const src = it.local_image || "";
  if (hasLocalPhoto(it) && src) {
    return `<a class="thumb-link" href="${it.page}">
      <img class="thumb" src="${src}" alt="${it.name}" loading="lazy"
           onerror="this.replaceWith(Object.assign(document.createElement('span'),{className:'kind',textContent:'missing file'}))">
    </a>`;
  }
  return `<span class="kind">no photo</span>`;
}

function renderRows(items, vendors, q, kind) {
  const needle = q.trim().toLowerCase();
  return items
    .filter((it) => {
      if (kind && it.kind !== kind) return false;
      if (!needle) return true;
      const blob = [it.name, it.slug, it.kind, ...(it.aliases || []), it.cost_note].join(" ").toLowerCase();
      return blob.includes(needle);
    })
    .map((it) => {
      const local = `<a href="${it.page}">${it.name}</a>`;
      const web = it.web_image
        ? `<a href="${it.web_image}">web ref</a>`
        : "<span class='kind'>pending</span>";
      const v = (it.vendors || []).map((id) => vendorLabel(id, vendors)).join(", ") || "—";
      return `<tr class="status-${it.status}">
        <td class="thumb-cell">${thumbCell(it)}</td>
        <td>${it.name}<div class="kind">${it.kind} · ${it.status}</div></td>
        <td>${web}</td>
        <td>${local}<div class="kind">${it.local_image || ""}</div></td>
        <td class="money">${money(it.cost_each)}</td>
        <td>${it.cost_note || ""}</td>
        <td>${v}</td>
      </tr>`;
    })
    .join("");
}

async function bootIndex() {
  const data = await loadCatalog();
  const q = document.querySelector("#q");
  const tbody = document.querySelector("#rows");
  const count = document.querySelector("#count");
  const chips = document.querySelectorAll("[data-kind]");
  let kind = "";

  const paint = () => {
    tbody.innerHTML = renderRows(data.items, data.vendors, q.value, kind);
    const shown = tbody.querySelectorAll("tr").length;
    count.textContent = `${shown} of ${data.items.length} items`;
  };

  q.addEventListener("input", paint);
  chips.forEach((btn) => {
    btn.addEventListener("click", () => {
      kind = btn.dataset.kind;
      chips.forEach((b) => b.classList.toggle("on", b === btn));
      paint();
    });
  });
  paint();
}

function copyText(id) {
  const el = document.getElementById(id);
  const text = el.innerText || el.value;
  navigator.clipboard.writeText(text).then(() => {
    const t = document.querySelector(".toast");
    t.style.display = "block";
    t.textContent = "Copied to clipboard";
    setTimeout(() => (t.style.display = "none"), 1400);
  });
}

function padOrg(s, n) {
  s = String(s);
  return s.length >= n ? s : s + " ".repeat(n - s.length);
}

function orgSafe(s) {
  return String(s || "").replace(/\|/g, "/").trim();
}

async function bootWorksheet() {
  const data = await loadCatalog();
  const bySlug = Object.fromEntries(data.items.map((it) => [it.slug, it]));
  const byName = {};
  data.items.forEach((it) => {
    byName[it.name.toLowerCase()] = it;
    (it.aliases || []).forEach((a) => { byName[String(a).toLowerCase()] = it; });
  });

  const list = document.getElementById("varietal-list");
  list.innerHTML = data.items
    .slice()
    .sort((a, b) => a.name.localeCompare(b.name))
    .map((it) => {
      const price = it.cost_each == null ? "no list price" : money(it.cost_each);
      return `<option value="${it.name}" data-slug="${it.slug}" label="${it.slug} · ${price}"></option>`;
    })
    .join("");

  const tbody = document.getElementById("quote-rows");
  const grandEl = document.getElementById("grand");
  const orgEl = document.getElementById("worksheet-org");
  const mdEl = document.getElementById("delivery-md");

  const resolve = (raw) => {
    const s = (raw || "").trim();
    if (!s) return null;
    if (bySlug[s]) return bySlug[s];
    return byName[s.toLowerCase()] || null;
  };

  const rowHtml = () => `<tr>
      <td class="thumb-cell quote-thumb"><span class="kind">—</span></td>
      <td><input class="q-name" type="text" list="varietal-list" placeholder="Type a name…" /></td>
      <td class="money q-unit">—</td>
      <td><input class="q-qty" type="number" min="0" step="1" value="" /></td>
      <td class="money q-line">—</td>
      <td><button type="button" class="ghost q-del">Remove</button></td>
    </tr>`;

  const addRow = (n = 1) => {
    for (let i = 0; i < n; i++) tbody.insertAdjacentHTML("beforeend", rowHtml());
  };

  const lines = () => {
    const out = [];
    tbody.querySelectorAll("tr").forEach((tr) => {
      const raw = tr.querySelector(".q-name").value;
      const it = resolve(raw);
      const qty = Number(tr.querySelector(".q-qty").value);
      const unit = it && it.cost_each != null ? Number(it.cost_each) : null;
      const line = unit != null && qty > 0 ? unit * qty : null;
      const thumb = tr.querySelector(".quote-thumb");
      tr.querySelector(".q-unit").textContent = money(unit);
      tr.querySelector(".q-line").textContent = money(line);
      if (it && hasLocalPhoto(it) && it.local_image) {
        thumb.innerHTML = `<img class="thumb" src="${it.local_image}" alt="${it.name}">`;
      } else {
        thumb.innerHTML = `<span class="kind">${it ? "no photo" : "—"}</span>`;
      }
      if (it && qty > 0) out.push({ it, qty, unit, line });
    });
    return out;
  };

  const customer = () => ({
    name: document.getElementById("c-name").value.trim(),
    phone: document.getElementById("c-phone").value.trim(),
    email: document.getElementById("c-email").value.trim(),
    street: document.getElementById("c-street").value.trim(),
    zip: document.getElementById("c-zip").value.trim(),
    date: document.getElementById("c-date").value.trim(),
  });

  const paintExport = () => {
    const rows = lines();
    const grand = rows.reduce((s, r) => s + (r.line || 0), 0);
    grandEl.textContent = money(grand);

    const nameW = Math.max(22, ...rows.map((r) => r.it.name.length), "scenario pre-tax total".length);
    const body = rows.map((r) => {
      const cost = r.unit == null ? "" : r.unit.toFixed(2);
      const tot = r.line == null ? "" : r.line.toFixed(2);
      return `| ${padOrg(r.it.name, nameW)} |                 | ${padOrg(cost, 4)} | ${String(r.qty).padStart(3)} | ${String(tot).padStart(10)} |`;
    });
    const last = rows.length + 2;
    const sep = `|-${"-".repeat(nameW)}-+-----------------+------+-----+------------|`;
    const totalRow = `| ${padOrg("scenario pre-tax total", nameW)} |                 |      |     | ${String(grand.toFixed(2)).padStart(10)} |`;
    const c = customer();
    const tblfm = rows.length
      ? `#+TBLFM: $5=$3*$4;%.2f::@${last}$5=vsum(@2$5..@${last - 1}$5);%.2f`
      : "";

    orgEl.textContent = `#+TITLE: Pumpkin porch scenario
#+CUSTOMER: ${orgSafe(c.name)}
#+FUNCTION: wpp/process-pumpkin-worksheet

* Worksheet
** Project Components
| ${padOrg("Varietal", nameW)} | thumbnail image | cost | qty | line total |
${sep}
${body.join("\n") || `| ${padOrg("", nameW)} |                 |      |     |            |`}
${sep}
${totalRow}
${tblfm}

** Customer
| Name | Phone | Email | Street | ZIP | Delivery Date |
| ${orgSafe(c.name)} | ${orgSafe(c.phone)} | ${orgSafe(c.email)} | ${orgSafe(c.street)} | ${orgSafe(c.zip)} | ${orgSafe(c.date)} |
`;

    const mdItems = rows
      .map((r) => `| ${r.it.name} | ${String(r.qty).padStart(5)} |`)
      .join("\n") || "|  |     |";
    mdEl.textContent = `# Pumpkin delivery

## ${c.name || "Customer Name"}

- customer email: ${c.email || ""}
- customer address with ZIP: ${[c.street, c.zip].filter(Boolean).join(", ")}
- delivery date: ${c.date || ""}

## Items to deliver

| Varietal | Count |
|----------|------:|
${mdItems}
`;
  };

  tbody.addEventListener("input", paintExport);
  tbody.addEventListener("change", paintExport);
  tbody.addEventListener("click", (ev) => {
    if (!ev.target.classList.contains("q-del")) return;
    ev.target.closest("tr").remove();
    if (!tbody.querySelector("tr")) addRow();
    paintExport();
  });
  ["c-name", "c-phone", "c-email", "c-street", "c-zip", "c-date"].forEach((id) => {
    document.getElementById(id).addEventListener("input", paintExport);
  });
  document.getElementById("add-row").addEventListener("click", () => {
    addRow();
    paintExport();
  });

  addRow(4);
  paintExport();
}

window.WPP = { bootIndex, bootWorksheet, copyText };
