#!/usr/bin/env bash
# collect-pi-specs.sh
# Improved baseline collector for hermes-pi (2026-07)
# Produces a clean Org-mode baseline + optional .sexp companion
# Intended to run as gt-hermes on hermes-pi

set -euo pipefail

# ---------- Configuration ----------
OUTDIR="${HOME}/pi-specs"
SCRIPT_VERSION="2026-07-28-v2"

# ---------- Timestamp & naming ----------
TIMESTAMP_LOCAL=$(date '+%Y-%m-%d %H:%M:%S %Z')
TIMESTAMP_UTC=$(date -u '+%Y-%m-%d %H:%M:%S UTC')
TIMESTAMP_FILE=$(date '+%Y%m%d-%H%M')
HOSTNAME=$(hostname)
USER=$(whoami)

ORG_FILE="${OUTDIR}/pi-withnail-specs-${HOSTNAME}-${TIMESTAMP_FILE}.org"
SEXP_FILE="${OUTDIR}/pi-withnail-specs-${HOSTNAME}-${TIMESTAMP_FILE}.sexp"

mkdir -p "${OUTDIR}"

# ---------- Version detection ----------
OLLAMA_VERSION=$(ollama --version 2>/dev/null | awk '{print $NF}' || echo "unknown")

HERMES_VERSION="unknown"
HERMES_VENV_PYTHON="${HOME}/.hermes/hermes-agent/venv/bin/python"

