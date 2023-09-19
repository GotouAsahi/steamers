# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  ['test1@test.com', 'バスです', File.open('./app/assets/images/basu.jpg'),'basu.jpg'],
  ['test2@test.com', '名無しのごんべ', File.open('./app/assets/images/kakkoii.jpg'),'kakkoii.jpg'],
  ['test3@test.com', 'にゃおは', File.open('./app/assets/images/nyaoha.jpg'),'nyaoha.jpg'],
  ['test4@test.com', 'ぬこ', File.open('./app/assets/images/rusia.jpg'),'rusia.jpg'],
  ['test5@test.com', '十二代目山田', File.open('./app/assets/images/usagi.jpg'),'usagi.jpg']
].each do |mail, name, img,filename|
  user=User.create!(
    { email: mail, password: "testes", name: name}
  )
  user.profile_image.attach(io: img, filename: filename)
  user.save!
end

[
  ['闇の帝王', '『闇の帝王』は、ヤクザをテーマにした迫力満点のアクションゲームです。過激な戦闘シーンや緊迫感あふれるストーリー展開が魅力で、プレイヤーはヤクザの世界に没入します。多彩な武器やスキルを駆使してライバルとの抗争を勝ち抜き、頂点を目指しましょう。美麗なグラフィックと没入感のあるサウンドが、この闇の世界を一層リアルに演出しています。『闇の帝王』は、ヤクザゲームのファンにはたまらない一作です。',5, File.open('./app/assets/images/yakuza.png'),'yakuza.png'],
  ['勇者の絆', '『勇者の絆』は、ドラゴンクエストを彷彿とさせる壮大な冒険が楽しめるRPGです。美しいグラフィックや感動的な音楽に包まれながら、プレイヤーは世界を救う勇者として仲間たちと共に旅立ちます。緻密に作り込まれたストーリーとキャラクターの成長を通じて、感情豊かな絆が生まれます。モンスターとのエキサイティングなバトルやダンジョンの探索も魅力的で、やりこみ要素もたっぷりです。『勇者の絆』は、ドラゴンクエストシリーズのファンにとって必見の作品です。',3, File.open('./app/assets/images/dorakue.png'),'dorakue.png'],
  ['永遠の英雄', '『永遠の英雄』は、ファイナルファンタジーを彷彿とさせる壮大なファンタジーRPGです。美麗な世界観と緻密なストーリーテリングが魅力で、プレイヤーは勇者として運命の戦いに挑みます。感情的なキャラクターたちや驚くべき魔法の力、エピックなバトルシーンは、プレイヤーを没入させること間違いありません。多彩なサイドクエストや謎解き要素も楽しみの一つで、深い世界を探索できます。『永遠の英雄』は、ファイナルファンタジーシリーズのファンにとって、夢中になれる素晴らしいゲームです。',3, File.open('./app/assets/images/ff.png'),'ff.png'],
  ['戦場の猛者', '『戦場の猛者』は、リアルなFPS（ファーストパーソンシューティング）ゲームの究極体験です。没入感あふれるグラフィックと臨場感あるサウンドが、プレイヤーを戦場に引き込みます。緻密な戦略と高度なリアリズムが求められる戦闘は、緊張感に満ちており、協力プレイや対戦モードも楽しめます。リアルな銃器や兵器の操作感やリアルな戦術要素は、本物の兵士のような感覚を味わえます。『戦場の猛者』は、リアルFPSを求めるプレイヤーにとって、興奮とスリルに満ちたゲーム体験を提供します。',4, File.open('./app/assets/images/fps.png'),'fps.png'],
  ['Star Idol Adventures', '『Star Idol Adventures』は、魅力的なアイドルたちが活躍する海外発のゲームです。プレイヤーはアイドルのマネージャーとなり、彼女たちをトップアイドルへと導きます。魅力的なキャラクターデザインと豪華なステージパフォーマンスは目を引き、リズミカルなリズムゲームや選択肢によるストーリー展開など、バラエティに富んだ要素が楽しめます。さらに、海外の文化や舞台を巡るワールドツアーも魅力的で、国境を超えた人気アイドルへの成長を追体験できます。『Star Idol Adventures』は、アイドルファンにとって夢の舞台です。',2, File.open('./app/assets/images/idol.png'),'idol.png'],
  ['Adventure World: Super Jump', '『Adventure World: Super Jump』は、海外発の楽しいマリオ風アクションゲームです。鮮やかなグラフィックとキャッチーな音楽が特徴で、プレイヤーは勇敢な冒険者となり、様々なステージを駆け巡ります。敵を飛び越えたり、パワーアップアイテムを集めたりしながら、仲間たちを救い、邪悪なボスとの壮絶なバトルに挑戦します。マリオシリーズを彷彿とさせる爽快なジャンプアクションと、秘密のワールドの発見も楽しめます。『Adventure World: Super Jump』は、マリオファンにとっても楽しめる素晴らしいゲームです。',3, File.open('./app/assets/images/mario.png'),'mario.png'],
  ['戦国英雄伝', '『戦国英雄伝』は、壮大な戦国時代を舞台にした戦略シミュレーションゲームです。プレイヤーは武将となり、領地の統治や軍勢の編成、戦略の立案などを行います。史実に基づいたキャラクターや歴史的なイベントがリアルに再現されており、戦国時代の臨場感を味わえます。戦闘では、兵士の配置や戦術の選択が重要で、領土拡大と敵勢力への打撃を目指します。豪華なグラフィックと緻密なストーリーテリングが、プレイヤーを戦国の世界に引き込みます。『戦国英雄伝』は、戦国時代のファンにとって必見の作品です。',5, File.open('./app/assets/images/sengoku.png'),'sengoku.png']
].each do |game_name, caption,user_id, img,filename|
  game=Game.create!(
    { game_name: game_name, caption: caption, user_id: user_id}
  )
  game.image.attach(io: img, filename: filename)
  game.save!
end