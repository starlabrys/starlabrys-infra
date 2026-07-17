# starlabrys.com — GitHub 公开仓库（OpenTofu）

用 OpenTofu 在 GitHub organization [`starlabrys`](https://github.com/starlabrys) 下创建公开仓库 `starlabrys.com`，用于存放公司官网代码。

## 前置

1. **组织专用的 fine-grained token**（与个人账号 `wiloon` 的 `GITHUB_TOKEN` 是两个独立 token，互不影响）：
   - 在 https://github.com/settings/personal-access-tokens/new 创建
   - **Resource owner** 选 `starlabrys` 组织
   - **Repository access** 选 **All repositories**（新建仓库属于"未来的仓库"，选 Public repositories 看不到）
   - **Permissions → Repositories → Administration** 设为 **Read and write**（说明文字里写着 "Repository creation, deletion, settings, teams, and collaborators"，就是这个权限）
   - **Permissions → Organizations → Members** 设为 **Read and write**（`github_team`/`github_team_membership`/`github_team_repository` 属于 Teams API，归在 Organizations 权限分组，不在 Repositories 权限列表里，需要单独勾选）
   - 通过 `TF_VAR_github_token` 环境变量传入，**不要**写入 `GITHUB_TOKEN`（那个是给 blog/rws/java-playground 等个人仓库模块用的，两者必须分开）
2. 能写 S3 state 的 AWS 凭证（`wiloon-tofu-state`，region `ap-southeast-1`）
3. 本机已安装 [OpenTofu](https://opentofu.org/)（`>= 1.6`）

## 1. 创建仓库

```bash
cd github/opentofu/starlabrys-com
export TF_VAR_github_token="github_pat_xxx"   # starlabrys 组织专用 token，仅当前 shell 生效
tofu init
tofu plan
tofu apply
```

记下输出中的 `ssh_clone_url` 或执行：

```bash
tofu output -raw ssh_clone_url
```

## 2. 推送官网代码

在官网项目根目录：

```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin "$(tofu -chdir=/path/to/starlabrys-infra/github/opentofu/starlabrys-com output -raw ssh_clone_url)"
git push -u origin main
```

## 3. 协作者授权与分支保护

`access.tf` 创建 org team `engineering`（`var.engineering_team_name`），把协作者（`var.collaborator_github_username`，默认 `ew8`）加入并授予本仓库 Write 权限；`branch-protection.tf` 给 `main` 分支加保护：PR + 至少 1 次 approve + branch 需与 base 保持最新，`enforce_admins = false`（owner 豁免，可直接 push / 直接合并；协作者必须走 PR）。

背景与决策记录在 `w10n-config`（私有个人仓库）的 `infra/github/ADR-0001-starlabrys-org-access-model.md`、`infra/github/TASK-SPEC-starlabrys-collaborator-access.md`——决策文档留在个人仓库管理，本仓库只放落地的 IaC 代码，两者是不同的 git 仓库，无法用相对路径互链。

`engineering` team 在本模块创建，是唯一定义处；其它 starlabrys 仓库（如 `starlabrys-infra`）复用同一个 team 时用 `data "github_team"` 查询，不重复创建。

## 说明

- OpenTofu **只创建空仓库**，不上传文件；推送由 `git` 完成。
- `github_owner` 默认值为 `starlabrys`（组织名），`repo_name` 默认值为 `starlabrys.com`，如需调整见 `variables.tf`。
