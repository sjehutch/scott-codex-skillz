#!/bin/sh
set -eu

REPO_URL="https://github.com/sjehutch/scott-codex-skillz.git"
INSTALL_DIR="$HOME/.codex/skills"
BIN_DIR="$HOME/.local/bin"
TMP_DIR="$(mktemp -d "${TMPDIR:-/tmp}/codex-skills.XXXXXX")"

cleanup() {
  rm -rf "$TMP_DIR"
}

trap cleanup EXIT INT TERM

if ! command -v git >/dev/null 2>&1; then
  echo "git is required." >&2
  exit 1
fi

git clone --depth 1 "$REPO_URL" "$TMP_DIR" >/dev/null 2>&1

mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"

case ":$PATH:" in
  *":$HOME/.local/bin:"*) ;;
  *)
    echo "$HOME/.local/bin is not on your PATH." >&2
    echo 'Add this to your shell profile:' >&2
    echo 'export PATH="$HOME/.local/bin:$PATH"' >&2
    echo "Then reopen your shell and rerun this install." >&2
    exit 1
    ;;
esac

for skill_dir in "$TMP_DIR"/codex-skills/skills/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  mkdir -p "$INSTALL_DIR/$skill_name"
  cp "$skill_dir/SKILL.md" "$INSTALL_DIR/$skill_name/SKILL.md"
done

cp "$TMP_DIR/oldassdev" "$BIN_DIR/oldassdev"
chmod +x "$BIN_DIR/oldassdev"

echo "Done."
echo ""
echo "Next:"
echo "1. Make sure $HOME/.local/bin is on your PATH."
echo "2. Run: oldassdev featurealign"
echo "3. Open the repo in Codex."
echo "OldAssDev review: trim the fat, keep the useful bits."
