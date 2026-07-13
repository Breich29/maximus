#!/bin/bash
# Lightweight memory validator for ${SYSTEM_NAME} markdown stores.

set -euo pipefail

# launchd runs with a minimal PATH that omits Homebrew — needed for claude, envsubst, etc.
export PATH="/opt/homebrew/bin:/usr/local/bin:${PATH}"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MEM_DIR="${ROOT_DIR}/memory"

fail() {
  echo "ERROR: $1" >&2
  exit 1
}

warn() {
  echo "WARN: $1"
}

[[ -d "${MEM_DIR}" ]] || fail "Missing memory directory: ${MEM_DIR}"

decisions_file="${MEM_DIR}/decisions.md"
commitments_file="${MEM_DIR}/commitments.md"
projects_file="${MEM_DIR}/projects.md"
people_file="${MEM_DIR}/people.md"
partners_file="${MEM_DIR}/partners.md"
schemas_file="${MEM_DIR}/schemas.md"

for f in "${decisions_file}" "${commitments_file}" "${projects_file}" "${people_file}" "${partners_file}" "${schemas_file}"; do
  [[ -f "${f}" ]] || fail "Missing file: ${f}"
done

# 1) ID integrity
dec_ids=$(grep -Eo "DEC-[0-9]{3}" "${decisions_file}" | sort -u || true)
com_ids=$(grep -Eo "COM-[IO]-[0-9]{3}" "${commitments_file}" | sort -u || true)
used_dec=$(grep -Eho "DEC-[0-9]{3}" "${projects_file}" "${people_file}" | sort -u || true)
used_com=$(grep -Eho "COM-[IO]-[0-9]{3}" "${projects_file}" "${people_file}" | sort -u || true)

missing_dec=$(comm -23 <(printf "%s\n" "${used_dec}" | sed '/^$/d' | sort -u) <(printf "%s\n" "${dec_ids}" | sed '/^$/d' | sort -u) || true)
missing_com=$(comm -23 <(printf "%s\n" "${used_com}" | sed '/^$/d' | sort -u) <(printf "%s\n" "${com_ids}" | sed '/^$/d' | sort -u) || true)

[[ -z "${missing_dec}" ]] || fail "Missing decision IDs referenced in memory: ${missing_dec}"
[[ -z "${missing_com}" ]] || fail "Missing commitment IDs referenced in memory: ${missing_com}"

# 2) Duplicate person headings
people_total=$(grep -E "^### " "${people_file}" | wc -l | tr -d ' ')
people_unique=$(grep -E "^### " "${people_file}" | sed 's/^### //' | sort -u | wc -l | tr -d ' ')
if [[ "${people_total}" != "${people_unique}" ]]; then
  warn "Possible duplicate people headings detected in people.md"
fi

# 3) Partner status enum check
allowed_partner_status_regex="active|transitioning|blocked|sunsetting|terminated"
bad_partner_status=$(grep -E "^- Status: " "${partners_file}" | sed -E 's/^- Status: ([^|]+).*/\1/' | sed 's/[[:space:]]*$//' | grep -Ev "^(${allowed_partner_status_regex})$" || true)
[[ -z "${bad_partner_status}" ]] || fail "Invalid partner status values: ${bad_partner_status}"

echo "OK: memory validation passed"
