# Creates a variable set in an organization with AWS credentials from the current workspace

It uses the following ENV vars from it's own workspace and recreates them in a variable set.

written readable:

AWS_ACCESS_KEY_ID

AWS_SESSION_EXPIRATION

written as secrets:

AWS_SECRET_ACCESS_KEY

AWS_SESSION_TOKEN


## Update Credentials via Doormat and TF
```
doormat aws --account [ACCOUNTNAME] --tf-push --tf-organization [TFORG] --tf-workspace [TFWORKSPACE]
```

After you've updated the credentials, trigger a run in the workspace via TF UI.


## Security risk
This is more like a workaround, I would not recommend to use "global" credentials in production.
