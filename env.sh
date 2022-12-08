#!/bin/sh

# env.sh

# Change the contents of this output to get the environment variables
# of interest. The output must be valid JSON, with strings for both
# keys and values.
cat <<EOF
{
  "AWS_ACCESS_KEY_ID": "$AWS_ACCESS_KEY_ID",
  "AWS_SECRET_ACCESS_KEY": "$AWS_SECRET_ACCESS_KEY",
  "AWS_SESSION_TOKEN" : "$AWS_SESSION_TOKEN",
  "AWS_SESSION_EXPIRATION" : "$AWS_SESSION_EXPIRATION"
}
EOF