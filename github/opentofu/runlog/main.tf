resource "github_repository" "runlog" {
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

# 有意不创建 github_team_repository：
# runlog 是个人自用的跑步记录 App，仅 org owner 提交，不授予 engineering team 访问。
# 需要协作时再新增 access.tf（github_team_repository，permission = "push"）并评估权限模型。
#
# 有意不创建 github_branch_protection：
# public 仓库本可免费使用分支保护，但当前仅 org owner 一人提交，误操作风险不构成理由。
# 引入协作者时与 access.tf 一并添加，参数同 starlabrys-com：
# PR + 1 approve + branch up-to-date + enforce_admins = false。
