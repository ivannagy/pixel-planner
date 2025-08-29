# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Testing and Quality
- Run tests: `pytest -q`
- Run single test: `pytest tests/test_parser.py::test_specific_function -v`
- Lint code: `ruff check .`
- Type check: `mypy scripts`
- Install dev dependencies: `pip install -r requirements-dev.txt`

### Main Tool Usage
- Initialize new project plan: `python3 scripts/pixel_planner.py init --template templates/pixel-planner-phase-template.md --out Project-Plan.md --project "Project Name"`
- Generate timeline (in-place): `python3 scripts/pixel_planner.py timeline --in Project-Plan.md --in-place --basis current`
- Generate timeline (to file): `python3 scripts/pixel_planner.py timeline --in Project-Plan.md --out output.md --basis baseline`
- Generate timeline as-of date: `python3 scripts/pixel_planner.py timeline --in Project-Plan.md --in-place --basis current --date 2025-03-02`

## Architecture Overview

This is a Python CLI tool that parses Markdown project plans and generates Gantt-like timelines. The core architecture consists of:

### Core Components
- `scripts/pixel_planner.py`: Single-file CLI with data models (`Milestone`, `Phase`) and all logic
- `templates/pixel-planner-phase-template.md`: Template for new project plans
- `Sample-Project-Plan.md`: Working example that demonstrates all features

### Key Data Flow
1. **Parser**: Extracts phases and milestones from Markdown tables using regex
2. **Timeline Generator**: Creates visual bars (`■` per week) aligned to global week grid
3. **Progress Calculator**: Computes executed vs should-be percentages based on effective date
4. **Renderer**: Updates the `## Project Timeline (Phases)` section in-place

### Critical Parsing Rules
- Phase headers: `## Phase 01 – Phase Name` (supports both `–` and `-`)
- Milestone tables must have columns: Milestone, Description, Status, Baseline Plan, Current Plan (case-insensitive matching)
- Dates must be ISO `YYYY-MM-DD` format
- Only `Status = Done` (case-insensitive) marks milestones as executed
- Timeline section must be exactly `## Project Timeline (Phases)` with fenced code block

### Basis System
- `--basis current`: Uses Current Plan dates for positioning and should-be calculations
- `--basis baseline`: Uses Baseline Plan dates instead
- This allows comparing original plan vs revised plan while maintaining timeline accuracy

### Configuration
- Ruff linting with 160 char line length
- MyPy type checking (lenient config)
- Python 3.11+ target
- pytest for testing