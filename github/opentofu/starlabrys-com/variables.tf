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
  description = "Repository name (lowercase recommended)"
  type        = string
  default     = "starlabrys.com"
}

variable "repo_description" {
  description = "Short repository description shown on GitHub"
  type        = string
  default     = "Starlabrys company website"
}

variable "collaborator_github_username" {
  description = "GitHub username of the collaborator granted Write access via the engineering team"
  type        = string
  default     = "ew8"
}

variable "engineering_team_name" {
  description = "Name of the org team used to grant repo access to collaborators (shared across starlabrys repos)"
  type        = string
  default     = "engineering"
}
