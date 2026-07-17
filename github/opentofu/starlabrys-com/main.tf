resource "github_repository" "starlabrys_com" {
  name        = var.repo_name
  description = var.repo_description
  visibility  = "public"

  has_issues   = true
  has_wiki     = false
  has_projects = false

  delete_branch_on_merge = true

  # 代码由本地 git push，不由 OpenTofu 初始化
  auto_init = false
}
