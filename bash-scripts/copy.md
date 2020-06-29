xcopy source destination /E /C /H /R /K /O /Y

/E    Copies directories and subdirectories, including empty ones.
      Same as /S /E. May be used to modify /T.
/C    Continues copying even if errors occur.
/H    Copies hidden and system files also.
/R    Overwrites read-only files.
/K    Copies attributes. Normal Xcopy will reset read-only attributes.
/O    Copies file ownership and ACL information.
/Y    Suppresses prompting to confirm you want to overwrite an
      existing destination file.