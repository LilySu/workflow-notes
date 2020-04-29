#### List contents in bucket
```
aws s3 ls s3://<bucket name> --recursive --human-readable --summarize
```

#### Copy bucket contents to local directory
```
aws s3 cp s3://<bucket name> ./ --recursive --exclude <file>.csv
```

