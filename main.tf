
provider "tfe" {
  token    = var.apitoken
}

data "external" "env" {
  program = ["${path.module}/env.sh"]
}

output "env" {
  value = data.external.env.result
}

resource "tfe_organization" "organization" {
  name  = var.organization_name
  email = var.organization_email
}

resource "tfe_variable_set" "variableset" {
  name         = var.variableset_name
  description  = "Variable set applied to all workspaces."
  global       = true
  organization = tfe_organization.organization.name
}

resource "tfe_variable" "awsaccesskeyid" {
  key             = "AWS_ACCESS_KEY_ID"
  value           = data.external.env.result["AWS_ACCESS_KEY_ID"]
  category        = "env"
  description     = "AWS ACCESS KEY ID"
  sensitive       = true
  variable_set_id = tfe_variable_set.variableset.id
}
