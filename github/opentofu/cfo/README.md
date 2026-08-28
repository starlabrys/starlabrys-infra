# cfo — GitHub 私有仓库（OpenTofu）

用 OpenTofu 在 GitHub organization [`starlabrys`](https://github.com/starlabrys) 下创建私有仓库 `cfo`，存放中国小微企业记账/税务方法论与 Claude Code 技能（不含凭证或财务数据，公司账套在 `starlabrys/books`）。

## 前置

与 [../starlabrys-com/README.md](../starlabrys-com/README.md) 相同的 starlabrys 组织专用 fine-grained token（Resource owner = starlabrys，Repository access = All repositories，Repositories/Administration = Read and write）。通过 `TF_VAR_github_token` 传入。

## 创建仓库

```bash
cd github/opentofu/cfo
export TF_VAR_github_token="github_pat_xxx"
tofu init
tofu plan
tofu apply
```

## 推送代码

```bash
cd /path/to/cfo         # 本地已 git init 且有 commit
git remote add origin "$(tofu -chdir=/path/to/starlabrys-infra/github/opentofu/cfo output -raw ssh_clone_url)"
git push -u origin main
```

## 说明

- **private**：按 ADR-0001 授权模型默认私有。
- State 使用独立 backend key（`infra/github/cfo/terraform.tfstate`）。
