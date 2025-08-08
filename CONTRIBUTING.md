# Contributing to Pixel Planner

Thanks for helping improve Pixel Planner!

## Setup
- Python 3.9+
- Create a virtual env (recommended)
- Install dev deps:
  - `pip install -r requirements-dev.txt`

## Commands
- Lint: `ruff check .`
- Type check: `mypy scripts`
- Tests: `pytest -q`

## Workflow
- Create a branch from `main`
- Make your changes with clear commits
- Run lint, type check and tests
- Open a PR; include a short description and screenshots if the timeline output changed

## Coding style
- Prefer clear, readable, well-named code
- Keep functions small and testable
- Add tests for new behavior and important edge cases

## Release notes
- Update `CHANGELOG.md` when changing behavior or adding features
