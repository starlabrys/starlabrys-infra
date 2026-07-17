resource "github_team" "engineering" {
  name        = var.engineering_team_name
  description = "starlabrys org 协作者团队，统一管理各仓库的 Write 权限"
  privacy     = "closed"
}

resource "github_team_membership" "collaborator" {
  team_id  = github_team.engineering.id
  username = var.collaborator_github_username
  role     = "member"
}

resource "github_team_repository" "starlabrys_com" {
  team_id    = github_team.engineering.id
  repository = github_repository.starlabrys_com.name
  permission = "push"
}
