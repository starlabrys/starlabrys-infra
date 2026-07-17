# starlabrys-infra

Starlabrys 公司基础设施代码（OpenTofu），从个人私有仓库 `w10n-config` 迁移而来。决策背景见 `w10n-config` 仓库的 `infra/github/ADR-0001-starlabrys-org-access-model.md` 与相关 TASK-SPEC（决策文档留在个人仓库管理，本仓库只放落地的 IaC 代码）。

## 目录结构

```
github/
└── opentofu/
    ├── starlabrys-com/      # 管理 starlabrys/starlabrys-com 仓库（官网）：仓库属性、engineering team 定义、协作者授权、分支保护
    └── starlabrys-infra/    # 管理本仓库自己的授权与分支保护（复用 starlabrys-com 模块里定义的 engineering team）
```

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
