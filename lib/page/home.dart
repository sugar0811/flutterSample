import 'package:flutter/material.dart';
import 'package:flutter_sample/page/discover.dart';
import 'package:flutter_sample/page/mine.dart';
import 'package:flutter_sample/page/recommend.dart';
import 'package:flutter_sample/page/welfare.dart';

import '../widget/NestedTabBarView1.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Widget> pages;
  var items = [
    _Item("推荐", "assets/images/home_game_normal.png",
        "assets/images/home_game_checked.png"),
    _Item("发现", "assets/images/home_discover_normal.png",
        "assets/images/home_discover_checked.png"),
    _Item("福利大厅", "assets/images/home_welfare_normal.png",
        "assets/images/home_welfare_checked.png"),
    _Item("我的", "assets/images/home_me_normal.png",
        "assets/images/home_me_checked.png")
  ];
  late var bottomWidgets;
  var currentIndex = 0;
  @override
  void initState() {
    super.initState();
    pages = [RecommendPage(), NestedTabBarView1(), WelfarePage(), MinePage()];
    bottomWidgets = items.map((item) =>
        BottomNavigationBarItem(
          icon: Image.asset(
            item.iconNormal,
            width: 30.0,
            height: 30.0,
          ),
          label: item.text,
          activeIcon:Image.asset(
          item.iconChecked,
          width: 30.0,
          height: 30.0,
        )
    )).toList();
  }


  Widget getPage(int index){
    return Offstage(
      offstage: currentIndex != index,
      child: pages[index],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          getPage(currentIndex),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomWidgets,
        fixedColor: Colors.redAccent,
        currentIndex: currentIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
      ),

    );
  }
}

class _Item {
  String text, iconNormal, iconChecked;

  _Item(this.text, this.iconNormal, this.iconChecked);
}
