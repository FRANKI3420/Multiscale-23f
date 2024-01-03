### 使用前の問題点

研究活動でほぼ毎週、Excel形式にて出力した実験結果のデータを棒グラフに変換し、パワーポイント資料にまとめて先生に見せている。

そのため、毎回毎回手作業でx座標を固定で、y座標を一つずつ変える作業によって複数の棒グラフを作成していたため、非効率な作業を行っていた。

### 使用法

このスクリプトを実行するには、以下のようにコマンドライン引数を指定する必要がある。

```
ruby script.rb <excel_file_path> <excel_file_path> <x_column> <start_column>
```
+ <excel_file_path>: エクセルファイルのパス
+ <x_column>: X軸に使用する列のラベル（例: 'A'）
+ <start_column>: 開始列のラベル（例: 'B'）

### 使ったcodeの簡単な解説

このRubyスクリプトは、指定されたExcelファイルから、指定された開始列から列が空になるまでのデータを取得し、それぞれの列に対して棒グラフを描画して保存する。

グラフのタイトル、各軸が何を指すかを自動でセット可能である。

### 使用後どれほど効率が上がったか

コマンドを打つだけで全ての列に対して棒グラフを作成することができるので、毎回範囲選択をしてグラフを挿入するという非効率な作業をなくすことができた。
