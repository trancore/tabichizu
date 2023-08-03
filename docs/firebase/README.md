## Firebase の AdMob について

このアプリケーションでは、firebase の AdMob を使用しています。

そのため、広告表示のためにアプリ ID、広告ユニット ID を設定する必要があります。

firebase コンソール上での設定の仕方は、公式のドキュメントや実際のコンソールを見て設定してください。

- [AdMob の登録 - Google AdMob](https://admob.google.com/intl/ja/home/)

そして、この Firebase のプロジェクトと、この Flutter アプリケーションとの紐付けを行なってください。

### 紐付け方法

以下コマンドを実行して firebase にログインしてください。

```bash
$ npm install -g firebase-tools
$ firebase login
```

次に、以下のコマンドを実行してパスを通し、プロジェクトの設定を行なってください。

```bash
$ dart pub global activate flutterfire_cli

# flutterfireコマンドを実行するためにパスを通す
$ vim ~/.zshrc

# 以下を追記
export PATH=$PATH:Users/{ユーザー名}/.pub-cache/bin
# 反映
source ~/.zshrc
```

最後に、Firebase のプロジェクトと、この Flutter アプリケーションとの紐付けを、プロジェクトのルートディレクトリで以下コマンドで実行します。

```bash
$ flutterfire configure --project={firebaseのプロジェクト名}
```

### アプリ ID と広告ユニット ID について

#### 広告ユニット ID

まず、広告ユニット ID は、Android と iOS で別々で作成します。
そして、`.env`ファイルにてそれぞれ管理します。

そのため、以下のように設定してください。

```.env
ADMOB_ANDROID_ADVERTISEMENT_ID={実際の広告ユニットIDを記載してください}
ADMOB_IOS_ADVERTISEMENT_ID={実際の広告ユニットIDを記載してください}
```

#### アプリ ID

アプリ ID も Android と iOS で別々で作成してください。

##### Android の場合

Android のための環境設定ファイルは、`/android/secret.properties`で管理しています。

アプリ ID は、以下のように記載してください。

```properties
adMob.appId={実際のアプリIDを記載してください}
```

##### iOS の場合

iOS のための環境設定ファイルは、`/ios/Runner/Environment.swift`で管理しています。

アプリ ID は、以下のように記載してください。

```swift
import Foundation

struct Env {
  static let adMobAppId = "{実際のアプリIDを記載してください}"
}
```

また、iOS の場合、`/ios/Runner/info.plist`にアプリ ID を以下のように記載する必要があります。

```plist
<dict>
   ...
   <key>GADApplicationIdentifier</key>
   <string>{実際のアプリIDを記載してください}</string>
   ...
</dict>
```
