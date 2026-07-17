resource "github_branch_protection" "main" {
  repository_id = var.repo_name
  pattern       = "main"

  required_pull_request_reviews {
    required_approving_review_count = 1
  }

  # "Require branches to be up to date before merging"
  required_status_checks {
    strict   = true
    contexts = []
  }

  # owner (wiloon) 豁免于以上规则，可直接 push / 直接合并；
  # 协作者（无 admin 权限）仍必须走 PR + 1 次 approve
  enforce_admins = false
}
