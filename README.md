# ShareSettings

複数リポジトリで共通利用するファイルを中央管理し、コマンド一発で取得・展開できるリポジトリです。

## 利用可能な設定セット

| 設定セット | 内容 |
|-----------|------|
| `InstallBasicClaudeSkillsJP` | Claude Code スキル設定 |
| `SyncRule` | `.ai/skills` を各ツール `skills/` へ同期し `AGENTS.md` / `CLAUDE.md` を更新 |

## 使い方

各設定セットの `run.sh` を `curl | bash` でワンライナー実行できます：

### InstallBasicClaudeSkillsJP

Claude Code スキルファイル（`.claude/skills/`）を配布します。

```bash
curl -fsSL https://raw.githubusercontent.com/HappyOnigiri/ShareSettings/main/InstallBasicClaudeSkillsJP/run.sh | bash
```

含まれるファイル：
- `.claude/skills/commit/SKILL.md` — コミットスキル定義

### SyncRule

cwd の `.ai/skills/` を各 AI ツールの `skills/` ディレクトリへ同期し、`.ai/AGENTS.md` を `AGENTS.md` と `CLAUDE.md` として配置します。

```bash
curl -fsSL https://raw.githubusercontent.com/HappyOnigiri/ShareSettings/main/SyncRule/run.sh | bash
```

同期先：`.claude/skills/`、`.cursor/skills/`、`.agent/skills/`

## ディレクトリ構成

```text
.
├── InstallBasicClaudeSkillsJP/
│   ├── run.sh
│   └── shared-files/
│       └── .claude/
│           └── skills/
│               └── commit/
│                   └── SKILL.md
├── SyncRule/
│   └── run.sh
└── README.md
```

## 新しい設定セットの追加

```bash
make new NAME=<setting-name>
```
