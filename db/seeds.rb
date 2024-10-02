# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

あいちゃん = User.find_or_create_by!(email: "aiai@example.com") do |user|
  user.name = "あいちゃん"
  user.password = "password"
end

かなえ = User.find_or_create_by!(email: "kanakana@example.com") do |user|
  user.name = "かなえ"
  user.password = "password"
end

ゆうき = User.find_or_create_by!(email: "yu-yu@example.com") do |user|
  user.name = "ゆうき"
  user.password = "password"
end

はじめ = User.find_or_create_by!(email: "hajime@example.com") do |user|
  user.name = "はじめ"
  user.password = "password"
end

たかくん = User.find_or_create_by!(email: "takayuki@example.com") do |user|
  user.name = "たかくん"
  user.password = "password"
end


Post.find_or_create_by!(post_genre_id: 2) do |post|
  post.title = "リビングのニオイ消しはコレ一択！！"
  post.body = "〇〇社の消臭スプレー、もう何年も愛用中！掃除が終わった最後にリビング中に！おすすめです！"
  post.user = あいちゃん
  post.images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post1.png"), filename: "sample-post1.png")
end

Post.find_or_create_by!(post_genre_id: 3) do |post|
  post.title = "キッチンの様々な汚れに"
  post.body = "コンロ、排水溝、レンジなどなど、重曹はとても役立ちます。例えばコップに重曹を混ぜた水を用意しレンジにかけます。終了後レンジ内は水分でいっぱいに！これを拭き上げるとピッカピカ！排水溝は・・・"
  post.user = かなえ
  post.images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post2.png"), filename: "sample-post2.png")
end

Post.find_or_create_by!(post_genre_id: 4) do |post|
  post.title = "これはもう手放せない！"
  post.body = "お掃除箇所でもトップに上がってくるくらいに面倒臭い浴室掃除。。私はこの洗剤で楽しくなりました！シュッと吹きかけて暫く放置するだけ！こすりもしないのに何でこんなに汚れが落ちるんだろう？みんなも使って実感してみて！"
  post.user = ゆうき
  post.images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post3.png"), filename: "sample-post3.png")
end

Post.find_or_create_by!(post_genre_id: 5) do |post|
  post.title = "これで玄関汚れを一掃！"
  post.body = "このブラシ優秀すぎ！！みんなにも１回は絶対に使ってもらいたい！"
  post.user = たかくん
  post.images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post4.png"), filename: "sample-post4.png")
end

Post.find_or_create_by!(post_genre_id: 6) do |post|
  post.title = "鏡を見るたび嫌な気持ちになっていたが、、"
  post.body = "このスポンジは世紀の発明品レベル！一生手放さない。絶対に廃盤にならないでくれよー！"
  post.user = はじめ
  post.images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post5.png"), filename: "sample-post5.png")
end

Post.find_or_create_by!(post_genre_id: 7) do |post|
  post.title = "世界共通で嫌だよねトイレ掃除"
  post.body = "私のトイレ掃除方法全部公開します！まずは・・・"
  post.user = あいちゃん
  post.images.attach(io: File.open("#{Rails.root}/db/fixtures/sample-post6.png"), filename: "sample-post6.png")
end