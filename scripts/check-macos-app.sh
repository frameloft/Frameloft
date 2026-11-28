#!/usr/bin/env bash
# Checks that a built Frameloft for macOS carries a valid code signature, the way a
# downloaded copy is checked: the app is taken out of the .dmg (or the in-app update's
# .app.tar.gz), marked as downloaded from the internet, and verified.
#
# An app with no valid signature is reported by macOS as "damaged and can't be opened"
# when it was downloaded. With a valid ad-hoc signature (no Apple Developer account)
# macOS shows the usual "can't be verified" prompt instead, which people can get past
# with System Settings > Privacy & Security > Open Anyway.
#
# Usage: scripts/check-macos-app.sh [--launch] <Frameloft.dmg | Frameloft.app.tar.gz>...
#   --launch  also starts the app for a few seconds to check it runs with its signature.
set -euo pipefail

launch=0
if [ "${1:-}" = "--launch" ]; then launch=1; shift; fi
if [ $# -eq 0 ]; then
  echo "usage: $0 [--launch] <file.dmg | file.app.tar.gz>..." >&2
  exit 2
fi

work=$(mktemp -d)
mounted=""
cleanup() {
  if [ -n "$mounted" ]; then hdiutil detach "$mounted" -quiet || hdiutil detach "$mounted" -force -quiet; fi
  rm -rf "$work"
}
trap cleanup EXIT

check_app() { # path-to-.app label
  local app="$1" label="$2" info
  echo "== $label"
  # Mark it as downloaded, as Safari or Chrome would.
  xattr -w -r com.apple.quarantine "0083;$(printf '%x' "$(date +%s)");Safari;" "$app"

  codesign --verify --deep --strict --verbose=2 "$app"
  info=$(codesign --display --verbose=4 "$app" 2>&1)
  echo "$info" | sed -n -E '/^(Identifier|Format|CodeDirectory|Signature|Authority|TeamIdentifier|Sealed Resources)/p'
  if ! echo "$info" | grep -q '^Sealed Resources'; then
    echo "::error::$label: the app's files are not sealed by its signature; macOS would call a download of it damaged." >&2
    return 1
  fi
  if echo "$info" | grep -q 'flags=0x20002(adhoc,linker-signed)'; then
    echo "::error::$label: only the linker's signature is present, not a signature of the whole app." >&2
    return 1
  fi

  # Gatekeeper's verdict. Without notarisation it is "rejected": that is expected, and is
  # what gives the "can't be verified" prompt. A broken signature shows up above instead.
  local verdict status=0
  verdict=$(spctl --assess --verbose=4 --type execute "$app" 2>&1) || status=$?
  echo "Gatekeeper (spctl, exit $status):"
  echo "$verdict" | sed 's/^/  /'

  if [ "$launch" = 1 ]; then
    local exe pid quit=0
    exe="$app/Contents/MacOS/$(defaults read "$app/Contents/Info" CFBundleExecutable)"
    "$exe" > "$work/launch.log" 2>&1 &
    pid=$!
    sleep 15
    if kill -0 "$pid" 2>/dev/null; then
      echo "Started and still running after 15 seconds."
      kill "$pid"
      wait "$pid" 2>/dev/null || quit=$?
      echo "Stopped (exit $quit)."
    else
      echo "::error::$label: the app quit straight away:" >&2
      cat "$work/launch.log" >&2
      return 1
    fi
  fi
}

n=0
for file in "$@"; do
  n=$((n + 1))
  dest="$work/$n"
  mkdir -p "$dest"
  case "$file" in
    *.dmg)
      mounted="$work/mnt$n"
      hdiutil attach "$file" -nobrowse -readonly -noautoopen -mountpoint "$mounted" -quiet
      # Copy it out, as dragging it to Applications does.
      ditto "$mounted"/*.app "$dest/$(basename "$mounted"/*.app)"
      hdiutil detach "$mounted" -quiet
      mounted=""
      ;;
    *.app.tar.gz)
      tar -xzf "$file" -C "$dest"
      ;;
    *)
      echo "don't know how to check $file" >&2
      exit 2
      ;;
  esac
  app=$(find "$dest" -maxdepth 1 -name '*.app' -print -quit)
  if [ -z "$app" ]; then
    echo "::error::no .app found in $file" >&2
    exit 1
  fi
  check_app "$app" "$(basename "$file")"
done
echo "All signatures are valid."
