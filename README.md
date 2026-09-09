# read-me

My CV / résumé repository — written in LaTeX, published as a PDF and a web page.

## 🔗 Live

- **Web CV:** https://vanphuoc3012.github.io/read-me/
- **PDF:** https://vanphuoc3012.github.io/read-me/CV-HO-VAN-PHUOC.pdf

## 📁 Contents

| File | Purpose |
|------|---------|
| `CV-HO-VAN-PHUOC.tex` | LaTeX source (the master CV) |
| `CV-HO-VAN-PHUOC.pdf` | Generated PDF |
| `index.html` | Web version of the CV (styled to match the PDF) |
| `build.sh` | Builds the PDF from the LaTeX source |
| `experience-archive.md` | Long-form experience detail, kept out of the final CV |

## 🛠️ Build locally

```bash
./build.sh          # build CV-HO-VAN-PHUOC.tex -> CV-HO-VAN-PHUOC.pdf
./build.sh --clean  # remove LaTeX aux files
```

Requires a LaTeX toolchain (`xelatex` / `latexmk`).

## 🚀 Deployment

Pushing to `main` triggers a GitHub Actions workflow that rebuilds the PDF and
deploys both the PDF and the web page to GitHub Pages.
