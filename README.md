## 最初にやることリスト
- [ ] 0. server の CPU, Memory確認（`cat /proc/meminfo  | grep MemTotal` と `cat /proc/cpuinfo  | grep processor` を実行）
- [ ] 1. ruby 実装に切り替える（忘れがちだから注意。systemd は [Systemd #18](https://github.com/ngtk/orenoie/issues/18) を参照）
- [ ] 2. nginx.conf に access log を設定して bench スタート（ https://gist.github.com/south37/d4a5a8158f49e067237c17d13ecab12a#file-4_nginx-md ）
- [ ] 3. `git clone https://github.com/south37/isucon-settings && cd isucon-settings && ./setup.sh` を実行して諸々ファイルを設置。
- [ ] 4. `deploy.sh` を環境に合わせて書き換える。これが終了して他の2人もdeployが出来るようになったら、repository を共有。
- [ ] 5. unicorn の worker 数 update（多めで15くらいにしちゃう）。unicorn の env を production に変更
- [ ] 6. nginx の静的ファイル配信など設定

## 開発の為に必要になること
- [ ] `sudo apt-get install vim` で vim をインストール。
- [ ] `deploy.sh`、`log_app.sh`あたりは環境に合わせて適宜書き換える（systemd のサービス名が何なのか次第で変わるので）。その他の shell script は、他の人に使ってもらって動かなかったら修正する。`rotate_and_cp.sh` も、ユーザー名が `isucon` 以外だったら書き換える。

## Redis を利用する場合
- [ ] `redis.cnf` の中で、`bind` の設定をコメントアウト(デフォルトだとlocalhostからの接続しか受け付けなくなってる)
