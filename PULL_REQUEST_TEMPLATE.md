## PR Guide

Golden rule: One task = one issue = one branch = one PR (that closes the issue).

1. **Create an Issue**

   * Go to your repository → **Issues** → **New issue**.
   * Add a clear title and description.
   * Assign labels like `type:feature` or `type:bug`.
   * Submit the issue — GitHub will assign it a number (e.g., `#12`).

2. **Create a Branch for the Issue**

   * On your computer, open a terminal in your project folder.
   * Make sure you’re on `main` and updated:

     ```bash
     git checkout main
     git pull
     ```
   * Create a branch with the issue number in the name:

     ```bash
     git checkout -b feature/<short-description>-<issue-number>
     # Example:
     git checkout -b feature/csv-import-12
     ```

3. **Do Your Work**

   * Make changes to the files.
   * Test them locally to ensure they work.

4. **Commit Your Changes**

   * Stage files:

     ```bash
     git add .
     ```
   * Commit using Conventional Commit format:

     ```bash
     git commit -m "feat(loader): add CSV import support"
     ```
   * To auto-close the linked issue when PR merges:

     ```bash
     git commit -m "feat(loader): add CSV import support\n\nCloses #12"
     ```

5. **Push Your Branch**

   ```bash
   git push -u origin feature/csv-import-12
   ```

6. **Open a Pull Request**

   * On GitHub, you’ll see a prompt to open a PR.
   * Choose your branch as the compare branch, `main` as the base.
   * Fill out the PR template (below).

---

## Pull Request

### Summary

* **What changed?** List the main changes in this PR.
* **Why?** Explain the reason for these changes and the problem they solve.

### Related Issues

* Closes #\_\_\_  (use “Closes” to auto-close when merged)
* Related to #\_\_\_  (use “Related to” if it shouldn’t close)

### Changes Made

* [ ] Code changes (features/fixes)
* [ ] Documentation updates
* [ ] Data/figure updates
* [ ] Tests added or updated
* [ ] Other (specify: \_\_\_\_\_\_\_\_\_\_)

### Checklist

* [ ] I created/linked an **issue** for this PR
* [ ] Followed **branch naming convention** (`feature/<slug>-<issue#>`)
* [ ] Commit messages follow **Conventional Commits**
* [ ] Updated documentation/README where needed
* [ ] Verified data/figures are reproducible
* [ ] Documented breaking changes (if any)
* [ ] All tests pass locally (if applicable)
* [ ] Code is clean, commented, and linted
* [ ] Requested at least **1 reviewer**

### Screenshots / Visuals (if applicable)

* Add before/after screenshots, diagrams, or charts.

### Steps to Test

1. List setup steps.
2. Include commands or scripts.
3. Explain expected results.

### Additional Notes for Reviewer

* Highlight specific files, functions, or logic to review.
* Mention dependencies, migrations, or follow-ups after merge.

