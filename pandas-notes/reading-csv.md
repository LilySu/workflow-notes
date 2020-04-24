#### pd_read_csv options

```
df = pd.read_csv(file_path, sep=',', delimiter=None, 
                header='infer', names=None,
                index_col=None, usecols=None, squeeze=False,)

```
###### reading local .gz files
```
df = pd.read_csv(r'C:\file_path', compression='gzip', 
                 sep='\t', delimiter=None, header=0, 
                 names=None, index_col=None, usecols=None, 
                 squeeze=False, error_bad_lines=False)
```
##### by error type

###### Error tokenizing data
* look at sep = ',' maybe data is separated with something else
* [to read more on delimiters](https://thispointer.com/pandas-read-csv-file-to-dataframe-with-custom-delimiter-in-python/)