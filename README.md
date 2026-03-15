# ShareSettings

複数リポジトリで共通利用するファイルを中央管理し、GitHub Actions の Composite Action として1ステップで取得・展開できるリポジトリです。

## 利用可能な設定セット

| 設定セット | 内容 | Action パス |
|-----------|------|------------|
| `BasicCloudSkillsJP` | Claude Code スキル設定 | `HappyOnigiri/ShareSettings/BasicCloudSkillsJP@v1` |

### BasicCloudSkillsJP に含まれるファイル

- `.claude/skills/commit/SKILL.md` — コミットスキル定義

## 使い方

### BasicCloudSkillsJP を利用する

```yaml
- name: 共通設定ファイルを取得 (BasicCloudSkillsJP)
  uses: HappyOnigiri/ShareSettings/BasicCloudSkillsJP@v1
  with:
    target_dir: '.'   # 省略時のデフォルト値
```

### ワークフロー全体の例

```yaml
name: CI

on:
  push:
    branches: [main]

jobs:
  setup:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: 共通設定ファイルを取得
        uses: HappyOnigiri/ShareSettings/BasicCloudSkillsJP@v1
```

## inputs

| 入力値 | 説明 | デフォルト |
|--------|------|-----------|
| `target_dir` | 展開先ディレクトリのパス | `.` |

## ディレクトリ構成

```text
.
├── BasicCloudSkillsJP/
│   ├── action.yml
│   └── shared-files/
│       └── .claude/
│           └── skills/
│               └── commit/
│                   └── SKILL.md
└── README.md
```
