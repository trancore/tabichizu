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
