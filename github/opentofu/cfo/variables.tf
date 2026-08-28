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
  default     = "cfo"
}

variable "repo_description" {
  description = "Short repository description shown on GitHub"
  type        = string
  default     = "China small-business CFO methodology and Claude Code skills (small-scale VAT taxpayer)"
}
