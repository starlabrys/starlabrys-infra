resource "github_repository" "cfo" {
  name        = var.repo_name
  description = var.repo_description

  # private：公司自用的记账/税务方法论。不含凭证或财务数据，但按 ADR-0001 授权模型
  # 默认私有。代价是免费方案下无法使用分支保护——本仓库仅 org owner 提交。
  visibility = "private"

  has_issues   = true
  has_wiki     = false
  has_projects = false

  delete_branch_on_merge = true

  # 代码由本地 git push，不由 OpenTofu 初始化
  auto_init = false
}

# 有意不创建 github_team_repository：
# 免费方案下私有仓库无分支保护，
# 授予 push 等同于近乎完全控制。需要协作时再显式添加并同时评估权限模型。
#
# 有意不创建 github_branch_protection：
# 免费 org 方案下私有仓库不支持；本仓库仅 org owner 提交。