if [[ -x "${HERMES_VENV_PYTHON}" ]]; then
  HERMES_VERSION=$("${HERMES_VENV_PYTHON}" -c '
import importlib.metadata
try:
    print(importlib.metadata.version("hermes-agent"))
except Exception:
    try:
        import hermes_cli
        print(getattr(hermes_cli, "__version__", "unknown"))
    except Exception:
        print("unknown")
' 2>/dev/null || echo "unknown")
fi

# Simple heuristic for active provider
ACTIVE_PROVIDER="local-ollama"
if [[ -f "${HOME}/.hermes/config.yaml" ]]; then
  if grep -qiE 'openrouter|OpenRouter' "${HOME}/.hermes/config.yaml"; then
    ACTIVE_PROVIDER="openrouter-or-mixed"
  fi
fi

# ---------- Write Org header ----------
cat > "${ORG_FILE}" <<EOF
#+TITLE: Raspberry Pi + Withnail/Hermes/Ollama Specifications
#+DATE: ${TIMESTAMP_LOCAL}
#+AUTHOR: collect-pi-specs.sh (${SCRIPT_VERSION})
#+PURPOSE: Baseline for configuration improvement and long-term knowledge-base tracking

:PROPERTIES:
:SCRIPT_VERSION: ${SCRIPT_VERSION}
:COLLECTED_LOCAL: ${TIMESTAMP_LOCAL}
:COLLECTED_UTC: ${TIMESTAMP_UTC}
:HOSTNAME: ${HOSTNAME}
:USERNAME: ${USER}
:OUTPUT_FILE: ${ORG_FILE}
:PI_MODEL: Raspberry Pi 5 Model B Rev 1.1
:RAM_GB: 8
:HERMES_VERSION: ${HERMES_VERSION}
:OLLAMA_VERSION: ${OLLAMA_VERSION}
:ACTIVE_PROVIDER: ${ACTIVE_PROVIDER}
:WITHNAIL_DETECTED: yes
:END:

* Purpose
Point-in-time snapshot of hardware, OS, and the autonomous agent stack on hermes-pi.

* Hardware Inventory & Pi-specific Details
EOF

# ---------- Hardware ----------
{
  echo "*** SoC / Processor"
  echo "#+begin_src text"
  lscpu 2>/dev/null || true
  echo "#+end_src"
  echo
  echo "*** Model / Revision / Serial"
  echo "#+begin_src text"
  grep -E 'Revision|Serial|Model' /proc/cpuinfo 2>/dev/null || true
  echo "#+end_src"
  echo
  echo "*** Memory"
  echo "#+begin_src text"
  free -h 2>/dev/null || true
  echo "#+end_src"
  echo
  echo "*** Storage"
  echo "#+begin_src text"
  lsblk -o NAME,SIZE,TYPE,FSTYPE,MOUNTPOINT,UUID 2>/dev/null || true
  echo
  df -h / 2>/dev/null || true
  echo "#+end_src"
  echo
  echo "*** Temperature / Throttling / Voltage"
  echo "#+begin_src text"
  vcgencmd measure_temp 2>/dev/null || echo "vcgencmd not available"
  vcgencmd get_throttled 2>/dev/null || true
  vcgencmd measure_volts 2>/dev/null || true
  echo "#+end_src"
} >> "${ORG_FILE}"

# ---------- OS / Kernel ----------
{
  echo
  echo "* Operating System & Kernel"
  echo "#+begin_src text"
  cat /etc/os-release 2>/dev/null || true
  echo
  uname -a 2>/dev/null || true
  echo "#+end_src"
} >> "${ORG_FILE}"

# ---------- Networking ----------
{
  echo
  echo "* Networking & Connectivity"
  echo "*** Interfaces"
  echo "#+begin_src text"
  ip -br addr 2>/dev/null || true
  echo "#+end_src"
  echo
  echo "*** Tailscale"
  echo "#+begin_src text"
  tailscale status 2>/dev/null || echo "tailscale not available or not connected"
  echo "#+end_src"
} >> "${ORG_FILE}"

# ---------- Ollama ----------
{
  echo
  echo "* AI Software Stack - Ollama"
  echo "*** Version"
  echo "#+begin_src text"
  echo "ollama version is ${OLLAMA_VERSION}"
  echo "#+end_src"
  echo
  echo "*** Installed Models"
  echo "#+begin_src text"
  ollama list 2>/dev/null || echo "ollama list failed"
  echo "#+end_src"
  echo
  echo "*** Currently Loaded"
  echo "#+begin_src text"
  ollama ps 2>/dev/null || echo "ollama ps failed"
  echo "#+end_src"
} >> "${ORG_FILE}"

# ---------- Hermes / Withnail ----------
{
  echo
  echo "* AI Software Stack - Hermes Agent + Withnail"
  echo "*** Version"
  echo "#+begin_src text"
  echo "HERMES_VERSION: ${HERMES_VERSION}"
  echo "#+end_src"
  echo
  echo "*** systemd status"
  echo "#+begin_src text"
  systemctl --user status hermes-gateway.service --no-pager 2>/dev/null \
    || systemctl status hermes-gateway.service --no-pager 2>/dev/null \
    || echo "hermes-gateway.service status unavailable"
  echo "#+end_src"
  echo
  echo "*** Config highlights (sanitized)"
  echo "#+begin_src yaml"
  if [[ -f "${HOME}/.hermes/config.yaml" ]]; then
    # Pull only non-secret structural lines
    grep -E '^\s*(model:|provider:|base_url:|context_length:|max_tokens:|temperature:|default:)' \
         -A 15 "${HOME}/.hermes/config.yaml" 2>/dev/null | head -50 \
      || echo "could not extract config highlights"
  else
    echo "config.yaml not found"
  fi
  echo "#+end_src"
} >> "${ORG_FILE}"

# ---------- Runtime snapshot ----------
{
  echo
  echo "* System Services & Runtime Snapshot"
  echo "*** Load / Memory / Disk"
  echo "#+begin_src text"
  uptime 2>/dev/null || true
  echo
  free -h 2>/dev/null || true
  echo
  df -h / 2>/dev/null || true
  echo "#+end_src"
  echo
  echo "*** Relevant processes"
  echo "#+begin_src text"
  ps aux | grep -E '[o]llama|[h]ermes|[g]ateway' || true
  echo "#+end_src"
} >> "${ORG_FILE}"

# ---------- Notes placeholder ----------
{
  echo
  echo "* Changes / Notes"
  echo "Add free-text notes here after collection and review."
  echo
} >> "${ORG_FILE}"

# ---------- Machine-readable companion ----------
cat > "${SEXP_FILE}" <<EOF
(:baseline
 :script-version "${SCRIPT_VERSION}"
 :collected-local "${TIMESTAMP_LOCAL}"
 :collected-utc "${TIMESTAMP_UTC}"
 :hostname "${HOSTNAME}"
 :username "${USER}"
 :hermes-version "${HERMES_VERSION}"
 :ollama-version "${OLLAMA_VERSION}"
 :active-provider "${ACTIVE_PROVIDER}"
 :ram-gb 8
 :pi-model "Raspberry Pi 5 Model B Rev 1.1"
 :org-file "${ORG_FILE}")
EOF

echo
echo "Baseline collection complete."
echo "  Org  : ${ORG_FILE}"
echo "  Sexp : ${SEXP_FILE}"
echo
