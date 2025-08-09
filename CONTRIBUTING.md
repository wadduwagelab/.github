# Contributing Guidelines

## Workflow
1. Branch from `main` → use `feature/<slug>` / `fix/<slug>` / `docs/<slug>` / `paper/<slug>` / `grant/<slug>`
2. Commit with Conventional Commits: `type(scope): short summary`
3. Open a Draft PR early; convert to Ready when done
4. One reviewer minimum; squash merge into `main`

## Commit Types
`feat`, `fix`, `docs`, `refactor`, `style`, `perf`, `test`, `chore`, `revert`

## Pull Requests
- Link issues in title/body (`Closes #12`).
- Keep PRs focused (< ~300 LOC when possible).
- Update README/docs when behavior changes.

## Data & Figures
- Never commit private raw data.
- Generate figures via scripts in `paper/analysis/`; export finals to `paper/figures/`.
