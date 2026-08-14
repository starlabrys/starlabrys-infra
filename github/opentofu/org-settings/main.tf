# starlabrys organization 级设置。
#
# ⚠️ 本资源接管**整个** org 设置块：任何未在此显式声明的可选字段，provider 都会
# 用自己的默认值覆盖线上值。因此下面逐字段抄录了 2026-08-14 从 GitHub API 读到的
# 实际值，唯一有意变更的是 default_repository_permission。
# 新增字段时务必先读线上值再声明，不要留空。

resource "github_organization_settings" "starlabrys" {
  billing_email = var.billing_email

  # ⬇️ 唯一的有意变更：read -> none
  #
  # 原值 "read" 会让所有 org 成员自动获得每个仓库（**含私有仓库**）的读权限，
  # 绕过 engineering team 授权模型，与「私有仓库仅 org owner 可访问」的要求冲突。
  #
  # 改为 "none" 后，权限只能来自 team 关联或显式授予；经 team 取得的既有
  # Write 权限不受影响（已验证）。
  default_repository_permission = "none"

  # ⬇️ 以下均为线上现值，抄录以防被 provider 默认值覆盖
  members_can_create_repositories         = true
  members_can_create_public_repositories  = true
  members_can_create_private_repositories = true
  members_can_create_pages                = true
  members_can_create_public_pages         = true
  members_can_create_private_pages        = true
  members_can_fork_private_repositories   = false
  web_commit_signoff_required             = false

  has_organization_projects = true
  has_repository_projects   = true

  advanced_security_enabled_for_new_repositories               = false
  dependabot_alerts_enabled_for_new_repositories               = false
  dependabot_security_updates_enabled_for_new_repositories     = false
  dependency_graph_enabled_for_new_repositories                = false
  secret_scanning_enabled_for_new_repositories                 = false
  secret_scanning_push_protection_enabled_for_new_repositories = false

  # members_can_create_internal_repositories 线上为 false，但 internal 仓库仅
  # GitHub Enterprise 可用，免费方案下声明该字段可能被 API 拒绝，故不声明。
  #
  # name / description / company / blog / location / email / twitter_username
  # 线上均未设置，保持不声明。
}
