#!/usr/bin/env bash
# Verifica dependencias. Corre SIEMPRE antes de empezar.
source "$(dirname "$0")/_chrome.sh"
ok=1
say() { printf "  %-22s %s\n" "$1" "$2"; }

echo "pdf-restyle · revision de dependencias"
echo

if CH=$(find_chrome); then say "Chrome/Chromium" "OK  ($CH)"; else
  say "Chrome/Chromium" "FALTA"
  echo "     -> Instala Google Chrome: https://google.com/chrome"
  ok=0
fi

for t in pdftotext pdfimages pdftoppm pdfinfo pdftocairo; do
  if command -v "$t" >/dev/null; then say "$t" "OK"; else
    say "$t" "FALTA (poppler)"
    ok=0
  fi
done

if ! command -v pdftotext >/dev/null; then
  echo
  echo "  Para instalar poppler:"
  case "$(uname -s)" in
    Darwin) echo "     brew install poppler" ;;
    Linux)  echo "     sudo apt install poppler-utils    # Debian/Ubuntu"
            echo "     sudo dnf install poppler-utils    # Fedora" ;;
  esac
fi

if command -v python3 >/dev/null; then say "python3" "OK  ($(python3 --version 2>&1))"; else
  say "python3" "FALTA"; ok=0
fi

echo
[ $ok -eq 1 ] && echo "Todo listo." || { echo "Faltan dependencias (ver arriba)."; exit 1; }
