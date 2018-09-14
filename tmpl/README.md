## Deploy
`./all_scripts/deploy.sh` を実行するとgo appの再起動、nginxの再起動などを行って、branchの最新状態でアプリケーションが動くようになります。

```
./all_scripts/deploy.sh
```

尚、`Gemfile`に何かを追加したなどで `bundle install` も行いたい場合は、`--bundle`をオプションとして渡すと`bundle install`した上でアプリケーションの再起動を行います。

```
./all_scripts/deploy.sh --bundle
```

## デバッグ用のログ
`./all_scripts/log.sh` を実行すると、go appやnginxのログが見れます。typo などでエラーになってないかデバッグするのに役立ちます。

```
./all_scripts/log.sh
```

## branch status の確認

```
./all_scripts/branch_status.sh
```

## branch のデバッグフロー

1. `./all_scripts/deploy.sh [対象branch]` でデプロイ
2. ブラウザで挙動を確認、`./all_scripts/log.sh` でエラーが出てないことを確認

## ベンチを回す時のフロー

1. `./all_scripts/deploy.sh [対象branch]` でデプロイ
2. ブラウザで挙動を確認、`./all_scripts/log.sh` でエラーが出てないことを確認
3. ベンチマーク実行開始
4. `./all_scripts/kataribe_log.sh` を実行して、log file を git 管理下に置いて手元に pull してくる

