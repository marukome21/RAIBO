puts "seedの実行を開始"

#管理者側の設定

Admin.find_or_create_by!(email: "admin@admin") do |admin|
  admin.password = "testtest"
end

#ユーザーの設定

User.find_or_create_by!(email: "yanbaru@example.com") do |user|
  user.user_name = "頑張るクイナ"
  user.password = "password"
  user.profile = "毎日がんばるぞ！"
end

User.find_or_create_by!(email: "mukimuki@example.com") do |user|
  user.user_name = "マッスル君"
  user.password = "password"
  user.profile = "今日も筋トレだ！"
end

User.find_or_create_by!(email: "mensisu@example.com") do |user|
  user.user_name = "体脂肪率20%以下を目指すメンシス派"
  user.password = "password"
  user.profile = "マジェスティック！！！"
end

User.find_or_create_by!(email: "tiniuetakemono@example.com") do |user|
  user.user_name = "カロリーに飢えた獣"
  user.password = "password"
  user.profile = "ダイエットはお腹が減りますね"
end

#ユーザーの投稿データ設定

Post.find_or_create_by!(post_text: "サイドレイズが効く～") do |post|
  post.user_id = 1
end

Post.find_or_create_by!(post_text: "週４で筋トレ、筋トレの時間は１時間！つまり１週間に４時間筋トレすだけで体がごつくなる！") do |post|
  post.user_id = 1
end

Post.find_or_create_by!(post_text: "２３時間ジムですごいムキムキの人がいた！") do |post|
  post.user_id = 1
end

Post.find_or_create_by!(post_text: "今日からローファットだ！") do |post|
  post.user_id = 2
end

Post.find_or_create_by!(post_text: "とりあえず、鳥皮は剥いてごはん生活かな") do |post|
  post.user_id = 2
end

Post.find_or_create_by!(post_text: "野菜にブロッコリー！") do |post|
  post.user_id = 2
end

Post.find_or_create_by!(post_text: "今日の晩御飯は鶏もも肉を使った料理です 鶏もも肉２００ｇ、みりん大さじ１材料はこれだけ！") do |post|
  post.user_id = 3
end

Post.find_or_create_by!(post_text: "うーん！今日も素晴らしい味だ！") do |post|
  post.user_id = 3
end

Post.find_or_create_by!(post_text: "ぜひ、みなさんもやってみてください！ダイエットレシピ！") do |post|
  post.user_id = 3
end

Post.find_or_create_by!(post_text: "コンビニのスイーツを見ちゃうとついつい葛藤しちゃう...くぅ～") do |post|
  post.user_id = 4
end

Post.find_or_create_by!(post_text: "買っちった") do |post|
  post.user_id = 4
end

Post.find_or_create_by!(post_text: "我慢できなかった～、また明日がんばろう！") do |post|
  post.user_id = 4
end


puts "seedの実行が完了しました"