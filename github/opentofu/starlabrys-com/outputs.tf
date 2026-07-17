output "repository_name" {
  description = "GitHub repository name"
  value       = github_repository.starlabrys_com.name
}

output "html_url" {
  description = "Repository page URL"
  value       = github_repository.starlabrys_com.html_url
}

output "ssh_clone_url" {
  description = "SSH clone URL for git remote"
  value       = github_repository.starlabrys_com.ssh_clone_url
}

output "git_remote_add" {
  description = "Command to add origin after first local commit"
  value       = "git remote add origin ${github_repository.starlabrys_com.ssh_clone_url}"
}
