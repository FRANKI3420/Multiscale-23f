require 'roo'
require 'gruff'

# 引数の数を確認
unless ARGV.length == 4
  puts "Usage: ruby script.rb <excel_file_path> <sheet_name> <x_column> <y_column>"
  exit 1
end

# 引数からエクセルファイルのパスと列の情報を取得
excel_file_path = ARGV[0]
sheet_name = ARGV[1]
x_column = ARGV[2]
y_column = ARGV[3]

# グラフの初期設定
g = Gruff::Bar.new
g.title = 'Bar Graph'
g.theme_pastel

# エクセルファイルを読み込む
xlsx = Roo::Excelx.new(excel_file_path)
sheet = xlsx.sheet(sheet_name)

# X軸とY軸のデータを用意
x_data = sheet.column(x_column)
y_data = sheet.column(y_column).map(&:to_f)  # Y軸のデータを数値に変換して取得

# グラフにデータをセット
g.data('Data', y_data)

# ラベルの設定
g.labels = Hash[x_data.each_with_index.map { |label, i| [i, label] }]

g.y_axis_increment = y_data.max
g.y_axis_increment = y_data.max/2
g.minimum_value = 0.01

# グラフを保存または表示
g.write('output.png')
puts 'Graph generated successfully!'
