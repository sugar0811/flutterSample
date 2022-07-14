import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_sample/BatteryChannel.dart';
import 'package:flutter_sample/widget/game.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  List<ActionItem> actionItems = [
    ActionItem.action("云手机", "assets/images/home_main_features_phone.png"),
    ActionItem.action("新游首发", "assets/images/home_main_features_new_game.png"),
    ActionItem.action(
        "邀请返现", "assets/images/home_main_features_invitation.png"),
    ActionItem.action(
        "免费领券", "assets/images/home_main_features_game_voucher.png"),
    ActionItem.action("会员福利", "assets/images/home_main_features_welfare.png")
  ];

  String _batteryLevel = 'Unknown battery level.';

  // 3.异步获取到电量，然后重新渲染页面
  getBatteryLevel() async {
    _batteryLevel = await BatteryChannel.getBatteryLevel();
    setState(() {});
  }

  List<Widget> getActionWidgets() {
    return actionItems
        .map(
          (e) =>
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              e.actionIcon,
              width: 50.0,
              height: 50.0,
            ),
            const Padding(padding: EdgeInsets.only(top: 5.0)),
            Text(e.actionName),
          ]),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF7F7FA),
      child: actionBar(),
    );
  }

  @override
  void initState() {
    super.initState();
    BatteryChannel.initChannels();
  }

  Widget actionBar() {
    return Scrollbar(child: SingleChildScrollView(
      child: Center(
        child:Column(
          children: [
            Stack(
              children: [
                Image.asset("assets/images/home_main_top_bg.png"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      // 搜索栏+下载中心
                      Container(
                        margin: const EdgeInsets.only(top: 50.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                  height: 36.0,
                                  padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                                  margin: const EdgeInsets.only(right: 10.0),
                                  decoration: const BoxDecoration(
                                      color: Color.fromRGBO(255, 255, 255, 0.1),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/home_main_search_white.png",
                                          width: 16.0,
                                          height: 16.0),
                                      const Padding(padding: EdgeInsets.only(left: 10.0)),
                                      const Text("热门搜索",
                                          style: TextStyle(
                                              color: Color.fromRGBO(255, 255, 255, 0.2)))
                                    ],
                                  ),
                                )),
                            Image.asset(
                              "assets/images/home_main_download_center.png",
                              width: 30.0,
                              height: 30.0,
                            )
                          ],
                        ),
                      ),
                      // 金刚区
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 16.0),
                        height: 90.0,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 20.0,
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: getActionWidgets(),
                        ),
                      ),
                      // 抽奖结果公示栏
                      Container(
                        width: double.infinity,
                        height: 20.0,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          color: Colors.white,
                        ),
                        child: const Text(
                          "用户137******5436获得10元现金礼包获得10元现金礼包。",
                          style: TextStyle(fontSize: 13.0, color: Color(0xfff35A06)),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      Image.asset("assets/images/home_main_walfare.png"),
                      const Padding(padding: EdgeInsets.only(top: 10.0)),
                      Row(
                        children: [
                          Container(
                            height: 12.0,
                            width: 3.0,
                            margin: const EdgeInsets.only(right: 5.0),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              gradient: LinearGradient(
                                  colors: [Color(0xffF47E5C), Color(0xffF4592F)]),
                            ),
                          ),
                          const Text(
                            "精选推荐",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 12.0,
                            width: 3.0,
                            margin: const EdgeInsets.only(right: 5.0),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              gradient: LinearGradient(
                                  colors: [Color(0xffF47E5C), Color(0xffF4592F)]),
                            ),
                          ),
                          const Text(
                            "热门游戏",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      // ListView.builder(itemBuilder:(BuildContext context, int index) =>  )
                    ],
                  ),
                ),
              ],

            ),

                ],),
      )



      ,
    ));
  }

}



class ActionItem {
  String actionName, actionIcon;

  ActionItem.action(this.actionName, this.actionIcon);
}
