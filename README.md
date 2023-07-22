# validate-semver-action

The GitHub Composite Action for validating whether the version string is correct according to Semantic Versioning.

## 使い方

### サンプルコード

```yaml
- uses: koumatsumoto/validate-semver-action@v1
  id: validate_version
  with:
    value: ${{ github.ref_name }}

- run: |
    echo "${{ steps.validate_version.outputs.raw_value }}"
    echo "${{ steps.validate_version.outputs.version }}"
    echo "${{ steps.validate_version.outputs.coerced }}"
```

## ローカル環境構築

開発する上で、事前に以下のツールをインストールする。

1. Node.js
2. Docker
3. act

### 1. Node.js

Prettierを使うためにNode.jsをインストールしておく。

```sh
node -v  # v20.2.0
npm -v   # 9.6.6
```

```sh
npx prettier . --write
```

### 2. Docker

actの依存として必要なので事前にインストールしておく。

```sh
docker -v  # Docker version 24.0.4, build 3713ee1
```

### 3. act

GitHub Actionsをローカル環境でテストするためのツール。
インストール手順はこちらを参照。
https://github.com/nektos/act

```sh
act --version  # act version 0.2.48
```

## テスト

以下のコマンドで、ローカル環境で開発したGitHub Actionsをテストできる。

```sh
act
```

actの使い方については以下を参照。
https://github.com/nektos/act#example-commands
