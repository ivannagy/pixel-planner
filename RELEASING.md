# Release Process

This document describes how to release new versions of pixel-planner.

## Automated Release (Recommended)

The project uses GitHub Actions for automated releases. When you push a version tag, it automatically:

1. Runs tests across Python 3.9-3.12
2. Builds the package
3. Publishes to PyPI
4. Creates a GitHub release

### Steps for Automated Release

1. **Update version numbers:**
   ```bash
   # Update these files with the new version (e.g., 0.1.1):
   # - pyproject.toml: version = "0.1.1"
   # - pixel_planner/__init__.py: __version__ = "0.1.1"
   ```

2. **Commit and push changes:**
   ```bash
   git add .
   git commit -m "Bump version to 0.1.1"
   git push origin main
   ```

3. **Create and push version tag:**
   ```bash
   git tag v0.1.1
   git push origin v0.1.1
   ```

4. **Monitor the release:**
   - Go to GitHub Actions tab to watch the workflow
   - Check PyPI for the new package: https://pypi.org/project/pixel-planner/
   - Verify GitHub release was created

## Prerequisites

### First-time Setup

1. **PyPI Account & API Token:**
   - Create account at https://pypi.org/account/register/
   - Generate API token at https://pypi.org/manage/account/token/
   - Add token to GitHub Secrets as `PYPI_API_TOKEN`

2. **GitHub Secrets Setup:**
   ```
   Repository → Settings → Secrets and variables → Actions
   Add new secret: PYPI_API_TOKEN = pypi-xxxxxxx
   ```

## Manual Release (Fallback)

If automated release fails, you can release manually:

1. **Install build tools:**
   ```bash
   pip install build twine
   ```

2. **Build package:**
   ```bash
   python -m build
   ```

3. **Upload to PyPI:**
   ```bash
   twine upload dist/*
   ```

## Version Consistency

The GitHub Actions workflow verifies that:
- Git tag version matches `pyproject.toml` version
- Git tag version matches `pixel_planner/__init__.py` version

If versions don't match, the release will fail with a clear error message.

## Release Checklist

- [ ] Update `pyproject.toml` version
- [ ] Update `pixel_planner/__init__.py` version
- [ ] Update `CHANGELOG.md` (if exists)
- [ ] Run tests locally: `pytest -q`
- [ ] Run linting locally: `ruff check .`
- [ ] Commit version bump
- [ ] Create and push git tag
- [ ] Monitor GitHub Actions workflow
- [ ] Verify PyPI package
- [ ] Test installation: `pip install pixel-planner==X.X.X`

## Troubleshooting

**Build fails:**
- Check test failures in GitHub Actions
- Verify version consistency
- Check linting errors

**PyPI upload fails:**
- Verify `PYPI_API_TOKEN` secret is set correctly
- Check if version already exists on PyPI
- Ensure account has permissions to upload

**Template not found after installation:**
- Verify templates are included in `pyproject.toml`
- Check package data is correctly bundled