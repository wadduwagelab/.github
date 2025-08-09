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


# Organization-Wide Labels

## A) Install GitHub CLI (required once)

* **Windows (PowerShell)**: download from [https://cli.github.com/](https://cli.github.com/) or:

  ```powershell
  winget install --id GitHub.cli
  ```
* **macOS**:

  ```bash
  brew install gh
  ```
* **Linux (Debian/Ubuntu)**:

  ```bash
  type -p curl >/dev/null || sudo apt install curl -y
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
  sudo apt update
  sudo apt install gh -y
  ```
* **Login** after install (all OS):

  ```bash
  gh auth login
  ```

  Choose **GitHub.com** → **HTTPS** → authenticate in browser.

---

## B) Master Labels File

Keep `labels.csv` in the **.github** repo root. Example:

```csv
name,description,color
type:bug,Something isn't working,d73a4a
type:feature,New feature or request,a2eeef
type:docs,Documentation only changes,0075ca
type:data,Data-related issue or request,5319e7
type:paper,Manuscript-related work,cfd3d7
type:grant,Grant proposal-related work,0e8a16
type:question,Further information requested,d876e3
status:todo,Planned work,fef2c0
status:in-progress,Work is actively being worked on,1d76db
status:review,Ready for peer review,fbca04
status:blocked,Blocked by other tasks,b60205
P0,Highest priority,e11d21
P1,Medium priority,eb6420
P2,Lowest priority,f9d0c4
size:S,Small effort (≤1 day),bfdadc
size:M,Medium effort (≤1 week),fef2c0
size:L,Large effort (>1 week),bfe5bf
```

---

## C) Sync Labels to Any Repo (PowerShell — no bash required)

1. Open **PowerShell** in your local **.github** repo (where `labels.csv` lives).
2. Run (replace `<repo-name>`):

```powershell
$repo = "Sample-Wadduwage-Lab/<repo-name>"
Import-Csv -Path .\labels.csv | ForEach-Object {
  gh label create $_.name --description $_.description --color $_.color -R $repo 2>$null
  if ($LASTEXITCODE -ne 0) { gh label edit $_.name --description $_.description --color $_.color -R $repo }
}
```

**Example:**

```powershell
$repo = "Sample-Wadduwage-Lab/project-myexperiment"
Import-Csv -Path .\labels.csv | ForEach-Object {
  gh label create $_.name --description $_.description --color $_.color -R $repo 2>$null
  if ($LASTEXITCODE -ne 0) { gh label edit $_.name --description $_.description --color $_.color -R $repo }
}
```

This creates or updates all standard labels in that repo.
