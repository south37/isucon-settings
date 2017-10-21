## Deploy
`deploy.sh` を実行するとunicornの再起動、nginxの再起動などを行って、branchの最新状態でアプリケーションが動くようになります。

```
./deploy.sh
```

## デバッグ用のログ
`ruby_log.sh` を実行すると、ruby のアプリケーションのログが見れます。typo などでエラーになってないかデバッグするのに役立ちます。

```
./ruby_log.sh
```

`nginx_log.sh` を実行すると、nginx のアプリケーションのログが見れます。nginx のコンフィグファイルの設定ミスなどをデバッグするのに役立ちます。

```
./nginx_log.sh
```

## branch のデバッグフロー

1. `git fetch orgin [branch] && git checkout [branch]` で対象 branch へ移動
2. `./deploy.sh` でデプロイ
3. ブラウザで挙動を確認、`./ruby_log.sh` でエラーが出てないことを確認

## ベンチを回す時のフロー

1. `git fetch orgin [branch] && git checkout [branch]` で対象 branch へ移動
2. `./deploy.sh` でデプロイ
3. ブラウザで挙動を確認、`./ruby_log.sh` でエラーが出てないことを確認
4. ベンチマーク実行開始
5. `./rotate_and_cp.sh` を実行して、logディレクトリの中に最新の access log をタイムスタンプ付きでコピー(cf. `/log/20171022022023_access.log`)
6. git add log && git commit -m 'Add log' で git commit。git push し、local に git pull でとってきたら、`cat log/20171022022023_access.log | kataribe -f kataribe.toml` で解析。
