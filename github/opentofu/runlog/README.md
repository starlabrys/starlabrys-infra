# runlog — GitHub 公开仓库（OpenTofu）

用 OpenTofu 在 GitHub organization [`starlabrys`](https://github.com/starlabrys) 下创建公开仓库 `runlog`，存放个人自用的跑步记录 App（iPhone + Apple Watch，Keep 替代品）。

## 前置

与 [../starlabrys-com/README.md](../starlabrys-com/README.md) 相同的 starlabrys 组织专用 fine-grained token（Resource owner = starlabrys，Repository access = All repositories，Repositories/Administration = Read and write）。通过 `TF_VAR_github_token` 传入。

## 创建仓库

```bash
cd github/opentofu/runlog
export TF_VAR_github_token="github_pat_xxx"
tofu init
tofu plan
tofu apply
```

## 推送代码

```bash
cd /path/to/runlog       # 本地已 git init 且有 commit
git remote add origin "$(tofu -chdir=/path/to/starlabrys-infra/github/opentofu/runlog output -raw ssh_clone_url)"
git push -u origin main
```

## 说明

- **public**：`AGPL-3.0`（与 `enx` 一致）。仓库内容无凭证。
- **仅 org owner 提交**：有意不关联 `engineering` team、不加分支保护（见 `main.tf` 注释）。需要协作时再新增 `access.tf` + `branch-protection.tf`。
- State 使用独立 backend key（`infra/github/runlog/terraform.tfstate`）。
- 决策记录：`starlabrys/ops` 的 `docs/github/ADR-0002-runlog-repo.md`（不同 git 仓库，无法相对链接）。
