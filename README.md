# Lslightly's resume

[![GitHub top language](https://img.shields.io/github/languages/top/Lslightly/resume-typ.svg)](https://github.com/Lslightly/resume-typ)

This is my resume, based on [ice1000's template](https://github.com/ice1000/resume).

Build on Windows: install the latest version of typst and the fontawesome fonts following the instructions in the README of [typst-fontawesome](https://github.com/duskmoon314/typst-fontawesome), then run `build-win.bat`.

## GitHub Actions Release Workflow

When you push a tag (e.g. `v1.0.0`), the `.github/workflows/release.yaml` workflow will automatically:

1. Run on an Ubuntu runner
2. Install Typst and required fonts (Noto CJK, Font Awesome, Academicons)
3. Run `build-linux.sh` to generate `resume-cn.pdf`
4. Create a GitHub Release with the commit timestamp as the release name and attach `resume-cn.pdf`

To trigger a release, run:
```bash
git tag v1.0.0
git push origin v1.0.0
```

---

PR to [ice1000's template](https://github.com/ice1000/resume) welcome.

**Welcome any questions of any kind about me in [Issue](https://github.com/Lslightly/resume-typ/issues/new)**.

# Download/下载

+ [中文版 (PDF)](https://github.com/Lslightly/resume-typ/releases/latest/resume-cn.pdf)

> English version is not available yet.
