# starlabrys-infra — 自身仓库授权（OpenTofu）

管理 `starlabrys-infra` 这个仓库自己的协作者授权与分支保护，让它也纳入和 `starlabrys-com` 一样的模型：`engineering` team 有 Write 权限，`main` 分支要求 PR + 1 次 approve，owner（`enforce_admins = false`）豁免。

`engineering` team **不在这里创建**，是在 [../starlabrys-com](../starlabrys-com) 模块里定义的唯一实例；本模块用 `data "github_team"` 按 slug 查询已存在的 team，避免重复创建导致冲突。

## 前置

与 [../starlabrys-com/README.md](../starlabrys-com/README.md) 相同的 starlabrys 组织专用 token（All repositories + Repositories/Administration + Organizations/Members，均为 Read and write）。

## 使用

```bash
cd github/opentofu/starlabrys-infra
export TF_VAR_github_token="github_pat_xxx"
tofu init
tofu plan
tofu apply
```

State 使用独立的 backend key（`infra/github/starlabrys-infra-access/terraform.tfstate`），和 `starlabrys-com` 模块的 state 互不影响。
