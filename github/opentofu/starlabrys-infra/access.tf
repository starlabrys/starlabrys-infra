data "github_team" "engineering" {
  slug = var.engineering_team_name
}

resource "github_team_repository" "starlabrys_infra" {
  team_id    = data.github_team.engineering.id
  repository = var.repo_name
  permission = "push"
}
