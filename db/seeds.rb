# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
Admin.create(
	email: 'admin@namie.jp',
	password: '11111111'
)

area = [
 "赤宇木",
 "井手",
 "請戸",
 "牛渡",
 "大堀",
 "小野田",
 "小丸",
 "加倉",
 "苅宿",
 "川添",
 "川房",
 "北幾世橋",
 "幾世橋",
 "権現堂",
 "酒井",
 "酒田",
 "下津島",
 "末森",
 "高瀬",
 "田尻",
 "立野",
 "棚塩",
 "津島",
 "中浜",
 "西台",
 "羽附",
 "昼曽根",
 "樋渡",
 "藤橋",
 "南津島",
 "室原",
 "両竹",
 "谷津田",
]

prefecture = ['北海道','青森県','岩手県','宮城県','秋田県','山形県','福島県','茨城県','栃木県',
    '群馬県','埼玉県','千葉県','東京都','神奈川県','新潟県','富山県','石川県','福井県','山梨県','長野県','岐阜県',
    '静岡県','愛知県','三重県','滋賀県','京都府','大阪府','兵庫県','奈良県','和歌山県','鳥取県','島根県','岡山県',
    '広島県','山口県','徳島県','香川県','愛媛県','高知県','福岡県','佐賀県','長崎県','熊本県','大分県','宮崎県','鹿児島県','沖縄県']

(1..100).each do |i|
  group = area[rand(area.length)+1]

  if i == 1
    u = User.create(
      name: "佐藤 一郎",
      password: '11111111',
      email: "s#{i}@namie.jp",
      zipcode: "9791751",
      address: "福島県双葉郡浪江町昼曽根 100",
      address: "浪江町谷昼曽根 100",
      group: "昼曽根"
    )
  end

  if i == 2
    u = User.create(
      name: "田中 幸雄",
      password: '11111111',
      email: "s#{i}@namie.jp",
      zipcode: "9791751",
      address: "福島県双葉郡浪江町谷津田宇谷津田 88",
      old_address: "浪江町谷津田 100-2",
      group: "谷津田"
    )
  end

  if i == 3
    u = User.create(
      name: "田中 ミキコ",
      password: '11111111',
      email: "s#{i}@namie.jp",
      zipcode: "9791751",
      address: "福島県双葉郡浪江町谷津田宇谷津田 88",
      old_address: "浪江町谷津田 100-2",
      group: "谷津田"
    )
  end

  u = User.create(
  	name: Faker::Japanese::Name.name,
  	password: '11111111',
    email: "s#{i}@namie.jp",
    zipcode: "9791751",
    address: [true,false].sample ? "福島県双葉郡浪江町#{group} 1-#{i}" : prefecture[rand(prefecture.length)] + "XXXXX市 1-2-#{i}",
    old_address: "浪江町#{group} 100-#{i}",
    group: group
  )
end

@message = Message.new(text: "お悔やみ情報 田中 幸雄 (85歳) 谷津田", reply_to: User.find(3))
@message.users << User.all
@message.save

