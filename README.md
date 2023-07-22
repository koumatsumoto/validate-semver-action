# github-composite-action-template-2023

GitHub Composite Actions を新しく追加するためのテンプレート。

## ローカル環境構築

開発する上で、事前に以下のツールをインストールする。

1. Node.js
2. Docker
3. GitHub CLI
4. act

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

### 3. GitHub CLI

actでローカル環境のテストを実行するための依存。
インストール手順はこちらを参照。
https://github.com/cli/cli

```sh
gh --version  # gh version 2.32.0 (2023-07-11)
gh auth login
```

### 4. act

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

```sh
VERSION="Version 1.23.456-dev (release mode)"
VERSION="1.1.2-prerelease+meta"
VERSION="1.0.0-alpha-a.b-c-somethinglong+build.1-aef.1-its-okay"
VERSION="99999999999999999999999.999999999999999999.99999999999999999"
VERSION="1.0.0+0.build.1-rc.10000aaa-kk-0.1"
#REGEXP='s/^[^0-9]*((0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(-(0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]))*)?(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))?).*$/\1/p'

LEFT_IGNORABLE_TEXT='^[^0-9]*'
MAJOR_VERSION='(0|[1-9][0-9]*)'
MINOR_VERSION='(0|[1-9][0-9]*)'
PATCH_VERSION='(0|[1-9][0-9]*)'
VERSION_CORE="${MAJOR_VERSION}\.${MINOR_VERSION}\.${PATCH_VERSION}"
PRE_RELEASE='(-((0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*)(\.(0|[1-9][0-9]*|[0-9]*[a-zA-Z-][0-9a-zA-Z-]*))*))'
BUILD='(\+([0-9a-zA-Z-]+(\.[0-9a-zA-Z-]+)*))'
RIGHT_IGNORABLE_TEXT='.*$'

REGEXP="s/${LEFT_IGNORABLE_TEXT}(${VERSION_CORE}${PRE_RELEASE}?${BUILD}?)${RIGHT_IGNORABLE_TEXT}/\1/p"
echo $VERSION | sed -nre $REGEXP
```
