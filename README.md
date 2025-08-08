# Pixel Planner

Automate project plans written in Markdown. Generate a clean, gantt-like timeline from your phases and milestones, and keep progress indicators up to date with a single command.

## Features
- Initialize a new plan from a template
- Parse phases and milestones from the plan
- Generate/refresh a gantt-like "Project Timeline (Phases)" section
- Current-date marker with clamping to last milestone date
- Global and per-phase percentages showing actual vs should-be
- Supports baseline vs current planning bases

## Requirements
- Python 3.9+

## Quick start
1) Create a plan from the template

```bash
python3 scripts/pixel_planner.py init \
  --template templates/pixel-planner-phase-template.md \
  --out Project-Plan.md \
  --project "My Project"
```

2) Edit your plan: fill the phases and milestone tables

3) Generate or refresh the timeline

- In place (recommended):
```bash
python3 scripts/pixel_planner.py timeline --in Project-Plan.md --in-place --basis current
```

- To a separate file first:
```bash
python3 scripts/pixel_planner.py timeline --in Project-Plan.md --out Project-Plan.out.md --basis baseline
```

- Generate as-of a specific date (for reproducible timelines):
```bash
python3 scripts/pixel_planner.py timeline --in Project-Plan.md --in-place --basis current --date 2025-03-02
```

## Sample project
- A complete example is included: [`Sample-Project-Plan.md`](./Sample-Project-Plan.md)
- Regenerate its timeline anytime:

```bash
python3 scripts/pixel_planner.py timeline --in Sample-Project-Plan.md --in-place --basis current
```

## Template rules (what the script expects)
- Timeline section
  - There must be a heading named exactly `## Project Timeline (Phases)`
  - The content under it is a fenced block (```text ... ```). The script fully rewrites this block.

- Phase sections
  - Each phase must use a heading of the form: `## Phase 01 – Phase Name` (hyphen `-` also accepted instead of the en dash `–`).

- Milestone table under each phase
  - Columns (any alignment/width). Names are matched case-insensitively by meaning:
    - Milestone | Description | Status | Baseline Plan | Current Plan | Assignee | Comments
  - Dates must be ISO `YYYY-MM-DD`. Values like `N/A`, `NA`, `TBD` are treated as empty.
  - A milestone is counted as executed only when `Status` is `Done` (case-insensitive).

## Timeline details
- Bars and weeks
  - Each `■` represents one calendar week. Bars are aligned over a global week grid spanning the earliest to latest plan dates (based on `--basis`).
  - A vertical `|` marks the effective date week.
  - Bars always close with a `]` and are clipped properly at the right edge.

- Effective date (header arrow)
  - The header shows: `┌─→ YYYY-MM-DD (X% / Y%)`
  - The effective date is today, but if today is beyond the last milestone date (across all phases), it is clamped to that last milestone date.

- Basis (which plan dates are used)
  - `--basis current` (default): position bars and compute "should-be" from Current Plan dates.
  - `--basis baseline`: use Baseline Plan dates instead.

## Percentages (progress logic)
- Header percentages (global): `X% / Y%`
  - X% = executed/total across all milestones (executed = count of `Done`).
  - Y% = planned-by-effective-date/total across all milestones, based on the chosen basis.

- Per-phase percentages: `X% / Y%`
  - X% = executed_in_phase / total_in_phase.
  - Y% = planned_by_effective_date_in_phase / total_in_phase, using the chosen basis.

- Important rule: "planned-by-effective-date" uses a strict comparison of planned date < effective date. Milestones due today are counted as should-be tomorrow (after the day passes).

- Direction indicator: ▲ if executed ≥ should-be; otherwise ▼.

## Example timeline (snippet)
```vb
                                                              ┌─→ 2025-03-02 (33% / 67%)
- Phase 01 – Install Infrastructure ▲ W 05-08 2025-01-31 to 2025-02-20 → [■ ■ ■ ■] 50% / 100%
- Phase 02 – Deploy new App ▼         W 09-09 2025-03-02 to 2025-03-02 →     |      [■] 0% / 0%
```

## Tips and gotchas
- Keep the timeline heading spelled exactly as `## Project Timeline (Phases)`
- Use correct phase heading format: `## Phase <number> – <name>` (or `-`)
- Use ISO dates. If a phase has no valid dates for the selected basis, its bar may be empty but the line still renders.
- Only `Done` marks a milestone as executed.
- The `Week` column is deprecated and ignored in parsing; you can safely remove it.

## Troubleshooting
- Timeline didn’t update
  - Check the heading and code fence (```vb) under the timeline section
- A phase didn’t show a bar
  - Ensure it has at least one valid planned date for the chosen basis
- Percentages look wrong
  - Verify `Status` values and planned dates; items due today don’t count as should-be yet

## Contributing
Improvements welcome. Please keep changes small and readable.

## License
MIT. See `LICENSE`.
