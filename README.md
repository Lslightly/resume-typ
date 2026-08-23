# Lslightly's resume

[![GitHub top language](https://img.shields.io/github/languages/top/Lslightly/resume-typ.svg)](https://github.com/Lslightly/resume-typ)

This is my resume, based on [ice1000's template](https://github.com/ice1000/resume).

Build on Windows: install the latest version of typst and the fontawesome fonts following the instructions in the README of [typst-fontawesome](https://github.com/duskmoon314/typst-fontawesome), then run `build-win.bat`.

## GitHub Actions Release Workflow

When you push to `master`, the `.github/workflows/release.yaml` workflow will automatically:

1. Run on a Windows runner
2. Install Typst
3. Run `build-win.bat` to generate `resume-cn.pdf`
4. Create a GitHub Release with the commit timestamp as the release name and attach `resume-cn.pdf`

No manual intervention is needed beyond having the workflow file present in the repository.

---

PR to [ice1000's template](https://github.com/ice1000/resume) welcome.

**Welcome any questions of any kind about me in [Issue](https://github.com/Lslightly/resume-typ/issues/new)**.

# Download/下载

+ [中文版 (PDF)](./resume-cn.pdf)

> English version is not available yet.
