﻿# coding: utf-8
#2015-02-12
$KCODE = 'u'

class KanConvFJ
VERSION = '0.0.0'

# $code[0]繁體Fantizi  $code[1]簡體jiantizi(Simple chinese)  $code[2]日本Japanese
@list = Array.new() ; # see below
# @code = [ [], [], [] ]
# @code = Array.new(3){ Array.new }
@code = nil

def initialize()
   @code = [ [], [], [] ]
   self.initTable()
   c1=""; c2=""; c3="";
   s = @list.size - 1
   0.step(s, 3) do |i|
      c1 = @list[i]; c2 = @list[i+1]; c3 = @list[i+2];
      if ! c1.empty? then
	    @code[0] << c1
	    @code[1] << c2
	    @code[2] << c3
      end
   end
end

def _conv_kanji(flag, str)
   case flag
        when 1 then
          # [0]繁體->[2]日本
          from=0; to=2;
        when 2 then
          # [2]日本->[0]繁體
          from=2; to=0;
        when 3 then
          # [0]繁體->[1]簡體
          from=0; to=1;
        when 4 then
          # [1]簡體->[0]繁體
          from=1; to=0;
        when 5 then
          # [2]日本->[1]簡體
          from=2; to=1;
        when 6 then
          # [1]簡體->[2]日本
          from=1; to=2;
   end
   arFrom = @code[from];
   arTo = @code[to];
   replaces="";
   str.each_char do |ch|
      idx = arFrom.index(ch)
      c = idx  ?  arTo[idx]  :  ch;
      replaces << c;
   end
   return replaces;

# $str =~ s/(.)/$cr->{j2c}{$1} ? $cr->{j2c}{$1} : $1/ge; doesn't work
end

# 1.繁體fantizi->日本japanese
def f2j(str)
    return self._conv_kanji(1,str);
end

# 2.japanese->fantizi
def j2f(str)
    return self._conv_kanji(2,str);
end

# 3.繋體fantizi->jiantizi簡體simple chinese
def f2s(str)
    return self._conv_kanji(3,str);
end

# 4.simple chinese -> fanti
def s2f(str)
    return self._conv_kanji(4,str);
end

# 5.simple chinese->japanese
def s2j(str)
    return self._conv_kanji(5,str);
end

# 6.japanese -> simple chinese
def j2s(str)
    return self._conv_kanji(6,str);
end


