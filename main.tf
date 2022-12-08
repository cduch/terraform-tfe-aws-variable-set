
provider "tfe" {
  token    = var.apitoken
}

data "external" "env" {
  program = ["${path.module}/env.sh"]
}


resource "tfe_variable_set" "variableset" {
  name         = var.variableset_name
  description  = "Variable set applied to all workspaces."
  global       = true
  organization = var.organization_name
}

resource "tfe_variable" "awsaccesskeyid" {
  key             = "AWS_ACCESS_KEY_ID"
  value           = data.external.env.result["AWS_ACCESS_KEY_ID"]
  category        = "env"
  description     = "AWS ACCESS KEY ID"
  sensitive       = false
  variable_set_id = tfe_variable_set.variableset.id
}


resource "tfe_variable" "awssecretaccesskey" {
  key             = "AWS_SECRET_ACCESS_KEY"
  value           = data.external.env.result["AWS_SECRET_ACCESS_KEY"]
  category        = "env"
  description     = "AWS_SECRET_ACCESS_KEY"
  sensitive       = true
  variable_set_id = tfe_variable_set.variableset.id
}


resource "tfe_variable" "awssessiontoken" {
  key             = "AWS_SESSION_TOKEN"
  value           = data.external.env.result["AWS_SESSION_TOKEN"]
  category        = "env"
  description     = "AWS SESSION TOKEN"
  sensitive       = true
  variable_set_id = tfe_variable_set.variableset.id
}


resource "tfe_variable" "awssessionexpiration" {
  key             = "AWS_SESSION_EXPIRATION"
  value           = data.external.env.result["AWS_SESSION_EXPIRATION"]
  category        = "env"
  description     = "AWS SESSION Expiration"
  sensitive       = false
  variable_set_id = tfe_variable_set.variableset.id
}
