# Agent Project Mode Skill

Lightweight project workflow for solo builders using AI coding agents.

Agent Project Mode Skill gives Codex or Claude Code a concrete project operating loop: classify the task, plan only when useful, build in safe slices, verify explicitly, and leave resumable state inside your repository.

English | [中文](#中文)

## Why

Most solo developers do not need a heavy project management system. They do need a reliable way to keep an AI coding agent aligned with:

- project context
- current task state
- acceptance criteria
- verification rules
- checkpoints and resume notes

Agent Project Mode gives you that structure without turning your solo project into a heavy process.

## What The Skill Adds

This is not just a set of project files. The files are the persistence layer. The skill itself teaches the agent how to run the work:

- **Task routing**: decide whether a request should be handled as Fast Track, Guided Flow, or Deep Flow.
- **Work modes**: move through Planner, Designer, Builder, Verifier, and Shipper responsibilities without pretending there is a full team.
- **Acceptance discipline**: turn feature requests into clear acceptance criteria before implementation when the task needs it.
- **Verification strategy**: choose what should be checked before editing, then run a separate verification pass for medium and high-risk work.
- **Deep task decomposition**: split broad work into workstreams, dependencies, checkpoints, and safe implementation slices.
- **Resume protocol**: leave compact checkpoints and next steps so tomorrow's session can continue from the repo, not from memory.

The core idea is simple: Project Mode makes good solo-builder habits the agent's default behavior.

On a real request, the agent should not jump straight from prompt to patch. It should choose the lightest safe path, define the finish line, implement, verify, and record what changed.

## Work Modes At A Glance

Project Mode uses these as work modes, not personas. One agent can move between them as the task changes, and small tasks may only need one or two modes.

| Mode | Responsibility | Best Used For |
| --- | --- | --- |
| **Planner** | Clarify scope, split work, set priority, and define acceptance. | Turning an idea into a safe, executable task. |
| **Designer** | Shape user flow, UI/UX details, copy, and design review. | Making a feature clear, usable, and coherent. |
| **Builder** | Create the technical plan, implement the code, and self-test. | Turning the agreed task into working software. |
| **Verifier** | Define test scope, challenge assumptions, and look for regressions or missed files. | Confirming the work is actually complete. |
| **Shipper** | Handle deployment, health checks, release notes, and rollback notes. | Safely delivering changes when release risk matters. |

## What You Get

- A lightweight execution system for routing, planning, building, verifying, shipping, and resuming work.
- `AGENTS.md` for shared coding-agent rules, commands, and guardrails.
- `CLAUDE.md` for Claude Code memory that imports `AGENTS.md`.
- `.project-mode/project.md` for stable product context.
- `.project-mode/board.json` for task state, workstreams, checkpoints, acceptance criteria, and verification strategy.
- `.project-mode/decisions.md` for decisions worth preserving.
- `.project-mode/comms.jsonl` for compact execution history.

## Install For Codex

Install the skill with Codex's built-in skill installer:

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo kakarorkaka/agent-project-mode-skill \
  --path skills/project-mode
```

Restart Codex after installation.

## Install For Claude Code

Install as a personal Claude Code skill:

```bash
git clone https://github.com/kakarorkaka/agent-project-mode-skill.git
mkdir -p ~/.claude/skills
cp -R agent-project-mode-skill/skills/project-mode ~/.claude/skills/project-mode
```

Start a new Claude Code session after installation.

Claude Code plugin packaging is a good next distribution step. The current repository already uses the same `SKILL.md` skill structure, so the core workflow is platform-neutral.

## Initialize A Project

From your project root:

```bash
~/.codex/skills/project-mode/scripts/init-project-mode.sh .
```

If installed for Claude Code:

```bash
~/.claude/skills/project-mode/scripts/init-project-mode.sh .
```

This creates:

```text
AGENTS.md
CLAUDE.md
.project-mode/project.md
.project-mode/board.json
.project-mode/decisions.md
.project-mode/comms.jsonl
```

Your repo will look like this:

```text
your-project/
├── AGENTS.md
├── CLAUDE.md
└── .project-mode/
    ├── board.json
    ├── comms.jsonl
    ├── decisions.md
    ├── project.md
    ├── deploy-reports/
    ├── prd/
    └── qa-reports/
```

## Routing Modes

- **Fast Track**: small, low-risk changes that should be executed directly.
- **Guided Flow**: the default mode for features, bugfixes, and scoped improvements.
- **Deep Flow**: broader or riskier work that benefits from decomposition, checkpoints, and stronger verification.

## Example Repository Walkthrough

Imagine a solo developer working on a small SaaS admin app called `acme-dashboard`.

1. Initialize the repo.

```bash
cd acme-dashboard
~/.codex/skills/project-mode/scripts/init-project-mode.sh .
```

2. Fill in project rules and context.

- Add real commands to `AGENTS.md`, such as `pnpm dev`, `pnpm test`, and `pnpm lint`.
- Add stable product context to `.project-mode/project.md`.

3. Start Project Mode in Codex or Claude Code.

```text
Enable project mode
```

Or:

```text
启用项目模式
```

4. Add a normal feature request.

```text
Feature request: add data export to the settings page. First break down the work and define acceptance criteria, then start implementation.
```

Agent Project Mode should then:

- read `AGENTS.md`, `CLAUDE.md` when relevant, and `.project-mode/`
- classify the task as Fast Track, Guided Flow, or Deep Flow
- create or update a task in `board.json`
- define acceptance criteria and a verification plan
- implement in safe slices
- update changed files, test commands, checkpoints, and resume notes

5. Resume the next day.

```text
Continue the current project task from Agent Project Mode state.
```

The agent should use `.project-mode/board.json` and `.project-mode/decisions.md` to recover context instead of rebuilding everything from scratch.

## Sample `board.json` Entry

```json
{
  "id": "TASK-003",
  "type": "feature",
  "title": "Add settings export flow",
  "status": "building",
  "owner": "builder",
  "priority": "medium",
  "risk_level": "medium",
  "execution_mode": "guided_flow",
  "parallelizable": false,
  "verification_strategy": [
    "test_suite",
    "ui_review",
    "manual_smoke"
  ],
  "checkpoint": "Export button wired to API, CSV naming still needs cleanup.",
  "resume_notes": "Next step: finish empty-state UX and rerun settings page smoke test."
}
```

## Common Prompts

```text
Enable project mode
```

```text
Feature request: help me build xxx
```

```text
Quick fix: patch xxx
```

```text
Deep task: help me complete xxx
```

```text
Project patrol
```

## Design Principles

- **Smallest sufficient process**: do not turn every change into ceremony.
- **Readable state over hidden state**: humans should be able to inspect and edit workflow files directly.
- **Verification is part of the work**: implementation is not complete until the risky surfaces are checked.
- **Tomorrow matters**: broad tasks should leave a clear checkpoint for the next session.

## 中文

Agent Project Mode Skill 是一个面向个人开发者的轻量项目工作流，适用于 Codex 和 Claude Code 等 AI 编程 Agent。

它的目标不是变成复杂的项目管理系统，而是给 AI Agent 装上一套具体的项目执行回路：先判断任务复杂度，只在必要时规划，按安全的小步实现，明确验证，并把可恢复的状态留在仓库里。

## 为什么需要它

很多个人开发者不需要一套很重的 PM 系统，但确实需要一种方式，让 AI Agent 始终知道：

- 当前项目目标是什么
- 现在正在做哪件事
- 验收标准是什么
- 需要怎么验证
- 中断后下一步从哪里继续

Agent Project Mode 用一套轻量流程解决这些问题，不把个人项目拖进重流程。

## 这个 Skill 内置了什么

它不只是一组项目文件。文件只是状态载体，真正有价值的是 Skill 内置的执行方式：

- **任务路由**：先判断请求应该走 Fast Track、Guided Flow 还是 Deep Flow。
- **工作模式**：在 Planner、Designer、Builder、Verifier、Shipper 之间切换职责，但不假装你真的有一个完整团队。
- **验收纪律**：把正式需求先转成清晰的验收标准，再进入实现。
- **验证策略**：在动手前想清楚要验证什么，中高风险任务实现后再做独立验证。
- **深度任务拆解**：把大任务拆成工作流、依赖、检查点和安全的小步实现。
- **恢复协议**：留下精简检查点和下一步说明，让第二天可以从仓库状态继续，而不是重新靠聊天记录猜。

一句话：Project Mode 把个人开发者本来就该有的好习惯，变成 Agent 的默认工作方式。

面对真实需求时，Agent 不应该从一句提示词直接跳到改代码。它应该先选择最轻但安全的路径，定义完成标准，执行实现，完成验证，并记录这次改动留下的状态。

## 工作模式速览

Project Mode 把这些当成工作模式，而不是虚拟人格。一个 Agent 会根据任务阶段切换不同职责，小任务也可以只用其中一两个模式。

| 模式 | 职责 | 适合场景 |
| --- | --- | --- |
| **Planner** | 澄清范围、拆分任务、设定优先级、定义验收标准。 | 把想法变成可以安全开工的任务。 |
| **Designer** | 梳理用户流程、交互细节、文案和设计检查。 | 让功能变得清楚、好用、有一致体验。 |
| **Builder** | 制定技术方案、实现代码、完成自测。 | 把已经明确的任务落成可运行的软件。 |
| **Verifier** | 定义测试范围、挑战假设、检查回归和遗漏文件。 | 确认任务不只是“写完了”，而是真的完成。 |
| **Shipper** | 处理部署、健康检查、发布说明和回滚说明。 | 在有发布风险时安全交付改动。 |

## 你会得到什么

- 一套轻量执行系统：路由、规划、实现、验证、交付和恢复。
- `AGENTS.md`：给所有编程 Agent 看的项目规则、命令和边界。
- `CLAUDE.md`：给 Claude Code 的项目记忆文件，会导入 `AGENTS.md`。
- `.project-mode/project.md`：稳定的产品和项目上下文。
- `.project-mode/board.json`：任务状态、工作流、检查点、验收标准和验证策略。
- `.project-mode/decisions.md`：值得长期保留的重要决策。
- `.project-mode/comms.jsonl`：轻量执行记录。

## 在 Codex 中安装

使用 Codex 自带的 skill installer：

```bash
python3 ~/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py \
  --repo kakarorkaka/agent-project-mode-skill \
  --path skills/project-mode
```

安装后重启 Codex。

## 在 Claude Code 中安装

作为 Claude Code 的个人 skill 安装：

```bash
git clone https://github.com/kakarorkaka/agent-project-mode-skill.git
mkdir -p ~/.claude/skills
cp -R agent-project-mode-skill/skills/project-mode ~/.claude/skills/project-mode
```

安装后开启一个新的 Claude Code 会话。

后续可以继续把它打包成 Claude Code plugin。当前仓库已经使用 `SKILL.md` 目录结构，核心工作流本身是平台中立的。

## 初始化项目

在你的项目根目录执行：

```bash
~/.codex/skills/project-mode/scripts/init-project-mode.sh .
```

如果是 Claude Code 安装路径：

```bash
~/.claude/skills/project-mode/scripts/init-project-mode.sh .
```

初始化会创建：

```text
AGENTS.md
CLAUDE.md
.project-mode/project.md
.project-mode/board.json
.project-mode/decisions.md
.project-mode/comms.jsonl
```

## 任务路由模式

- **Fast Track**：低风险小改动，直接执行。
- **Guided Flow**：默认模式，适合功能、bugfix 和有明确范围的改进。
- **Deep Flow**：适合较大、跨文件、跨模块或高风险任务，会先拆分、设置检查点并加强验证。

## 示例流程

假设你在做一个叫 `acme-dashboard` 的 SaaS 后台项目。

1. 初始化项目。

```bash
cd acme-dashboard
~/.codex/skills/project-mode/scripts/init-project-mode.sh .
```

2. 补充项目规则和上下文。

- 在 `AGENTS.md` 里写清楚真实命令，例如 `pnpm dev`、`pnpm test`、`pnpm lint`。
- 在 `.project-mode/project.md` 里写清楚产品目标、用户、核心流程和当前版本重点。

3. 在 Codex 或 Claude Code 里启用项目模式。

```text
启用项目模式
```

4. 提一个正式需求。

```text
正式需求：为设置页面增加导出数据功能。先帮我拆任务、定义验收标准，再开始实现。
```

Agent Project Mode 应该会：

- 读取 `AGENTS.md`、必要时读取 `CLAUDE.md`，以及 `.project-mode/`
- 判断任务应该走 Fast Track、Guided Flow 还是 Deep Flow
- 在 `board.json` 里创建或更新任务
- 定义验收标准和验证计划
- 按小步实现
- 更新变更文件、测试命令、检查点和恢复说明

5. 第二天继续。

```text
继续当前 Agent Project Mode 任务
```

Agent 应该根据 `.project-mode/board.json` 和 `.project-mode/decisions.md` 恢复上下文，而不是重新猜一遍项目状态。

## 常用提示词

```text
启用项目模式
```

```text
正式需求：我要做 xxx
```

```text
快速处理：帮我改一下 xxx
```

```text
深度任务：帮我完成 xxx
```

```text
项目巡检
```

## 设计原则

- **最小必要流程**：小任务不要被流程拖慢。
- **状态放回仓库**：人类可以直接阅读、修改、提交这些状态文件。
- **验证是工作的一部分**：实现完不等于完成，关键风险面必须被检查。
- **明天还能继续**：大任务必须留下清晰的检查点。
