## インストール方法

1. このアプリケーションのリポジトリをクローンしてください
2. ルートディレクトリに移動し、このアプリケーションに必要な package を取得してください
   ```bash
   $ flutter pub get
   ```
3. 開発環境を立ち上げるには、以下のコマンドを実行してください

   ```bash
   $ flutter run
   ```

   このコマンドを実行した後、起動できるデバイスが表示されますので、起動したいデバイスを選んでください。

   ```bash
   # 例
   $ macOS (desktop) • macos  • darwin-arm64   • macOS 13.4.1 22F82 darwin-arm64
   $ Chrome (web)    • chrome • web-javascript • Google Chrome 114.0.5735.198

   $ No wireless devices were found.

   $ [1]: macOS "macos"
   $ [2]: Chrome "chrome"

   $ Please choose one (or "q" to quit):
   ```

   （※ただし、このアプリケーションはスマートフォンでの使用のみを想定しているため、PC デバイスで起動しても意図した使用ができないかもしれません）

## Android, iOS, linux, macos, web や windows のための設定ファイル

各環境で作成したい場合は、まずその環境をビルドして設定ファイルなどを作成してください。
