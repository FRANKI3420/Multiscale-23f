require 'roo'
require 'gruff'

# 引数の数を確認
unless ARGV.length < 4
  puts "Usage: ruby script.rb <excel_file_path> <x_column> <start_column>"
  exit 1
end

excel_file_path = ARGV[0]
x_column = ARGV[1]
start_column = ARGV[2]

# エクセルファイルを読み込む
xlsx = Roo::Excelx.new(excel_file_path)
sheet_name = xlsx.sheets.first

# 列ごとにグラフを描画
(start_column..).each do |y_column|
    puts y_column
    
    # グラフの初期設定
    g = Gruff::Bar.new
    g.theme_pastel
    
    # エクセルファイルを読み込む
    xlsx = Roo::Excelx.new(excel_file_path)
    sheet = xlsx.sheet(sheet_name)
    
    g.title = sheet.column('A')[1]
    # X軸とY軸のデータを用意
    x_data = sheet.column(x_column)[1..-1]  # 1行目以外のデータを取得
    y_data = sheet.column(y_column)[1..-1].map(&:to_f)  # 1行目以外のデータを数値に変換して取得

    # チェック: 列が空であればループ終了
    if sheet.column(y_column).first.to_s.empty?
        puts "Column #{y_column} is empty. Stopping the loop..."
        break
    end

    # X軸とY軸のデータを用意
    x_first_data = sheet.column(x_column).first

    # グラフにデータをセット
    g.data("", y_data)
    g.y_axis_label = sheet.column(y_column).first.to_s
    g.x_axis_label = sheet.column(x_column).first.to_s


    # ラベルの設定
    g.labels = Hash[x_data.each_with_index.map { |label, i| [i, label] }]

    # グラフを保存または表示
    puts sheet.column(y_column).first.to_s+'.png'
    g.write("result/"+sheet.column(y_column).first.to_s+'.png')
end


puts 'Graphs generated successfully!'
