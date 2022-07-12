import 'package:flutter/material.dart';

class RecommendPage extends StatefulWidget {
  const RecommendPage({Key? key}) : super(key: key);

  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  List<ActionItem> actionItems = [
    ActionItem.action("云手机", "images/home_main_features_phone.png"),
    ActionItem.action("新游首发", "images/home_main_features_new_game.png"),
    ActionItem.action("邀请返现", "images/home_main_features_invitation.png"),
    ActionItem.action("免费领券", "images/home_main_features_game_voucher.png"),
    ActionItem.action("会员福利", "images/home_main_features_welfare.png")
  ];

  List<Widget> getActionWidgets() {
    return actionItems
        .map(
          (e) => Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              e.actionIcon,
              width: 60.0,
              height: 60.0,
            ),
            Text(e.actionName),
          ]),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          actionBar(),
        ],
      ),
    );
  }

  Widget actionBar() {
    return Stack(
      children: [
        Image.asset("images/home_main_top_bg.png"),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  left: 20.0, top: 50.0, right: 20.0, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    height: 36.0,
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.1),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Row(
                      children: [
                        Image.asset("images/home_main_search_white.png",
                            width: 16.0, height: 16.0),
                        const Padding(padding: EdgeInsets.only(left: 10.0)),
                        const Text("热门搜索",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.2)))
                      ],
                    ),
                  )),
                  Image.asset(
                    "images/home_main_download_center.png",
                    width: 30.0,
                    height: 30.0,
                  )
                ],
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              height: 110.0,
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
            )
          ],
        ),
      ],
    );
  }
}

class ActionItem {
  String actionName, actionIcon;

  ActionItem.action(this.actionName, this.actionIcon);
}
