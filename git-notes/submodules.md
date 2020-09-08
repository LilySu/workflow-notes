#### Steps
1. removed cached
2. remove .git
3. add any additional or modified files
#### In root folder
```
git rm --cached submodule
```
#### Inside submodule
```
rm -rf .git
rm -rf .gitmodules
```