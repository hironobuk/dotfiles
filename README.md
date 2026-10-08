# dotfiles

## Xcode Command Line Tools

```bash
xcode-select --install
```

## Homebrew

### Mac

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Windows(WSL)

```bash
sudo apt-get update
sudo apt-get install -y build-essential procps curl file git
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

## Homebrew Packages

```bash
brew bundle
```

パッケージ新規追加などした場合に Brewfile を更新する場合は以下のコマンドで更新する。

```bash
brew bundle dump --force
```

## Runtime

```bash
mise install
```

## Docker Desktop

インストール後に以下を有効化する。

- Settings → General → Configure shell completions

## GPG Key export / import

エクスポート元で `<KEY_ID>` を対象の鍵 ID に置き換えて実行する。

```bash
gpg --armor --export <KEY_ID> > public-key.asc
gpg --armor --export-secret-keys <KEY_ID> > private-key.asc
gpg --export-ownertrust > ownertrust.txt
```

生成したファイルを安全な方法で移行し、インポート先で実行する。

```bash
gpg --import public-key.asc
gpg --import private-key.asc
gpg --import-ownertrust ownertrust.txt
```

## VS Code

- コマンドパレット（`Cmd+Shift+P`）で `Shell Command: Install 'code' command in PATH` を実行する
- Dev Container でもホスト側の Codex セッション・履歴などを利用する場合はユーザーの `settings.json` に以下を追記する

```json
{
  "remote.extensionKind": {
    "openai.chatgpt": ["ui"]
  }
}
```
