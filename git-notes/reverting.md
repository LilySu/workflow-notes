#### Undo the last push
`git push -f origin HEAD^:master`

#### Rebase
`git checkout master` (should have no uncommitted changes, u can stash if you do)
`git pull` (get the lastest master)
`git checkout` your branch
`git rebase` -i master
in the editor it opens (likely nano), drop all the commits that are from x, as these are already on master now. You can drop commits by changing the keep to drop or d
`git log` and review that you only see one set of x commits in the history
`git push` -f force push to update french_local branch with the changed history.



```
git log
git reset --hard <commit-id>
git branch temp
git checkout temp
git branch -f master temp
git checkout master
git branch -d temp
git push --force origin master
```