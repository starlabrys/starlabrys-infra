# starlabrys-infra

Starlabrys 公司基础设施代码（OpenTofu）。本仓库是**公开**的，只放不含凭证的落地 IaC 代码。

决策文档（ADR 与 TASK-SPEC）在私有仓库 `starlabrys/ops` 的 `docs/github/` 下——本仓库只放落地代码，两者是不同的 git 仓库，无法用相对路径互链。

## 目录结构

```
github/
└── opentofu/
    ├── org-settings/        # 管理 starlabrys organization 级设置（base permission 等）
    ├── starlabrys-com/      # 管理 starlabrys/starlabrys-com 仓库（官网）：仓库属性、engineering team 定义、协作者授权、分支保护
    └── starlabrys-infra/    # 管理本仓库自己的授权与分支保护（复用 starlabrys-com 模块里定义的 engineering team）
```

> ⚠️ `org-settings` 模块用 `github_organization_settings`，该资源**接管整个 org 设置块**：未显式声明的可选字段会被 provider 默认值覆盖。新增字段前务必先读线上现值，详见该模块 `main.tf` 内注释。

按 `<provider>/opentofu/<module>` 组织，为未来非 GitHub 的公司基础设施（AWS、DNS 等）预留同级空间，例如将来可能新增 `aws/opentofu/...`。

## 协作方式

仓库由 `engineering` team 管理，team 成员对本仓库有 Write 权限；`main` 分支要求 PR + 至少 1 次 approve 才能合并；仓库 owner 不受此限制，可以直接合并（`enforce_admins = false`）。

各模块独立 state（S3 backend `wiloon-tofu-state`），进入对应目录后：

```bash
export TF_VAR_github_token="github_pat_xxx"   # starlabrys 组织专用 token
tofu init
tofu plan
tofu apply
```
