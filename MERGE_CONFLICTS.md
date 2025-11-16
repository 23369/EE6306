# Resolving the README.md / SUMMARY.md conflicts

You mentioned that GitHub refuses to merge the PR because both `README.md` and `SUMMARY.md` conflict with
`main`, and you just want to keep **your current branch exactly as-is**. The easiest way to do that is to
rewrite the branch on top of the latest `main`, while telling Git to prefer your version whenever a conflict
appears.

```bash
# 1. Grab the latest copy of the base branch.
git fetch origin main

# 2. Make sure you are on the branch that backs your PR (replace `work` if you used another name).
git checkout work

# 3. Replay your commits on top of the fresh base.
#    This will stop as soon as README.md / SUMMARY.md conflict.
git rebase origin/main
```

When the rebase stops, confirm which files conflict:

```bash
git status
```

For every file where you want to keep **your** version (e.g., you deleted `README.md` intentionally), run:

```bash
git checkout --ours README.md   # repeat for every conflicting file you want to keep
```

If instead you ever wanted the copy from `main`, the command would be `git checkout --theirs README.md`.
After picking the side you want, stage the file so Git knows the conflict is resolved:

```bash
git add README.md SUMMARY.md
```

Continue the rebase; Git will move on to the next commit (or finish if there are no more):

```bash
git rebase --continue
```

Once the rebase completes, double-check everything looks right and push the rebased history to your PR branch,
overwriting the old version on GitHub:

```bash
git status            # should show “nothing to commit”
git push --force-with-lease origin work
```

That `--force-with-lease` push tells GitHub “use my current branch exactly; ignore the previous conflicted
version,” which removes the conflict banner on the PR.
