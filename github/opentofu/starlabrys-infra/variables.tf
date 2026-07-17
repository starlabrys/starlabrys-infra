variable "github_owner" {
  description = "GitHub user or organization that owns the repository"
  type        = string
  default     = "starlabrys"
}

variable "github_token" {
  description = "Fine-grained PAT scoped to the starlabrys organization (Resource owner = starlabrys). Independent from the personal-account GITHUB_TOKEN used by other modules; pass via TF_VAR_github_token."
  type        = string
  sensitive   = true
}

variable "repo_name" {
  description = "Name of this repository (starlabrys-infra itself)"
  type        = string
  default     = "starlabrys-infra"
}

variable "engineering_team_name" {
  description = "Slug of the shared org team (defined once in github/opentofu/starlabrys-com, looked up here via data source)"
  type        = string
  default     = "engineering"
}
