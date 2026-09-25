const money = (n) => (n == null ? "—" : new Intl.NumberFormat("en-US", { style: "currency", currency: "USD" }).format(n));

function vendorLabel(id, vendors) {
  return vendors[id]?.name || id;
}

async function loadCatalog() {
  const res = await fetch("./data/varietals.json");
  return res.json();
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
        <td>${it.name}<div class="kind">${it.kind} · ${it.status}</div></td>
        <td>${web}</td>
        <td>${local}<div class="kind">${it.local_image}</div></td>
        <td class="money">${money(it.cost_each)}</td>
        <td>${it.cost_note}</td>
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

window.WPP = { bootIndex, copyText };