def initTable()
# japanese has less chars than Fantizi. if japanese doesn't have a char, copy Fantizi glyph to japanese.
# if there is same glyph, choise first one.
#  fan jian japan
#  繁體 簡體 日本
@list = %w(
丟	丢	丟
並	并	並
么	幺	么
乘	乗	乗
乾	干	乾
亂	乱	乱
亙	亘	亘
亞	亚	亜
伋	汲	伋
伕	夫	伕
佇	伫	佇
佈	布	佈
佔	占	佔
余	馀	余
佛	仏	仏
佪	徊	佪
併	并	併
來	来	来
侖	仑	侖
侮	侮	侮
侶	侣	侶
侷	局	侷
俁	俣	俁
係	系	係
俔	伣	俔
俠	侠	侠
俱	倶	倶
倀	伥	倀
倂	併	併
倅	伜	伜
倆	俩	倆
倈	俫	倈
倉	仓	倉
個	个	個
們	们	們
倖	幸	倖
倣	仿	倣
倫	伦	倫
假	仮	仮
偉	伟	偉
側	侧	側
偵	侦	偵
偺	咱	偺
偽	伪	偽
傑	杰	傑
傖	伧	傖
傘	伞	傘
備	备	備
傢	家	傢
傭	佣	傭
傯	偬	傯
傳	传	伝
傴	伛	傴
債	债	債
傷	伤	傷
傾	倾	傾
僂	偻	僂
僅	仅	僅
僇	戮	僇
僉	佥	僉
僑	侨	僑
僕	仆	僕
僞	伪	偽
僥	侥	僥
僧	僧	僧
僨	偾	僨
僱	雇	僱
價	价	価
儀	仪	儀
儂	侬	儂
億	亿	億
儅	当	儅
儈	侩	儈
儉	俭	倹
儐	傧	儐
儔	俦	儔
儕	侪	儕
儘	尽	侭
償	偿	償
優	优	優
儲	储	儲
儷	俪	儷
儸	㑩	儸
儸	罗	儸
儺	傩	儺
儻	傥	儻
儼	俨	儼
兇	凶	兇
兌	兑	兌
免	免	免
兒	儿	児
兗	兖	兗
內	内	内
兩	两	両
冊	册	冊
册	冊	冊
冑	胄	冑
冪	幂	冪
凈	净	凈
凍	冻	凍
凜	凛	凜
凱	凯	凱
別	别	別
刪	删	刪
剄	刭	剄
則	则	則
剋	克	剋
剎	刹	剎
剗	刬	剗
剛	刚	剛
剝	剥	剥
剩	剰	剰
剮	剐	剮
剴	剀	剴
創	创	創
剷	铲	剷
劃	划	劃
劇	剧	劇
劉	刘	劉
劊	刽	劊
劌	刿	劌
劍	剑	剣
劏	㓥	劏
劑	剂	剤
劚	㔉	劚
劻	匡	劻
勁	劲	勁
勉	勉	勉
動	动	動
勗	勖	勗
務	务	務
勛	勋	勛
勝	胜	勝
勞	劳	労
勢	势	勢
勣	积	勣
勤	勤	勤
勦	剿	勦
勩	勚	勩
勱	劢	勱
勳	勲	勲
勵	励	励
勸	劝	勧
勻	匀	勻
匭	匦	匭
匯	汇	匯
匱	匮	匱
區	区	区
卑	卑	卑
協	协	協
卷	巻	巻
卹	恤	卹
卻	却	卻
卽	即	即
厙	厍	厙
厠	厕	厠
厭	厌	厭
厲	厉	厲
厴	厣	厴
參	参	参
叄	叁	叄
叢	丛	叢
吋	寸	吋
吒	咤	吒
吞	呑	呑
吳	吴	呉
吶	呐	吶
吿	告	告
呂	吕	呂
呎	尺	呎
咼	呙	咼
員	员	員
唄	呗	唄
唚	吣	唚
唸	念	唸
問	问	問
啓	启	啓
啞	哑	唖
啟	启	啟
啢	唡	啢
啣	衔	啣
喎	㖞	喎
喚	唤	喚
喝	喝	喝
喪	丧	喪
喫	吃	喫
喬	乔	喬
單	单	単
喲	哟	喲
嗆	呛	嗆
嗇	啬	嗇
嗊	唝	嗊
嗎	吗	嗎
嗚	呜	嗚
嗩	唢	嗩
嗶	哔	嗶
嘆	叹	嘆
嘍	喽	嘍
嘔	呕	嘔
嘖	啧	嘖
嘗	尝	嘗
嘜	唛	嘜
嘩	哗	嘩
嘮	唠	嘮
嘯	啸	嘯
嘰	叽	嘰
嘵	哓	嘵
嘸	呒	嘸
嘽	啴	嘽
噁	恶	噁
噓	嘘	嘘
噚	㖊	噚
噝	咝	噝
噠	哒	噠
噥	哝	噥
噦	哕	噦
器	器	器
噯	嗳	噯
噲	哙	噲
噴	喷	噴
噸	吨	噸
噹	当	噹
嚀	咛	嚀
嚇	吓	嚇
嚌	哜	嚌
嚕	噜	嚕
嚙	啮	噛
嚥	咽	嚥
嚦	呖	嚦
嚨	咙	嚨
嚮	向	向
嚲	亸	嚲
嚳	喾	嚳
嚴	严	厳
嚶	嘤	嚶
囀	啭	囀
囁	嗫	囁
囂	嚣	囂
囅	冁	囅
囈	呓	囈
囉	罗	囉
囊	嚢	嚢
囌	苏	囌
囑	嘱	嘱
囪	囱	囪
圇	囵	圇
圈	圏	圏
國	国	国
圍	围	囲
園	园	園
圓	圆	円
圖	图	図
團	团	団
坰	垧	坰
垵	埯	垵
埒	埓	埓
埡	垭	埡
埰	采	埰
執	执	執
堅	坚	堅
堊	垩	堊
堖	垴	堖
堝	埚	堝
堯	尧	尭
報	报	報
場	场	場
堿	碱	堿
塀	塀	塀
塊	块	塊
塋	茔	塋
塏	垲	塏
塒	埘	塒
塗	涂	塗
塚	塚	塚
塡	填	填
塢	坞	塢
塤	埙	塤
塵	尘	塵
塹	堑	塹
墊	垫	墊
墑	墒	墑
墜	坠	墜
增	増	増
墨	墨	墨
墮	堕	堕
墳	坟	墳
墻	墙	墻
墾	垦	墾
壇	坛	壇
壋	垱	壋
壎	埙	壎
壓	压	圧
壘	垒	塁
壙	圹	壙
壚	垆	壚
壞	坏	壊
壟	垄	壟
壠	垅	壠
壢	坜	壢
壤	壌	壌
壩	坝	壩
壯	壮	壮
壹	壱	壱
壺	壶	壷
壼	壸	壼
壽	寿	寿
夠	够	夠
夢	梦	夢
夾	夹	夾
奐	奂	奐
奘	弉	弉
奧	奥	奥
奩	奁	奩
奪	夺	奪
奬	奖	奨
奮	奋	奮
奼	姹	奼
妝	妆	妝
妳	你	妳
姍	姗	姍
姦	奸	姦
姪	侄	姪
姬	姫	姫
姸	妍	妍
娛	娱	娯
婁	娄	婁
婦	妇	婦
婭	娅	婭
媧	娲	媧
媯	妫	媯
媼	媪	媼
媽	妈	媽
嫗	妪	嫗
嫵	妩	嫵
嫻	娴	嫻
嫿	婳	嫿
嬀	妫	嬀
嬈	娆	嬈
嬋	婵	嬋
嬌	娇	嬌
嬙	嫱	嬙
嬝	袅	嬝
嬡	嫒	嬡
嬤	嬷	嬤
嬪	嫔	嬪
嬰	婴	嬰
嬸	婶	嬸
孃	娘	嬢
孌	娈	孌
孫	孙	孫
學	学	学
孿	孪	孿
宮	宫	宮
寢	寝	寝
實	实	実
寧	宁	寧
審	审	審
寫	写	写
寬	宽	寛
寵	宠	寵
寶	宝	宝
將	将	将
專	专	専
尋	寻	尋
對	对	対
導	导	導
尙	尚	尚
尷	尴	尷
屆	届	届
屍	尸	屍
屓	屃	屓
屛	屏	屏
屜	屉	屜
屝	扉	屝
屢	屡	屡
層	层	層
屨	屦	屨
屬	属	属
岡	冈	岡
岧	迢	岧
峴	岘	峴
島	岛	島
峽	峡	峡
崍	崃	崍
崗	岗	崗
崙	仑	崙
崠	岽	崠
崢	峥	崢
崬	岽	崬
崳	嵛	崳
嵐	岚	嵐
嵒	岩	岩
嶁	嵝	嶁
嶄	崭	嶄
嶇	岖	嶇
嶔	嵚	嶔
嶗	崂	嶗
嶠	峤	嶠
嶢	峣	嶢
嶧	峄	嶧
嶮	崄	嶮
嶴	岙	嶴
嶸	嵘	嶸
嶺	岭	嶺
嶼	屿	嶼
巋	岿	巋
巑	漓	巑
巒	峦	巒
巔	巅	巔
巖	岩	巌
巢	巣	巣
巰	巯	巰
巹	卺	巹
帥	帅	帥
師	师	師
帳	帐	帳
帶	带	帯
幀	帧	幀
幃	帏	幃
幗	帼	幗
幘	帻	幘
幟	帜	幟
幣	币	幣
幫	帮	幫
幬	帱	幬
幷	并	并
幹	干	幹
幺	么	幺
幾	几	幾
庂	仄	庂
庫	库	庫
廁	厕	廁
廂	厢	廂
廄	厩	廄
廈	厦	廈
廊	廊	廊
廚	厨	廚
廝	厮	廝
廟	庙	廟
廠	厂	廠
廡	庑	廡
廢	废	廃
廣	广	広
廩	廪	廩
廬	庐	廬
廱	痈	廱
廳	庁	庁
廳	厅	廳
弒	弑	弒
弔	吊	弔
弳	弪	弳
張	张	張
强	强	強
彆	别	彆
彈	弹	弾
彊	强	強
彌	弥	弥
彎	弯	弯
彙	汇	彙
彞	彝	彞
彥	彦	彦
彫	雕	彫
彿	佛	彿
後	后	後
徑	径	径
從	从	従
徠	徕	徠
復	复	復
徬	旁	徬
徵	征	徴
德	徳	徳
徹	彻	徹
恆	恒	恒
恥	耻	恥
悅	悦	悦
悔	悔	悔
悞	悮	悞
悵	怅	悵
悶	闷	悶
悽	凄	悽
惠	恵	恵
惡	恶	悪
惱	恼	悩
惲	恽	惲
惻	恻	惻
愛	爱	愛
愜	惬	愜
愨	悫	愨
愴	怆	愴
愷	恺	愷
愼	慎	慎
愾	忾	愾
慄	栗	慄
慇	殷	慇
態	态	態
慍	愠	慍
慘	惨	惨
慚	惭	慚
慟	恸	慟
慣	惯	慣
慤	悫	慤
慨	慨	慨
慪	怄	慪
慫	怂	慫
慮	虑	慮
慳	悭	慳
慶	庆	慶
慼	戚	慼
憂	忧	憂
憊	惫	憊
憎	憎	憎
憐	怜	憐
憑	凭	憑
憒	愦	憒
憚	惮	憚
憤	愤	憤
憫	悯	憫
憮	怃	憮
憲	宪	憲
憶	忆	憶
懇	恳	懇
應	应	応
懌	怿	懌
懍	懔	懍
懍	檩	懍
懞	蒙	懞
懟	怼	懟
懣	懑	懣
懨	恹	懨
懲	惩	懲
懶	懒	懶
懷	怀	懐
懸	悬	懸
懺	忏	懴
懼	惧	懼
懾	慑	懾
戀	恋	恋
戇	戆	戇
戉	钺	戉
戔	戋	戔
戧	戗	戧
戩	戬	戩
戰	战	戦
戱	戯	戱
戲	戏	戯
戶	户	戸
戾	戻	戻
扐	仂	扐
扠	叉	扠
扢	扦	扢
扺	抵	扺
抃	拚	抃
抆	擦	抆
抎	殒	抎
抴	曳	抴
拂	払	払
拋	抛	拋
拔	抜	抜
拜	拝	拝
挩	捝	挩
挶	局	挶
挾	挟	挟
捍	扞	捍
捨	舍	捨
捫	扪	捫
捲	卷	捲
掃	扫	掃
掄	抡	掄
掗	挜	掗
掙	挣	掙
掛	挂	掛
採	采	採
揀	拣	揀
插	挿	挿
揚	扬	揚
換	换	換
揭	掲	掲
揮	挥	揮
揹	背	揹
搆	构	搆
損	损	損
搔	掻	掻
搖	摇	揺
搗	捣	搗
搜	捜	捜
搟	擀	搟
搵	揾	搵
搶	抢	搶
摑	掴	掴
摜	掼	摜
摟	搂	摟
摯	挚	摯
摳	抠	摳
摶	抟	摶
摻	掺	摻
撈	捞	撈
撏	挦	撏
撐	撑	撐
撓	挠	撓
撚	捻	撚
撝	㧑	撝
撟	挢	撟
撢	掸	撢
撣	掸	撣
撥	拨	撥
撫	抚	撫
撲	扑	撲
撳	揿	撳
撻	挞	撻
撾	挝	撾
撿	捡	撿
擁	拥	擁
擄	掳	擄
擇	择	択
擊	击	撃
擋	挡	擋
擓	㧟	擓
擔	担	担
據	据	拠
擠	挤	擠
擣	捣	擣
擧	挙	挙
擬	拟	擬
擯	摈	擯
擰	拧	擰
擱	搁	擱
擲	掷	擲
擴	扩	拡
擷	撷	擷
擺	摆	擺
擻	擞	擻
擼	撸	擼
擾	扰	擾
攄	摅	攄
攆	撵	攆
攏	拢	攏
攔	拦	攔
攖	撄	攖
攙	搀	攙
攛	撺	攛
攜	携	攜
攝	摄	摂
攢	攒	攅
攣	挛	攣
攤	摊	攤
攪	搅	撹
攬	揽	攬
收	収	収
攷	考	攷
效	効	効
敍	叙	叙
敎	教	教
敏	敏	敏
敕	勅	勅
敗	败	敗
敘	叙	敘
敵	敌	敵
數	数	数
斂	敛	斂
斃	毙	斃
斕	斓	斕
斬	斩	斬
斷	断	断
於	于	於
旂	旗	旂
既	既	既
時	时	時
晉	晋	晋
晚	晩	晩
晝	昼	昼
晞	曦	晞
晴	晴	晴
暈	晕	暈
暉	晖	暉
暑	暑	暑
暘	旸	暘
暘	阳	暘
暢	畅	暢
暫	暂	暫
暱	昵	暱
暸	了	暸
曄	晔	曄
曆	历	暦
曇	昙	曇
曉	晓	暁
曏	向	向
曖	暧	曖
曠	旷	昿
曨	昽	曨
曬	晒	曬
書	书	書
曾	曽	曽
會	会	会
朗	朗	朗
朧	胧	朧
朮	术	朮
杇	圬	杇
東	东	東
杴	锨	杴
枙	栀	枙
枴	拐	枴
柵	栅	柵
栃	杤	杤
栅	柵	柵
桝	枡	枡
桿	杆	桿
梅	梅	梅
梔	栀	梔
梘	枧	梘
條	条	条
梟	枭	梟
梲	棁	梲
棄	弃	棄
棖	枨	棖
棗	枣	棗
棟	栋	棟
棧	栈	桟
棲	栖	棲
棶	梾	棶
椏	桠	椏
楊	杨	楊
楓	枫	楓
楨	桢	楨
業	业	業
極	极	極
榦	干	幹
榪	杩	榪
榮	荣	栄
榲	榅	榲
榿	桤	榿
槃	盘	槃
槇	槙	槙
構	构	構
槍	枪	槍
槓	杠	槓
槤	梿	槤
槧	椠	槧
槨	椁	槨
槪	概	概
槳	桨	槳
樁	桩	樁
樂	乐	楽
樅	枞	樅
樑	梁	樑
樓	楼	楼
標	标	標
樞	枢	枢
樣	样	様
樸	朴	樸
樹	树	樹
樺	桦	樺
橈	桡	橈
橋	桥	橋
機	机	機
橢	椭	橢
橫	横	横
檁	檩	檁
檉	柽	檉
檔	档	檔
檜	桧	桧
檟	槚	檟
檢	检	検
檣	樯	檣
檮	梼	梼
檯	台	檯
檳	槟	梹
檸	柠	檸
檻	槛	檻
櫃	柜	櫃
櫓	橹	櫓
櫚	榈	櫚
櫛	栉	櫛
櫝	椟	櫝
櫞	橼	櫞
櫟	栎	檪
櫥	橱	櫥
櫧	槠	櫧
櫨	栌	枦
櫪	枥	櫪
櫫	橥	櫫
櫬	榇	櫬
櫱	蘖	櫱
櫳	栊	槞
櫸	榉	櫸
櫺	棂	櫺
櫻	樱	桜
欄	栏	欄
權	权	権
欏	椤	欏
欒	栾	欒
欖	榄	欖
欞	棂	欞
欽	钦	欽
歎	叹	歎
歐	欧	欧
歟	欤	歟
歡	欢	歓
步	歩	歩
歲	岁	歳
歷	历	歴
歸	归	帰
歿	殁	歿
殘	残	残
殞	殒	殞
殤	殇	殤
殨	㱮	殨
殫	殚	殫
殮	殓	殮
殯	殡	殯
殰	㱩	殰
殲	歼	殱
殺	杀	殺
殼	壳	殻
毀	毁	毀
毆	殴	殴
毌	毋	毌
每	毎	毎
毬	球	毬
毿	毵	毿
氂	牦	氂
氈	毡	氈
氌	氇	氌
氣	气	気
氫	氢	氫
氬	氩	氬
氳	氲	氳
氾	泛	氾
汍	丸	汍
汎	泛	汎
汙	污	汙
決	决	決
沒	没	没
沖	冲	沖
況	况	況
洩	泄	洩
洶	汹	洶
浬	里	浬
海	海	海
浹	浃	浹
涇	泾	涇
涉	渉	渉
涼	凉	涼
淒	凄	淒
淚	泪	涙
淥	渌	淥
淨	净	浄
淪	沦	淪
淵	渊	淵
淶	涞	淶
淸	清	清
淺	浅	浅
渙	涣	渙
渚	渚	渚
減	减	減
渦	涡	渦
測	测	測
渴	渇	渇
渾	浑	渾
湊	凑	湊
湞	浈	湞
湧	涌	湧
湯	汤	湯
溈	沩	溈
準	准	準
溝	沟	溝
溪	渓	渓
溫	温	温
溼	湿	溼
滄	沧	滄
滅	灭	滅
滌	涤	滌
滎	荥	滎
滬	沪	滬
滯	滞	滞
滲	渗	滲
滷	卤	滷
滸	浒	滸
滻	浐	滻
滾	滚	滾
滿	满	満
漁	渔	漁
漚	沤	漚
漢	汉	漢
漣	涟	漣
漬	渍	漬
漲	涨	漲
漵	溆	漵
漸	渐	漸
漿	浆	漿
潁	颍	潁
潑	泼	溌
潔	洁	潔
潙	沩	潙
潛	潜	潜
潟	泻	潟
潤	润	潤
潯	浔	潯
潰	溃	潰
潷	滗	潷
潿	涠	潿
澀	涩	澀
澁	渋	渋
澆	浇	澆
澇	涝	澇
澗	涧	澗
澠	渑	澠
澤	泽	沢
澦	滪	澦
澩	泶	澩
澮	浍	澮
澱	淀	澱
濁	浊	濁
濃	浓	濃
濕	湿	湿
濘	泞	濘
濛	蒙	濛
濟	济	済
濤	涛	涛
濫	滥	濫
濰	潍	濰
濱	滨	浜
濺	溅	濺
濼	泺	濼
濾	滤	沪
瀅	滢	瀅
瀆	渎	涜
瀇	㲿	瀇
瀉	泻	瀉
瀋	沈	瀋
瀋	渖	瀋
瀏	浏	瀏
瀕	濒	瀕
瀘	泸	瀘
瀝	沥	瀝
瀟	潇	瀟
瀠	潆	瀠
瀦	潴	瀦
瀧	泷	滝
瀨	濑	瀬
瀰	弥	瀰
瀲	潋	瀲
瀾	澜	瀾
灃	沣	灃
灄	滠	灄
灌	潅	潅
灑	洒	灑
灕	漓	灕
灘	滩	灘
灝	灏	灝
灠	漤	灠
灣	湾	湾
灤	滦	灤
灧	滟	灧
災	灾	災
烏	乌	烏
烴	烃	烴
无	无	無
無	无	無
焰	焔	焔
煉	炼	煉
煒	炜	煒
煙	烟	煙
煢	茕	煢
煥	焕	煥
煩	烦	煩
煬	炀	煬
煮	煮	煮
煱	㶽	煱
熅	煴	熅
熒	荧	熒
熗	炝	熗
熱	热	熱
熲	颎	熲
熾	炽	熾
燁	烨	燁
燄	焰	燄
燈	灯	灯
燉	炖	燉
燐	磷	燐
燒	烧	焼
燙	烫	燙
燜	焖	燜
營	营	営
燦	灿	燦
燬	毁	燬
燭	烛	燭
燴	烩	燴
燶	㶶	燶
燼	烬	燼
燾	焘	燾
爍	烁	爍
爐	炉	炉
爛	烂	爛
爭	争	争
爲	为	為
爺	爷	爺
爾	尔	爾
牆	墙	牆
牘	牍	牘
牪	瘪	牪
牴	抵	牴
牽	牵	牽
犖	荦	犖
犛	犁	犛
犢	犊	犢
犧	牺	犠
狀	状	状
狹	狭	狭
狽	狈	狽
猙	狰	猙
猪	猪	猪
猶	犹	猶
猻	狲	猻
獁	犸	獁
獄	狱	獄
獅	狮	獅
獎	奖	奨
獨	独	独
獪	狯	獪
獫	猃	獫
獮	狝	獮
獮	猕	獮
獰	狞	獰
獱	㺍	獱
獲	获	獲
獵	猎	猟
獷	犷	獷
獸	兽	獣
獺	獭	獺
獻	献	献
獼	猕	獼
玀	猡	玀
玆	兹	玆
玨	珏	玨
珮	佩	珮
現	现	現
琢	琢	琢
琺	珐	琺
琿	珲	琿
瑋	玮	瑋
瑒	玚	瑒
瑣	琐	瑣
瑤	瑶	瑶
瑩	莹	瑩
瑪	玛	瑪
瑯	琅	瑯
瑲	玱	瑲
璉	琏	璉
璣	玑	璣
璦	瑷	璦
璫	珰	璫
環	环	環
璽	玺	璽
瓊	琼	瓊
瓏	珑	瓏
瓔	璎	珱
瓖	镶	瓖
瓚	瓒	瓚
瓣	弁	弁
甁	瓶	瓶
甌	瓯	甌
甕	瓮	甕
產	产	産
産	产	産
甦	苏	甦
畝	亩	畝
畢	毕	畢
畫	划	画
畬	畲	畬
異	异	異
當	当	当
疇	畴	畴
疊	叠	畳
疿	痱	疿
痙	痉	痙
痠	酸	痠
痲	麻	痲
痳	麻	痳
痺	痹	痺
痾	疴	痾
瘂	痖	瘂
瘋	疯	瘋
瘍	疡	瘍
瘓	痪	瘓
瘞	瘗	瘞
瘡	疮	瘡
瘦	痩	痩
瘧	疟	瘧
瘮	瘆	瘮
瘲	疭	瘲
瘺	瘘	瘺
瘻	瘘	瘻
療	疗	療
癆	痨	癆
癇	痫	癇
癉	瘅	癉
癘	疠	癘
癟	瘪	癟
癡	痴	痴
癢	痒	癢
癤	疖	癤
癥	症	癥
癧	疬	癧
癩	癞	癩
癬	癣	癬
癭	瘿	癭
癮	瘾	癮
癰	痈	癰
癱	瘫	癱
癲	癫	癲
發	发	発
皚	皑	皚
皰	疱	皰
皸	皲	皸
皺	皱	皺
皻	隳	皻
益	益	益
盜	盗	盗
盞	盏	盞
盡	尽	尽
監	监	監
盤	盘	盤
盧	卢	盧
盪	荡	盪
眞	真	真
眥	眦	眥
眾	众	眾
睏	困	睏
睜	睁	睜
睞	睐	睞
睪	睾	睪
瞇	眯	瞇
瞘	眍	瞘
瞜	䁖	瞜
瞞	瞒	瞞
瞭	了	瞭
瞶	瞆	瞶
瞼	睑	瞼
矇	蒙	矇
矓	眬	矓
矓	胧	矓
矚	瞩	矚
矯	矫	矯
砲	炮	砲
硃	朱	硃
硏	研	研
硜	硁	硜
硤	硖	硤
硨	砗	硨
硯	砚	硯
碎	砕	砕
碑	碑	碑
碩	硕	碩
碭	砀	碭
碸	砜	碸
確	确	確
碼	码	碼
磑	硙	磑
磚	砖	磚
磣	碜	磣
磧	碛	磧
磯	矶	磯
磽	硗	磽
礆	硷	礆
礎	础	礎
礙	碍	礙
礦	矿	砿
礪	砺	砺
礫	砾	礫
礬	矾	礬
礱	砻	礱
祅	祆	祅
祇	只	祇
祈	祈	祈
祉	祉	祉
祐	佑	祐
祕	秘	秘
祖	祖	祖
神	神	神
祥	祥	祥
祿	禄	禄
禍	祸	禍
禎	祯	禎
福	福	福
禕	祎	禕
禡	祃	禡
禦	御	禦
禪	禅	禅
禮	礼	礼
禰	祢	祢
禱	祷	祷
禿	秃	禿
秈	籼	秈
稅	税	税
稈	秆	稈
稏	䅉	稏
稜	棱	稜
稟	禀	稟
種	种	種
稱	称	称
稻	稲	稲
穀	谷	穀
穌	稣	穌
積	积	積
穎	颖	頴
穗	穂	穂
穠	秾	穠
穡	穑	穡
穢	秽	穢
穩	稳	穏
穫	获	穫
穭	稆	穭
穰	穣	穣
突	突	突
窩	窝	窩
窪	洼	窪
窮	穷	窮
窯	窑	窯
窵	窎	窵
窶	窭	窶
窺	窥	窺
竄	窜	竄
竅	窍	竅
竇	窦	竇
竈	灶	竃
竊	窃	窃
竝	並	並
竪	竖	竪
競	竞	競
笻	筇	笻
筆	笔	筆
筍	笋	筍
筧	笕	筧
筴	䇲	筴
箄	箅	箄
箇	个	箇
箋	笺	箋
箏	筝	筝
節	节	節
範	范	範
築	筑	築
篋	箧	篋
篔	筼	篔
篠	筱	篠
篤	笃	篤
篩	筛	篩
篳	筚	篳
簀	箦	簀
簍	篓	簍
簑	蓑	簑
簞	箪	箪
簡	简	簡
簣	篑	簣
簫	箫	簫
簷	檐	簷
簹	筜	簹
簽	签	簽
簾	帘	簾
籃	篮	籃
籌	筹	籌
籐	藤	籐
籙	箓	籙
籜	箨	籜
籟	籁	籟
籠	笼	籠
籤	签	籤
籥	龠	籥
籩	笾	籩
籪	簖	籪
籬	篱	籬
籮	箩	籮
籲	吁	籲
粵	粤	粵
粹	粋	粋
精	精	精
糝	糁	糝
糞	粪	糞
糢	馍	糢
糧	粮	糧
糰	团	糰
糲	粝	糲
糴	籴	糴
糶	粜	糶
糹	纟	糹
糾	纠	糾
紀	纪	紀
紂	纣	紂
約	约	約
紅	红	紅
紆	纡	紆
紇	纥	紇
紈	纨	紈
紉	纫	紉
紋	纹	紋
納	纳	納
紐	纽	紐
紓	纾	紓
純	纯	純
紕	纰	紕
紖	纼	紖
紗	纱	紗
紘	纮	紘
紙	纸	紙
級	级	級
紛	纷	紛
紜	纭	紜
紝	纴	紝
紡	纺	紡
紬	䌷	紬
細	细	細
紱	绂	紱
紲	绁	紲
紳	绅	紳
紵	纻	紵
紹	绍	紹
紺	绀	紺
紼	绋	紼
紿	绐	紿
絀	绌	絀
終	终	終
絃	弦	絃
組	组	組
絅	䌹	絅
絆	绊	絆
絎	绗	絎
結	结	結
絕	绝	絶
絛	绦	絛
絝	绔	絝
絞	绞	絞
絡	络	絡
絢	绚	絢
給	给	給
絨	绒	絨
絰	绖	絰
統	统	統
絲	丝	糸
絳	绛	絳
絳	绦	絳
絶	绝	絶
絹	绢	絹
綁	绑	綁
綃	绡	綃
綆	绠	綆
綈	绨	綈
綉	绣	綉
綌	绤	綌
綏	绥	綏
綐	䌼	綐
經	经	経
綜	综	綜
綞	缍	綞
綠	绿	緑
綢	绸	綢
綣	绻	綣
綫	线	綫
綬	绶	綬
維	维	維
綯	绹	綯
綰	绾	綰
綱	纲	綱
網	网	網
綳	绷	綳
綴	缀	綴
綵	䌽	綵
綵	彩	綵
綸	纶	綸
綹	绺	綹
綺	绮	綺
綻	绽	綻
綽	绰	綽
綾	绫	綾
綿	绵	綿
緄	绲	緄
緇	缁	緇
緊	紧	緊
緋	绯	緋
緑	绿	緑
緖	绪	緒
緓	绬	緓
緔	绱	緔
緗	缃	緗
緘	缄	緘
緙	缂	緙
線	线	線
緝	缉	緝
緞	缎	緞
締	缔	締
緡	缗	緡
緣	缘	縁
緦	缌	緦
編	编	編
緩	缓	緩
緬	缅	緬
緯	纬	緯
緱	缑	緱
緲	缈	緲
練	练	練
緶	缏	緶
緹	缇	緹
緻	致	緻
縈	萦	縈
縉	缙	縉
縊	缢	縊
縋	缒	縋
縐	绉	縐
縑	缣	縑
縕	缊	縕
縗	缞	縗
縚	绦	縚
縛	缚	縛
縝	缜	縝
縞	缟	縞
縟	缛	縟
縣	县	県
縧	绦	縧
縫	缝	縫
縭	缡	縭
縮	缩	縮
縯	演	縯
縱	纵	縦
縲	缧	縲
縳	䌸	縳
縳	缚	縳
縴	纤	縴
縵	缦	縵
縶	絷	縶
縷	缕	縷
縹	缥	縹
總	总	総
績	绩	績
繃	绷	繃
繅	缫	繅
繆	缪	繆
繈	襁	繈
繒	缯	繒
織	织	織
繕	缮	繕
繚	缭	繚
繞	绕	繞
繡	绣	繍
繢	缋	繢
繩	绳	縄
繪	绘	絵
繫	系	繋
繭	茧	繭
繮	缰	繮
繯	缳	繯
繰	缲	繰
繳	缴	繳
繸	䍁	繸
繹	绎	繹
繼	继	継
繽	缤	繽
繾	缱	繾
繿	䍀	繿
纃	緕	緕
纈	缬	纈
纊	纩	纊
續	续	続
纍	累	纍
纏	缠	纏
纓	缨	纓
纔	才	纔
纖	纤	繊
纘	缵	纉
纜	缆	纜
缺	欠	欠
缽	钵	缽
罈	坛	罈
罌	罂	罌
罐	缶	缶
罰	罚	罰
署	署	署
罵	骂	罵
罷	罢	罷
羅	罗	羅
羆	罴	羆
羈	羁	羈
羋	芈	羋
羥	羟	羥
羨	羡	羨
義	义	義
羽	羽	羽
習	习	習
翠	翆	翆
翹	翘	翹
者	者	者
耑	端	耑
耬	耧	耬
耮	耢	耮
聖	圣	聖
聞	闻	聞
聯	联	聯
聰	聪	聡
聲	声	声
聳	耸	聳
聵	聩	聵
聶	聂	聶
職	职	職
聹	聍	聹
聽	听	聴
聾	聋	聾
肅	肃	粛
脅	胁	脅
脈	脉	脈
脛	胫	脛
脣	唇	唇
脧	睃	脧
脩	修	修
脫	脱	脱
脹	胀	脹
腎	肾	腎
腖	胨	腖
腡	脶	腡
腦	脑	脳
腫	肿	腫
腳	脚	腳
腸	肠	腸
膃	腽	膃
膚	肤	膚
膠	胶	膠
膩	腻	膩
膽	胆	胆
膾	脍	膾
膿	脓	膿
臉	脸	臉
臍	脐	臍
臏	膑	臏
臘	腊	臘
臚	胪	臚
臟	脏	臓
臠	脔	臠
臢	臜	臢
臥	卧	臥
臨	临	臨
臭	臭	臭
臺	台	台
與	与	与
興	兴	興
舉	举	挙
舊	旧	旧
艙	舱	艙
艣	橹	艣
艤	舣	艤
艦	舰	艦
艫	舻	舮
艱	艰	艱
艷	艳	艶
艸	艹	艸
芐	苄	芐
芻	刍	芻
苎	苧	苎
苧	苎	苧
茍	苟	茍
茲	兹	茲
荊	荆	荊
莊	庄	荘
莖	茎	茎
莢	荚	莢
莧	苋	莧
華	华	華
菴	庵	庵
萇	苌	萇
萊	莱	莱
萬	万	万
萵	莴	萵
葉	叶	葉
葒	荭	葒
著	着	著
葤	荮	葤
葦	苇	葦
葯	药	葯
葷	荤	葷
蒓	莼	蒓
蒔	莳	蒔
蒞	莅	蒞
蒼	苍	蒼
蓀	荪	蓀
蓋	盖	蓋
蓮	莲	蓮
蓯	苁	蓯
蓴	莼	蓴
蓽	荜	蓽
蔆	菱	蔆
蔔	卜	蔔
蔞	蒌	蔞
蔣	蒋	蒋
蔥	葱	蔥
蔦	茑	蔦
蔭	荫	蔭
蕁	荨	蕁
蕆	蒇	蕆
蕎	荞	蕎
蕒	荬	蕒
蕓	芸	蕓
蕕	莸	蕕
蕘	荛	蕘
蕢	蒉	蕢
蕩	荡	蕩
蕪	芜	蕪
蕭	萧	蕭
蕷	蓣	蕷
薀	蕰	薀
薈	荟	薈
薊	蓟	薊
薌	芗	薌
薑	姜	薑
薔	蔷	薔
薘	荙	薘
薟	莶	薟
薦	荐	薦
薧	槁	薧
薩	萨	薩
薰	薫	薫
薳	䓕	薳
薴	苧	薴
薺	荠	薺
藍	蓝	藍
藎	荩	藎
藏	蔵	蔵
藝	艺	芸
藥	药	薬
藪	薮	薮
藴	蕴	藴
藶	苈	藶
藷	薯	藷
藹	蔼	藹
藺	蔺	藺
蘂	蕊	蕊
蘄	蕲	蘄
蘆	芦	蘆
蘇	苏	蘇
蘊	蕴	蘊
蘋	苹	蘋
蘗	蘖	蘗
蘚	藓	蘚
蘞	蔹	蘞
蘢	茏	蘢
蘭	兰	蘭
蘺	蓠	蘺
蘿	萝	蘿
虆	蔂	虆
處	处	処
虛	虚	虚
虜	虏	虜
號	号	号
虧	亏	虧
虯	虬	虯
蛺	蛱	蛺
蛻	蜕	蛻
蜆	蚬	蜆
蝕	蚀	蝕
蝟	猬	蝟
蝦	虾	蝦
蝸	蜗	蝸
螄	蛳	螄
螞	蚂	螞
螢	萤	蛍
螮	䗖	螮
螻	蝼	螻
螿	螀	螿
蟄	蛰	蟄
蟈	蝈	蟈
蟎	螨	蟎
蟣	虮	蟣
蟬	蝉	蝉
蟯	蛲	蟯
蟲	虫	虫
蟶	蛏	蟶
蟻	蚁	蟻
蠅	蝇	蝿
蠆	虿	蠆
蠐	蛴	蠐
蠑	蝾	蠑
蠔	蚝	蠔
蠟	蜡	蝋
蠣	蛎	蛎
蠨	蟏	蠨
蠱	蛊	蠱
蠶	蚕	蚕
蠻	蛮	蛮
衆	众	衆
衊	蔑	衊
術	术	術
衕	同	衕
衚	胡	衚
衛	卫	衛
衝	冲	衝
衞	衛	衛
衹	只	衹
袞	衮	袞
裊	袅	裊
裏	里	裏
補	补	補
裝	装	装
裡	里	裡
製	制	製
複	复	複
褌	裈	褌
褐	褐	褐
褘	袆	褘
褲	裤	褲
褳	裢	褳
褸	褛	褸
褻	亵	褻
襃	褒	褒
襇	裥	襇
襌	褝	褝
襏	袯	襏
襖	袄	襖
襝	裣	襝
襠	裆	襠
襤	褴	襤
襪	袜	襪
襬	䙓	襬
襬	摆	襬
襯	衬	襯
襲	袭	襲
覆	复	覆
覈	核	覈
見	见	見
覎	觃	覎
規	规	規
覓	觅	覓
視	视	視
覘	觇	覘
覡	觋	覡
覥	觍	覥
覦	觎	覦
親	亲	親
覬	觊	覬
覯	觏	覯
覲	觐	覲
覷	觑	覷
覺	觉	覚
覽	览	覧
覿	觌	覿
觀	观	観
觔	筋	觔
觴	觞	觴
觶	觯	觶
觸	触	触
訁	讠	訁
訂	订	訂
訃	讣	訃
計	计	計
訊	讯	訊
訌	讧	訌
討	讨	討
訐	讦	訐
訒	讱	訒
訓	训	訓
訕	讪	訕
訖	讫	訖
託	托	託
託	讬	託
記	记	記
訛	讹	訛
訝	讶	訝
訟	讼	訟
訢	䜣	訢
訢	欣	訢
訣	诀	訣
訥	讷	訥
訩	讻	訩
訪	访	訪
設	设	設
許	许	許
訴	诉	訴
訶	诃	訶
診	诊	診
註	注	註
証	证	証
詁	诂	詁
詆	诋	詆
詎	讵	詎
詐	诈	詐
詒	诒	詒
詔	诏	詔
評	评	評
詖	诐	詖
詗	诇	詗
詘	诎	詘
詛	诅	詛
詞	词	詞
詠	咏	詠
詡	诩	詡
詢	询	詢
詣	诣	詣
試	试	試
詩	诗	詩
詫	诧	詫
詬	诟	詬
詭	诡	詭
詮	诠	詮
詰	诘	詰
話	话	話
該	该	該
詳	详	詳
詵	诜	詵
詼	诙	詼
詿	诖	詿
誄	诔	誄
誅	诛	誅
誆	诓	誆
誇	夸	誇
誌	志	誌
認	认	認
誑	诳	誑
誒	诶	誒
誕	诞	誕
誘	诱	誘
誚	诮	誚
語	语	語
誠	诚	誠
誡	诫	誡
誣	诬	誣
誤	误	誤
誥	诰	誥
誦	诵	誦
誨	诲	誨
說	说	説
誰	谁	誰
課	课	課
誶	谇	誶
誹	诽	誹
誼	谊	誼
誾	訚	誾
調	调	調
諂	谄	諂
諄	谆	諄
談	谈	談
諉	诿	諉
請	请	請
諍	诤	諍
諏	诹	諏
諑	诼	諑
諒	谅	諒
論	论	論
諗	谂	諗
諛	谀	諛
諜	谍	諜
諝	谞	諝
諞	谝	諞
諢	诨	諢
諤	谔	諤
諦	谛	諦
諧	谐	諧
諫	谏	諌
諭	谕	諭
諮	谘	諮
諱	讳	諱
諳	谙	諳
諶	谌	諶
諷	讽	諷
諸	诸	諸
諺	谚	諺
諼	谖	諼
諾	诺	諾
謀	谋	謀
謁	谒	謁
謂	谓	謂
謄	誊	謄
謅	诌	謅
謊	谎	謊
謎	谜	謎
謐	谧	謐
謔	谑	謔
謖	谡	謖
謗	谤	謗
謙	谦	謙
謚	谥	謚
講	讲	講
謝	谢	謝
謠	谣	謡
謨	谟	謨
謫	谪	謫
謬	谬	謬
謭	谫	謭
謳	讴	謳
謹	谨	謹
謾	谩	謾
譅	䜧	譅
證	证	証
譎	谲	譎
譏	讥	譏
譖	谮	譛
識	识	識
譙	谯	譙
譚	谭	譚
譜	谱	譜
譟	噪	譟
譫	谵	譫
譯	译	訳
議	议	議
譴	谴	譴
護	护	護
譸	诪	譸
譽	誉	誉
譾	谫	譾
讀	读	読
變	变	変
讎	雠	讎
讒	谗	讒
讓	让	譲
讕	谰	讕
讖	谶	讖
讚	赞	讃
讜	谠	讜
讞	谳	讞
豈	岂	豈
豎	竖	豎
豐	丰	豊
豔	艳	豔
豫	予	予
豬	猪	猪
豶	豮	豶
貍	狸	狸
貓	猫	猫
貙	䝙	貙
貝	贝	貝
貞	贞	貞
貟	贠	貟
負	负	負
財	财	財
貢	贡	貢
貧	贫	貧
貨	货	貨
販	贩	販
貪	贪	貪
貫	贯	貫
責	责	責
貯	贮	貯
貰	贳	貰
貲	赀	貲
貳	贰	弐
貴	贵	貴
貶	贬	貶
買	买	買
貸	贷	貸
貺	贶	貺
費	费	費
貼	贴	貼
貽	贻	貽
貿	贸	貿
賀	贺	賀
賁	贲	賁
賂	赂	賂
賃	赁	賃
賄	贿	賄
賅	赅	賅
資	资	資
賈	贾	賈
賊	贼	賊
賑	赈	賑
賒	赊	賒
賓	宾	賓
賕	赇	賕
賙	赒	賙
賚	赉	賚
賜	赐	賜
賞	赏	賞
賠	赔	賠
賡	赓	賡
賢	贤	賢
賣	卖	売
賤	贱	賎
賦	赋	賦
賧	赕	賧
質	质	貭
賫	赍	賫
賬	账	賬
賭	赌	賭
賰	䞐	賰
賴	赖	頼
賵	赗	賵
賺	赚	賺
賻	赙	賻
購	购	購
賽	赛	賽
賾	赜	賾
贄	贽	贄
贅	赘	贅
贇	赟	贇
贈	赠	贈
贊	赞	賛
贋	赝	贋
贍	赡	贍
贏	赢	贏
贐	赆	贐
贓	赃	贓
贔	赑	贔
贖	赎	贖
贗	赝	贗
贛	赣	贛
贜	赃	贜
赬	赪	赬
趕	赶	趕
趙	赵	趙
趨	趋	趨
趲	趱	趲
跡	迹	跡
跼	局	跼
踐	践	践
踡	蜷	踡
踫	碰	踫
踴	踊	踴
蹌	跄	蹌
蹕	跸	蹕
蹠	跖	蹠
蹣	蹒	蹣
蹤	踪	蹤
蹺	跷	蹺
躂	跶	躂
躉	趸	躉
躊	踌	躊
躋	跻	躋
躍	跃	躍
躑	踯	躑
躒	跞	躒
躓	踬	躓
躕	蹰	躕
躚	跹	躚
躡	蹑	躡
躥	蹿	躥
躦	躜	躦
躪	躏	躪
軀	躯	躯
車	车	車
軋	轧	軋
軌	轨	軌
軍	军	軍
軑	轪	軑
軒	轩	軒
軔	轫	軔
軛	轭	軛
軟	软	軟
軤	轷	軤
軫	轸	軫
軲	轱	軲
軸	轴	軸
軹	轵	軹
軺	轺	軺
軻	轲	軻
軼	轶	軼
軾	轼	軾
較	较	較
輅	辂	輅
輇	辁	輇
輈	辀	輈
載	载	載
輊	轾	輊
輒	辄	輒
輓	挽	輓
輔	辅	輔
輕	轻	軽
輛	辆	輌
輜	辎	輜
輝	辉	輝
輞	辋	輞
輟	辍	輟
輥	辊	輥
輦	辇	輦
輩	辈	輩
輪	轮	輪
輬	辌	輬
輯	辑	輯
輳	辏	輳
輸	输	輸
輻	辐	輻
輾	辗	輾
輿	舆	輿
轀	辒	轀
轂	毂	轂
轄	辖	轄
轅	辕	轅
轆	辘	轆
轉	转	転
轍	辙	轍
轎	轿	轎
轔	辚	轔
轟	轰	軣
轡	辔	轡
轢	轹	轢
轤	轳	轤
辦	办	辦
辨	弁	弁
辭	辞	辞
辮	辫	辮
辯	辩	弁
農	农	農
迆	迤	迆
迴	回	迴
迺	乃	迺
逕	迳	逕
這	这	這
連	连	連
逬	迸	迸
週	周	週
進	进	進
逸	逸	逸
遊	游	遊
運	运	運
過	过	過
達	达	達
違	违	違
遙	遥	遥
遜	逊	遜
遞	递	逓
遠	远	遠
適	适	適
遲	迟	遅
遷	迁	遷
選	选	選
遺	遗	遺
遼	辽	遼
邁	迈	邁
還	还	還
邇	迩	迩
邊	边	辺
邏	逻	邏
邐	逦	邐
郃	合	郃
郞	郎	郎
郟	郏	郟
郵	邮	郵
都	都	都
鄆	郓	鄆
鄉	乡	鄉
鄒	邹	鄒
鄔	邬	鄔
鄕	郷	郷
鄖	郧	鄖
鄧	邓	鄧
鄭	郑	鄭
鄰	邻	鄰
鄲	郸	鄲
鄴	邺	鄴
鄶	郐	鄶
鄺	邝	鄺
酇	酂	酇
酈	郦	酈
醃	腌	醃
醉	酔	酔
醖	酝	醖
醜	丑	醜
醞	酝	醞
醫	医	医
醬	酱	醤
醱	酦	醗
釀	酿	醸
釁	衅	釁
釃	酾	釃
釅	酽	釅
釋	释	釈
釐	厘	釐
釒	钅	釒
釓	钆	釓
釔	钇	釔
釕	钌	釕
釗	钊	釗
釘	钉	釘
釙	钋	釙
針	针	針
釣	钓	釣
釤	钐	釤
釦	扣	釦
釧	钏	釧
釩	钒	釩
釬	钎	釬
釵	钗	釵
釷	钍	釷
釹	钕	釹
釺	钎	釺
鈀	钯	鈀
鈁	钫	鈁
鈃	钘	鈃
鈄	钭	鈄
鈈	钚	鈈
鈉	钠	鈉
鈍	钝	鈍
鈎	钩	鈎
鈐	钤	鈐
鈑	钣	鈑
鈒	钑	鈒
鈔	钞	鈔
鈕	钮	鈕
鈞	钧	鈞
鈣	钙	鈣
鈥	钬	鈥
鈦	钛	鈦
鈧	钪	鈧
鈮	铌	鈮
鈰	铈	鈰
鈳	钶	鈳
鈴	铃	鈴
鈷	钴	鈷
鈸	钹	鈸
鈹	铍	鈹
鈺	钰	鈺
鈽	钸	鈽
鈾	铀	鈾
鈿	钿	鈿
鉀	钾	鉀
鉅	钜	鉅
鉆	钻	鉆
鉈	铊	鉈
鉉	铉	鉉
鉋	刨	鉋
鉋	铇	鉋
鉍	铋	鉍
鉑	铂	鉑
鉕	钷	鉕
鉗	钳	鉗
鉚	铆	鉚
鉛	铅	鉛
鉞	钺	鉞
鉢	钵	鉢
鉤	钩	鉤
鉦	钲	鉦
鉬	钼	鉬
鉭	钽	鉭
鉶	铏	鉶
鉸	铰	鉸
鉺	铒	鉺
鉻	铬	鉻
鉿	铪	鉿
銀	银	銀
銃	铳	銃
銅	铜	銅
銍	铚	銍
銑	铣	銑
銓	铨	銓
銖	铢	銖
銘	铭	銘
銚	铫	銚
銛	铦	銛
銜	衔	銜
銠	铑	銠
銣	铷	銣
銥	铱	銥
銦	铟	銦
銨	铵	銨
銩	铥	銩
銪	铕	銪
銫	铯	銫
銬	铐	銬
銱	铞	銱
銲	焊	銲
銳	锐	鋭
銷	销	銷
銹	锈	銹
銻	锑	銻
銼	锉	銼
鋁	铝	鋁
鋃	锒	鋃
鋅	锌	鋅
鋇	钡	鋇
鋌	铤	鋌
鋏	铗	鋏
鋒	锋	鋒
鋙	铻	鋙
鋝	锊	鋝
鋟	锓	鋟
鋣	铘	鋣
鋤	锄	鋤
鋥	锃	鋥
鋦	锔	鋦
鋨	锇	鋨
鋩	铓	鋩
鋪	铺	鋪
鋭	锐	鋭
鋮	铖	鋮
鋯	锆	鋯
鋰	锂	鋰
鋱	铽	鋱
鋶	锍	鋶
鋸	锯	鋸
鋼	钢	鋼
錁	锞	錁
錄	录	録
錆	锖	錆
錇	锫	錇
錈	锩	錈
錏	铔	錏
錐	锥	錐
錒	锕	錒
錕	锟	錕
錘	锤	錘
錙	锱	錙
錚	铮	錚
錛	锛	錛
錟	锬	錟
錠	锭	錠
錡	锜	錡
錢	钱	銭
錦	锦	錦
錨	锚	錨
錩	锠	錩
錫	锡	錫
錮	锢	錮
錯	错	錯
録	录	録
錳	锰	錳
錶	表	錶
錸	铼	錸
鍀	锝	鍀
鍁	锨	鍁
鍃	锪	鍃
鍆	钔	鍆
鍇	锴	鍇
鍈	锳	鍈
鍊	链	錬
鍋	锅	鍋
鍍	镀	鍍
鍔	锷	鍔
鍘	铡	鍘
鍚	钖	鍚
鍛	锻	鍛
鍠	锽	鍠
鍤	锸	鍤
鍥	锲	鍥
鍩	锘	鍩
鍬	锹	鍬
鍰	锾	鍰
鍵	键	鍵
鍶	锶	鍶
鍺	锗	鍺
鍾	钟	鍾
鍾	锺	鍾
鎂	镁	鎂
鎄	锿	鎄
鎇	镅	鎇
鎊	镑	鎊
鎔	熔	鎔
鎔	镕	鎔
鎖	锁	鎖
鎗	枪	鎗
鎘	镉	鎘
鎚	锤	鎚
鎛	镈	鎛
鎡	镃	鎡
鎢	钨	鎢
鎣	蓥	鎣
鎦	镏	鎦
鎧	铠	鎧
鎩	铩	鎩
鎪	锼	鎪
鎬	镐	鎬
鎭	鎮	鎮
鎮	镇	鎮
鎰	镒	鎰
鎲	镋	鎲
鎳	镍	鎳
鎵	镓	鎵
鎸	镌	鎸
鎿	镎	鎿
鏃	镞	鏃
鏇	镟	鏇
鏈	链	鏈
鏌	镆	鏌
鏍	镙	鏍
鏐	镠	鏐
鏑	镝	鏑
鏗	铿	鏗
鏘	锵	鏘
鏜	镗	鏜
鏝	镘	鏝
鏞	镛	鏞
鏟	铲	鏟
鏡	镜	鏡
鏢	镖	鏢
鏤	镂	鏤
鏨	錾	鏨
鏰	镚	鏰
鏵	铧	鏵
鏷	镤	鏷
鏹	镪	鏹
鏽	锈	鏽
鐃	铙	鐃
鐉	铣	鐉
鐋	铴	鐋
鐐	镣	鐐
鐒	铹	鐒
鐓	镦	鐓
鐔	镡	鐔
鐘	钟	鐘
鐙	镫	鐙
鐝	镢	鐝
鐠	镨	鐠
鐦	锎	鐦
鐧	锏	鐧
鐨	镄	鐨
鐫	镌	鐫
鐮	镰	鐮
鐲	镯	鐲
鐳	镭	鐳
鐵	铁	鉄
鐶	镮	鐶
鐸	铎	鈬
鐺	铛	鐺
鐽	钽	鐽
鐿	镱	鐿
鑄	铸	鋳
鑊	镬	鑊
鑌	镔	鑌
鑑	监	鑑
鑒	鉴	鑒
鑔	镲	鑔
鑕	锧	鑕
鑛	鉱	鉱
鑞	镴	鑞
鑠	铄	鑠
鑣	镳	鑣
鑤	刨	鑤
鑥	镥	鑥
鑪	鈩	鈩
鑭	镧	鑭
鑰	钥	鑰
鑱	镵	鑱
鑲	镶	鑲
鑷	镊	鑷
鑹	镩	鑹
鑼	锣	鑼
鑽	钻	鑽
鑾	銮	鑾
鑿	凿	鑿
钁	镢	钁
長	长	長
門	门	門
閂	闩	閂
閃	闪	閃
閆	闫	閆
閈	闬	閈
閉	闭	閉
開	开	開
閌	闶	閌
閎	闳	閎
閏	闰	閏
閑	闲	閑
閒	闲	間
間	间	間
閔	闵	閔
閘	闸	閘
閡	阂	閡
閣	阁	閣
閤	合	閤
閥	阀	閥
閨	闺	閨
閩	闽	閩
閫	阃	閫
閬	阆	閬
閭	闾	閭
閱	阅	閲
閲	阅	閲
閶	阊	閶
閹	阉	閹
閻	阎	閻
閼	阏	閼
閽	阍	閽
閾	阈	閾
閿	阌	閿
闃	阒	闃
闆	板	闆
闈	闱	闈
闊	阔	闊
闋	阕	闋
闌	阑	闌
闍	阇	闍
闐	阗	闐
闒	阘	闒
闓	闿	闓
闔	阖	闔
闕	阙	闕
闖	闯	闖
關	关	関
闞	阚	闞
闠	阓	闠
闡	阐	闡
闢	辟	闢
闤	阛	闤
闥	闼	闥
阨	厄	阨
阪	坂	阪
阯	址	阯
陘	陉	陘
陜	陕	陜
陝	陕	陝
陣	阵	陣
陰	阴	陰
陳	陈	陳
陷	陥	陥
陸	陆	陸
陽	阳	陽
隄	堤	隄
隆	隆	隆
隉	陧	隉
隊	队	隊
階	阶	階
隕	陨	隕
際	际	際
隨	随	随
險	险	険
隱	隐	隠
隴	陇	隴
隸	隶	隷
隻	只	隻
雋	隽	雋
雖	虽	雖
雙	双	双
雛	雏	雛
雜	杂	雑
雞	鸡	雞
離	离	離
難	难	難
雲	云	雲
電	电	電
霑	沾	霑
霢	霡	霢
霤	溜	霤
霧	雾	霧
霸	覇	覇
霽	霁	霽
靂	雳	靂
靄	霭	靄
靈	灵	霊
靑	青	青
靖	靖	靖
靚	靓	靚
靜	静	静
靦	䩄	靦
靦	腼	靦
靨	靥	靨
靱	靭	靭
鞀	鼗	鞀
鞏	巩	鞏
鞝	绱	鞝
鞦	秋	鞦
鞽	鞒	鞽
韁	缰	韁
韃	鞑	韃
韆	千	韆
韉	鞯	韉
韋	韦	韋
韌	韧	韌
韍	韨	韍
韓	韩	韓
韙	韪	韙
韜	韬	韜
韞	韫	韞
韻	韵	韻
響	响	響
頁	页	頁
頂	顶	頂
頃	顷	頃
項	项	項
順	顺	順
頇	顸	頇
須	须	須
頊	顼	頊
頌	颂	頌
頎	颀	頎
頏	颃	頏
預	预	預
頑	顽	頑
頒	颁	頒
頓	顿	頓
頗	颇	頗
領	领	領
頜	颌	頜
頡	颉	頡
頤	颐	頤
頦	颏	頦
頭	头	頭
頮	颒	頮
頰	颊	頬
頲	颋	頲
頴	颕	頴
頷	颔	頷
頸	颈	頚
頹	颓	頹
頻	频	頻
頽	颓	頽
顆	颗	顆
題	题	題
額	额	額
顎	颚	顎
顏	颜	顔
顒	颙	顒
顓	颛	顓
顔	颜	顔
願	愿	願
顙	颡	顙
顚	顛	顛
顛	颠	顛
類	类	類
顢	颟	顢
顥	颢	顥
顧	顾	顧
顫	颤	顫
顬	颥	顬
顯	显	顕
顰	颦	顰
顱	颅	顱
顳	颞	顳
顴	颧	顴
風	风	風
颭	飐	颭
颮	飑	颮
颯	飒	颯
颱	台	颱
颳	刮	颳
颶	飓	颶
颸	飔	颸
颺	扬	颺
颺	飏	颺
颻	飖	颻
颼	飕	颼
飀	飗	飀
飄	飘	飄
飆	飙	飆
飈	飚	飈
飛	飞	飛
飜	翻	翻
飠	饣	飠
飢	饥	飢
飣	饤	飣
飥	饦	飥
飩	饨	飩
飪	饪	飪
飫	饫	飫
飭	饬	飭
飮	飲	飲
飯	饭	飯
飲	饮	飲
飴	饴	飴
飼	饲	飼
飽	饱	飽
飾	饰	飾
飿	饳	飿
餃	饺	餃
餄	饸	餄
餅	饼	餅
餉	饷	餉
養	养	養
餌	饵	餌
餎	饹	餎
餏	饻	餏
餑	饽	餑
餒	馁	餒
餓	饿	餓
餕	馂	餕
餖	饾	餖
餘	余	余
餘	馀	餘
餚	肴	餚
餛	馄	餛
餜	馃	餜
餞	饯	餞
餠	餅	餅
餡	馅	餡
館	馆	館
餱	糇	餱
餳	饧	餳
餵	喂	餵
餶	馉	餶
餷	馇	餷
餺	馎	餺
餼	饩	餼
餽	馈	餽
餾	馏	餾
餿	馊	餿
饁	馌	饁
饃	馍	饃
饅	馒	饅
饈	馐	饈
饉	馑	饉
饊	馓	饊
饋	馈	饋
饌	馔	饌
饑	饥	饑
饒	饶	饒
饗	飨	饗
饜	餍	饜
饞	馋	饞
饢	馕	饢
馬	马	馬
馭	驭	馭
馮	冯	馮
馱	驮	馱
馳	驰	馳
馴	驯	馴
馹	驲	馹
駁	驳	駁
駐	驻	駐
駑	驽	駑
駒	驹	駒
駔	驵	駔
駕	驾	駕
駘	骀	駘
駙	驸	駙
駛	驶	駛
駝	驼	駝
駟	驷	駟
駡	骂	駡
駢	骈	駢
駭	骇	駭
駰	骃	駰
駱	骆	駱
駸	骎	駸
駿	骏	駿
騁	骋	騁
騂	骍	騂
騅	骓	騅
騌	骔	騌
騍	骒	騍
騎	骑	騎
騏	骐	騏
騖	骛	騖
騙	骗	騙
騤	骙	騤
騧	䯄	騧
騫	骞	騫
騭	骘	騭
騮	骝	騮
騰	腾	騰
騶	驺	騶
騷	骚	騒
騸	骟	騸
騾	骡	騾
驀	蓦	驀
驁	骜	驁
驂	骖	驂
驃	骠	驃
驄	骢	驄
驅	驱	駆
驊	骅	驊
驌	骕	驌
驍	骁	驍
驏	骣	驏
驒	騨	騨
驕	骄	驕
驗	验	験
驚	惊	驚
驛	驿	駅
驟	骤	驟
驢	驴	驢
驤	骧	驤
驥	骥	驥
驦	骦	驦
驪	骊	驪
驫	骉	驫
骯	肮	骯
髏	髅	髏
髒	脏	髒
髓	髄	髄
體	体	体
髕	髌	髕
髖	髋	髖
髮	发	髪
鬆	松	鬆
鬍	胡	鬍
鬚	须	鬚
鬢	鬓	鬢
鬧	闹	鬧
鬨	哄	鬨
鬩	阋	鬩
鬭	闘	闘
鬮	阄	鬮
鬱	郁	鬱
魎	魉	魎
魘	魇	魘
魚	鱼	魚
魛	鱽	魛
魢	鱾	魢
魨	鲀	魨
魯	鲁	魯
魴	鲂	魴
魷	鱿	魷
魺	鲄	魺
鮁	鲅	鮁
鮃	鲆	鮃
鮊	鲌	鮊
鮋	鲉	鮋
鮍	鲏	鮍
鮎	鲇	鮎
鮐	鲐	鮐
鮑	鲍	鮑
鮒	鲋	鮒
鮓	鲊	鮓
鮚	鲒	鮚
鮜	鲘	鮜
鮝	鲞	鮝
鮞	鲕	鮞
鮦	鲖	鮦
鮪	鲔	鮪
鮫	鲛	鮫
鮭	鲑	鮭
鮮	鲜	鮮
鮳	鲓	鮳
鮶	鲪	鮶
鮺	鲝	鮺
鯀	鲧	鯀
鯁	鲠	鯁
鯇	鲩	鯇
鯉	鲤	鯉
鯊	鲨	鯊
鯒	鲬	鯒
鯔	鲻	鯔
鯕	鲯	鯕
鯖	鲭	鯖
鯗	鲞	鯗
鯛	鲷	鯛
鯝	鲴	鯝
鯡	鲱	鯡
鯢	鲵	鯢
鯤	鲲	鯤
鯧	鲳	鯧
鯨	鲸	鯨
鯪	鲮	鯪
鯫	鲰	鯫
鯰	鲇	鯰
鯰	鲶	鯰
鯴	鲺	鯴
鯷	鳀	鯷
鯽	鲫	鯽
鯿	鳊	鯿
鰁	鳈	鰁
鰂	鲗	鰂
鰃	鳂	鰃
鰈	鲽	鰈
鰉	鳇	鰉
鰍	鳅	鰍
鰏	鲾	鰏
鰐	鳄	鰐
鰒	鳆	鰒
鰓	鳃	鰓
鰜	鳒	鰜
鰟	鳑	鰟
鰠	鳋	鰠
鰣	鲥	鰣
鰥	鳏	鰥
鰨	鳎	鰨
鰩	鳐	鰩
鰭	鳍	鰭
鰮	鳁	鰛
鰱	鲢	鰱
鰲	鳌	鰲
鰳	鳓	鰳
鰵	鳘	鰵
鰷	鲦	鰷
鰹	鲣	鰹
鰺	鲹	鯵
鰻	鳗	鰻
鰼	鳛	鰼
鰾	鳔	鰾
鱂	鳉	鱂
鱅	鳙	鱅
鱈	鳕	鱈
鱉	鳖	鱉
鱒	鳟	鱒
鱔	鳝	鱔
鱖	鳜	鱖
鱗	鳞	鱗
鱘	鲟	鱘
鱝	鲼	鱝
鱟	鲎	鱟
鱠	鲙	鱠
鱣	鳣	鱣
鱤	鳡	鱤
鱧	鳢	鱧
鱨	鲿	鱨
鱭	鲚	鱭
鱯	鳠	鱯
鱷	鳄	鱷
鱸	鲈	鱸
鱺	鲡	鱺
鳥	鸟	鳥
鳧	凫	鳧
鳩	鸠	鳩
鳬	凫	鳬
鳲	鸤	鳲
鳳	凤	鳳
鳴	鸣	鳴
鳶	鸢	鳶
鳾	䴓	鳾
鴆	鸩	鴆
鴇	鸨	鴇
鴉	鸦	鴉
鴒	鸰	鴒
鴕	鸵	鴕
鴛	鸳	鴛
鴝	鸲	鴝
鴞	鸮	鴞
鴟	鸱	鴟
鴣	鸪	鴣
鴦	鸯	鴦
鴨	鸭	鴨
鴯	鸸	鴯
鴰	鸹	鴰
鴴	鸻	鴴
鴷	䴕	鴷
鴻	鸿	鴻
鴿	鸽	鴿
鵁	䴔	鵁
鵂	鸺	鵂
鵃	鸼	鵃
鵐	鹀	鵐
鵑	鹃	鵑
鵒	鹆	鵒
鵓	鹁	鵓
鵜	鹈	鵜
鵝	鹅	鵝
鵠	鹄	鵠
鵡	鹉	鵡
鵪	鹌	鵪
鵬	鹏	鵬
鵮	鹐	鵮
鵯	鹎	鵯
鵲	鹊	鵲
鵷	鹓	鵷
鵾	鹍	鵾
鶄	䴖	鶄
鶇	鸫	鶫
鶉	鹑	鶉
鶊	鹒	鶊
鶓	鹋	鶓
鶖	鹙	鶖
鶘	鹕	鶘
鶚	鹗	鶚
鶡	鹖	鶡
鶥	鹛	鶥
鶩	鹜	鶩
鶪	䴗	鶪
鶬	鸧	鶬
鶯	莺	鴬
鶱	骞	鶱
鶲	鹟	鶲
鶴	鹤	鶴
鶹	鹠	鶹
鶺	鹡	鶺
鶻	鹘	鶻
鶼	鹣	鶼
鶿	鹚	鶿
鷀	鹚	鷀
鷁	鹢	鷁
鷂	鹞	鷂
鷄	鸡	鶏
鷆	鷏	鷏
鷈	䴘	鷈
鷊	鹝	鷊
鷓	鹧	鷓
鷖	鹥	鷖
鷗	鸥	鴎
鷙	鸷	鷙
鷚	鹨	鷚
鷥	鸶	鷥
鷦	鹪	鷦
鷫	鹔	鷫
鷯	鹩	鷯
鷲	鹫	鷲
鷳	鹇	鷳
鷴	鹇	鷴
鷸	鹬	鷸
鷹	鹰	鷹
鷺	鹭	鷺
鷽	鸴	鷽
鷿	䴙	鷿
鸂	㶉	鸂
鸇	鹯	鸇
鸌	鹱	鸌
鸏	鹲	鸏
鸕	鸬	鸕
鸘	鹴	鸘
鸚	鹦	鸚
鸛	鹳	鸛
鸝	鹂	鸝
鸞	鸾	鸞
鹵	卤	鹵
鹹	咸	鹹
鹺	鹾	鹺
鹼	硷	鹸
鹼	碱	鹼
鹽	盐	塩
麗	丽	麗
麥	麦	麦
麩	麸	麸
麴	麹	麹
麵	面	麺
麼	么	麼
麼	麽	麼
麽	么	麽
黃	黄	黄
黌	黉	黌
黑	黒	黒
默	黙	黙
點	点	点
黨	党	党
黲	黪	黲
黴	霉	黴
黶	黡	黶
黷	黩	黷
黽	黾	黽
黿	鼋	黿
鼇	鳌	鼇
鼉	鼍	鼉
鼕	冬	鼕
鼠	鼡	鼡
鼴	鼹	鼴
齊	齐	斉
齋	斋	斎
齎	赍	齎
齏	齑	齏
齒	齿	歯
齔	龀	齔
齕	龁	齕
齗	龂	齗
齙	龅	齙
齜	龇	齜
齟	龃	齟
齠	龆	齠
齡	龄	齢
齣	出	齣
齦	龈	齦
齧	啮	齧
齪	龊	齪
齬	龉	齬
齲	龋	齲
齶	腭	齶
齷	龌	齷
龍	龙	龍
龎	厐	龎
龐	庞	龐
龔	龚	龔
龕	龛	龕
龜	龟	亀
)

end

end
# end of class
