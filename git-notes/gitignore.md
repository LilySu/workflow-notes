Run these to put larger files into a gitignore

`find * -size +100M  | cat >> .gitignore`

cmd
`forfiles /s /c "cmd /q /c if @fsize GTR 1073741824 echo @relpath" >> .gitignore`