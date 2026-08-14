variable "github_owner" {
  description = "GitHub organization managed by this module"
  type        = string
  default     = "starlabrys"
}

variable "github_token" {
  description = "Fine-grained PAT scoped to the starlabrys organization. Requires Organization permissions -> Administration: Read and write (org settings are only readable/writable by org admins). Pass via TF_VAR_github_token."
  type        = string
  sensitive   = true
}

variable "billing_email" {
  description = "Organization billing email. Required by github_organization_settings. Already present in this repository's public commit history, so declaring it here adds no new exposure."
  type        = string
  default     = "wiloon.wy@gmail.com"
}
