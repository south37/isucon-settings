## やることリスト
- [ ] 1. nginx.conf に access log を設定して bench スタート（ https://gist.github.com/south37/d4a5a8158f49e067237c17d13ecab12a#file-4_nginx-md ）
- [ ] 2. `git clone https://github.com/south37/isucon-settings && cd isucon-settings && ./setup.sh` を実行して諸々ファイルを設置。
- [ ] 3. `deploy.sh` を環境に合わせて書き換える。これが終了して他の2人もdeployが出来るようになったら、repository を共有。
- [ ] 4. unicorn の worker 数 update（多めで15くらいにしちゃう）。unicorn の env を production に変更
- [ ] 5. nginx の静的ファイル配信など設定
