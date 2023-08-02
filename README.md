<div style="text-align: center;">
<img src="assets/images/icons/icon_1024.png" alt="tabichizu_logo" width="64"/>
<h1>
tabichizu
</h1>
</div>

---

<div style="text-align: center;">
<img src="docs/images/account-page.png" alt="tabichizu_logo" width="30%"/>
<img src="docs/images/home-page.png" alt="tabichizu_logo" width="30%"/>
<img src="docs/images/visited-page.png" alt="tabichizu_logo" width="30%"/>
</div>

## はじめに

このアプリは、Dart, Flutter の勉強のために個人開発したアプリです。

そのため、**稚拙なアーキテクト設計や実装を行っている場合**があります。

## このアプリについて

このアプリでは、以下のことができます。

- ユーザー情報(ユーザー名、カラーテーマ)の設定
- Places API を使った場所の検索、サジェスト、地図の表示
- 検索した場所の登録、削除

## 主な技術要件

| tech                                                                                    | Version |
| --------------------------------------------------------------------------------------- | ------- |
| VScode                                                                                  | 1.80.1  |
| Dart                                                                                    | 3.0.5   |
| Flutter                                                                                 | 3.10.5  |
| [Hive](https://docs.hivedb.dev/#/)                                                      | 2.2.3   |
| [Places API](https://developers.google.com/maps/documentation/places/web-service?hl=ja) | -       |
| [Maps API](https://developers.google.com/maps/documentation/places/web-service?hl=ja)   | -       |

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

## GCP の Places API と Maps API について

このアプリケーションでは、GCP の Places API と Maps API を使用しています。

そのため、場所の検索機能などのために、API キーの取得と認証情報の設定が必要になります。

GCP コンソール上での設定の仕方は、公式のドキュメントや実際のコンソールを見て設定してください。

- [GCP の登録 - Google Cloud を使ってみる](https://cloud.google.com/docs/get-started?hl=ja)
- [認証について - Google での認証](https://cloud.google.com/docs/authentication?hl=ja&_ga=2.30865660.-297243849.1646048841)

ここでは、このアプリケーションで必要な API キーの設定の仕方について説明します。

### API キーについて

まず、今回の API キーの保管方法については、**セキュリティ的な観点を無視**しています。

なので、**実際にこのアプリケーションを使うときは、API の保管方法は十分気をつけてください**。

#### Places API について

この API キーは、`.env`ファイルにて管理しています。

そのため、以下のように設定してください。

```.env
PLACES_API_KEY={実際のAPIキーを記載してください}
```

#### Maps API について

##### Android の場合

Android のための環境設定ファイルは、`/android/secret.properties`で管理しています。

Maps API を使う場合は、以下のように記載してください。

```properties
googleMap.apiKey={実際のAPIキーを記載してください}
```

##### iOS の場合

iOS のための環境設定ファイルは、`/ios/Runner/Environment.swift`で管理しています。

Maps API を使う場合は、以下のように記載してください。

```swift
import Foundation

struct Env {
  static let googleMapApiKey = "{実際のAPIキーを記載してください}"
}
```

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

## 開発時 Tips

### ワイヤレスデバッグの仕方

VSCode 上でのワイヤレスデバッグの仕方を記載します。

（Android の場合）

1. 端末を開発者モードにします。開発者モードへの移行は、[こちら](https://developer.android.com/studio/debug/dev-options?hl=ja)を参照してください。
2. 開発を行う端末と、デバッグを行う端末は同じ Wi-Fi に接続しておいてください。
3. 開発者向けオプションで`ワイヤレス デバッグ`を設定し、`デバイスとのペア設定`から`Wi-Fi ペア設定コード（PAIRING_CODE）`、`IP アドレスとポート（HOST[:PORT]）`を控えておきます。
4. プロジェクトルートで、先ほど控えておいた`HOST`, `PORT`, `PAIRING_CODE`を以下コマンドに合わせて実行します。
   ```bash
   $ adb pair HOST[:PORT] [PAIRING_CODE]
   ```
5. ローカル起動時に選択できるデバイスに、手持ちの端末が増えているので、それを選択します。
6. 手持ちの端末でアプリケーションが起動します。

### hive の TypeAdapter の自動生成

hive では、`lib/data/model/hive/location/location.dart`のようにオブジェクトを作成することで、`build_runner`を使って`TypeAdapter`を自動生成できます。

自動生成のためのコマンドは、以下になります。

```bash
$ flutter packages pub run build_runner build
```
