# terraform-tfe-aws-variable-set
create a variable set with AWS credentials dynamically.

It uses the following ENV vars from it's own workspace and recreates them in a variable set.

written readable:
AWS_ACCESS_KEY_ID
AWS_SESSION_EXPIRATION

written as secrets:
AWS_SECRET_ACCESS_KEY
AWS_SESSION_TOKEN

## Security risk
This is just a workaround, don't use in production.
