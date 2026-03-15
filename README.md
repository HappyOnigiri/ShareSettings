# ShareSettings

複数リポジトリで共通利用するファイルを中央管理し、コマンド一発で取得・展開できるリポジトリです。

## 利用可能な設定セット

| 設定セット | 内容 |
|-----------|------|
| `BasicClaudeSkillsJP` | Claude Code スキル設定 |

### BasicClaudeSkillsJP に含まれるファイル

- `.claude/skills/commit/SKILL.md` — コミットスキル定義

## 使い方

`curl` と `bash` だけでインストールできます：

```bash
curl -fsSL https://raw.githubusercontent.com/HappyOnigiri/ShareSettings/main/install.sh | bash -s -- BasicClaudeSkillsJP
```

展開先やリビジョンを指定する場合：

```bash
bash install.sh <SETTING> [TARGET_DIR] [REF]
```

| 引数 | 説明 | デフォルト |
|------|------|-----------|
| `SETTING` | 設定セット名（例: `BasicClaudeSkillsJP`） | 必須 |
| `TARGET_DIR` | 展開先ディレクトリのパス | `.` |
| `REF` | ブランチ / タグ / コミット SHA | `main` |

## ディレクトリ構成

```text
.
├── BasicClaudeSkillsJP/
│   └── shared-files/
│       └── .claude/
│           └── skills/
│               └── commit/
│                   └── SKILL.md
├── install.sh
└── README.md
```
