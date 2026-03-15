# ShareSettings

複数リポジトリで共通利用するファイルを中央管理し、GitHub Actions の Composite Action として1ステップで取得・展開できるリポジトリです。

## 利用可能な設定セット

| 設定セット | 内容 | Action パス |
|-----------|------|------------|
| `settingA` | ESLint・Prettier 設定 | `org/ShareSettings/settingA@v1` |
| `settingB` | ビルドスクリプト | `org/ShareSettings/settingB@v1` |

### settingA に含まれるファイル

- `.eslintrc.json` — ESLint 設定
- `.prettierrc` — Prettier 設定

### settingB に含まれるファイル

- `scripts/build.sh` — ビルドスクリプト

## 使い方

### settingA を利用する

```yaml
- name: 共通設定ファイルを取得 (settingA)
  uses: org/ShareSettings/settingA@v1
  with:
    target_dir: '.'   # 省略時のデフォルト値
```

### settingB を利用する

```yaml
- name: 共通スクリプトを取得 (settingB)
  uses: org/ShareSettings/settingB@v1
  with:
    target_dir: './scripts'
```

### ワークフロー全体の例

```yaml
name: CI

on:
  push:
    branches: [main]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: 共通 Lint 設定を取得
        uses: org/ShareSettings/settingA@v1

      - name: Lint を実行
        run: npx eslint .

  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: 共通ビルドスクリプトを取得
        uses: org/ShareSettings/settingB@v1
        with:
          target_dir: '.'

      - name: ビルドを実行
        run: bash scripts/build.sh
```

## inputs

| 入力値 | 説明 | デフォルト |
|--------|------|-----------|
| `target_dir` | 展開先ディレクトリのパス | `.` |

## ディレクトリ構成

```text
.
├── settingA/
│   ├── action.yml
│   └── shared-files/
│       ├── .eslintrc.json
│       └── .prettierrc
├── settingB/
│   ├── action.yml
│   └── shared-files/
│       └── scripts/
│           └── build.sh
└── README.md
```
