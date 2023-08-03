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
