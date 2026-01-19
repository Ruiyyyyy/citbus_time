[![test](https://github.com/Ruiyyyyy/CITbus_time/actions/workflows/test.yml/badge.svg)](https://github.com/Ruiyyyyy/CITbus_time/actions/workflows/test.yml)


# CITbus_time コマンド

標準入力から時刻表データ（HH:MM形式）を読み込み、現在時刻から見て「次の便」の時刻と待ち時間を表示するコマンドです。
通学バスや電車の待ち時間確認などに利用できます。
なおバスのダイヤは千場工業大学の冬季期間(2026/1/8から2/21)の月曜から金曜日の平日のものとなっています。

## 準備1

以下のコマンドを順番に実行してください。リポジトリを取り込み、作業用ディレクトリへ移動します。

```bash
$ git clone https://github.com/Ruiyyyyy/CITbus_time.git
$ cd CITbus_time
```

必要に応じて実行権限を付与してください。
```
$ chmod +x CITbus_time
```

## 準備2

時刻表を記述したテキストファイルを用意します。記述順序は関係なく動作します。
津田沼から新習志野行き(tudanuma_bus.txt)、新習志野から津田沼行き(sinnarasino_bus.txt)の2つのテキストファイルがあります。
## 実行例

標準入力から時刻データを入れると現在時刻から最も近い次の便を表示します。

```bash
$ echo tudanuma_bus.txt | ./CITbus_time
10:35 (あと 25分)

```

```bash
$ echo sinnarasino_bus.txt | ./CITbus_time
10:15 (あと 10分)
```

引数に時刻(HH:MM)を指定するとその時刻から最も近い次の便を表示します。
時刻データは必ず00:00~23:59の間で入力してください
```bash
$ echo tudanuma_bus.txt | ./CITbus_time 10:00
10:35 (あと 35 分)
```


```bash
$ echo sinnarasino_bus.txt | ./CITbus_time 10:00
10:35 (あと 15分)
```

## 必要な環境
* Linux環境 Ubuntu24.04LTS
* Python 3.7+

## ライセンス
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許
可されます．
- © 2025 Ryu Taniguchi
