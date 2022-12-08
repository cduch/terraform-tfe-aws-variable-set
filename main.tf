
provider "tfe" {
  token    = var.apitoken
}

data "external" "env" {
  program = ["${path.module}/env.sh"]
}

output "env" {
  value = data.external.env.result
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
  sensitive       = true
  variable_set_id = tfe_variable_set.variableset.id
}
