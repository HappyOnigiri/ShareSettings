# ShareSettings

複数リポジトリで共通利用するファイルを中央管理し、`curl | bash` で手元にインストールできるリポジトリです。

## 利用可能な設定セット

| 設定セット | 内容 |
|-----------|------|
| `BasicCloudSkillsJP` | Claude Code スキル設定 |

### BasicCloudSkillsJP に含まれるファイル

- `.claude/skills/commit/SKILL.md` — コミットスキル定義

## 使い方

### インストール

```bash
curl -fsSL https://raw.githubusercontent.com/HappyOnigiri/ShareSettings/main/install.sh | bash -s BasicCloudSkillsJP
```

### ref（タグ・ブランチ）を指定する場合

```bash
curl -fsSL https://raw.githubusercontent.com/HappyOnigiri/ShareSettings/main/install.sh | bash -s BasicCloudSkillsJP v2
```

## ディレクトリ構成

```text
.
├── install.sh                    # curl | bash のエントリポイント
├── BasicCloudSkillsJP/
│   ├── files.txt                 # インストール対象ファイルのマニフェスト
│   └── shared-files/
│       └── .claude/
│           └── skills/
│               └── commit/
│                   └── SKILL.md
└── README.md
```

## files.txt の規約

各設定セットのルートに `files.txt` を置き、`shared-files/` からの相対パスを1行1ファイルで記載します。
`#` で始まる行はコメントとして無視されます。

```
# コメント
.claude/skills/commit/SKILL.md
```

## 新しい設定セットを追加する

```bash
make new NAME=MySettings
```

生成されるファイル:

```text
MySettings/
├── files.txt        <- インストール対象ファイルのパスを記載
└── shared-files/    <- 配布ファイルを配置
```
