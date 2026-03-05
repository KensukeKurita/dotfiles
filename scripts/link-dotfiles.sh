#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: ./scripts/link-dotfiles.sh [options]

Options:
  -n, --dry-run   Show what would change without writing anything.
  -f, --force     Replace existing files instead of creating backups.
  -h, --help      Show this help.

Environment variables:
  DOTFILES_OS     Override OS detection. Allowed values: macos, linux, wsl
EOF
}

detect_os() {
  if [[ -n "${DOTFILES_OS:-}" ]]; then
    case "${DOTFILES_OS}" in
      macos|linux|wsl) echo "${DOTFILES_OS}" ;;
      *)
        echo "Unsupported DOTFILES_OS: ${DOTFILES_OS}" >&2
        exit 1
        ;;
    esac
    return
  fi

  local uname_s
  uname_s="$(uname -s)"
  case "${uname_s}" in
    Darwin) echo "macos" ;;
    Linux)
      if grep -qi microsoft /proc/version 2>/dev/null; then
        echo "wsl"
      else
        echo "linux"
      fi
      ;;
    *)
      echo "Unsupported OS: ${uname_s}" >&2
      exit 1
      ;;
  esac
}

expand_home() {
  local p="$1"
  if [[ "${p}" == "~"* ]]; then
    printf '%s\n' "${HOME}${p:1}"
  else
    printf '%s\n' "${p}"
  fi
}

ensure_parent_dir() {
  local p="$1"
  local dir
  dir="$(dirname "${p}")"
  mkdir -p "${dir}"
}

safe_link() {
  local src="$1"
  local dest="$2"
  local dry_run="$3"
  local force="$4"

  if [[ -L "${dest}" ]]; then
    local current
    current="$(readlink "${dest}")"
    if [[ "${current}" == "${src}" ]]; then
      echo "skip: ${dest} -> ${src}"
      return
    fi
  fi

  if [[ -e "${dest}" || -L "${dest}" ]]; then
    if [[ "${force}" -eq 1 ]]; then
      echo "replace: ${dest}"
      if [[ "${dry_run}" -eq 0 ]]; then
        rm -rf "${dest}"
      fi
    else
      local backup
      backup="${dest}.backup.$(date +%Y%m%d%H%M%S)"
      echo "backup: ${dest} -> ${backup}"
      if [[ "${dry_run}" -eq 0 ]]; then
        mv "${dest}" "${backup}"
      fi
    fi
  fi

  echo "link: ${dest} -> ${src}"
  if [[ "${dry_run}" -eq 0 ]]; then
    ln -s "${src}" "${dest}"
  fi
}

DRY_RUN=0
FORCE=0
while [[ $# -gt 0 ]]; do
  case "$1" in
    -n|--dry-run)
      DRY_RUN=1
      shift
      ;;
    -f|--force)
      FORCE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
OS="$(detect_os)"

echo "Detected OS: ${OS}"
echo "Repository: ${REPO_ROOT}"

declare -a LINKS
LINKS+=("${REPO_ROOT}/nvim|~/.config/nvim|all")
LINKS+=("${REPO_ROOT}/starship/starship.toml|~/.config/starship.toml|all")
LINKS+=("${REPO_ROOT}/wezterm/.wezterm.lua|~/.wezterm.lua|all")
LINKS+=("${REPO_ROOT}/codex/AGENTS.md|~/.codex/AGENTS.md|all")
LINKS+=("${REPO_ROOT}/karabiner/karabiner.json|~/.config/karabiner/karabiner.json|macos")

for entry in "${LINKS[@]}"; do
  IFS='|' read -r src_raw dest_raw target_os <<<"${entry}"
  if [[ "${target_os}" != "all" && "${target_os}" != "${OS}" ]]; then
    continue
  fi

  src="${src_raw}"
  dest="$(expand_home "${dest_raw}")"

  if [[ ! -e "${src}" && ! -L "${src}" ]]; then
    echo "missing source, skip: ${src}" >&2
    continue
  fi

  ensure_parent_dir "${dest}"
  safe_link "${src}" "${dest}" "${DRY_RUN}" "${FORCE}"
done

echo "Done."
