import 'package:flutter/material.dart';
import 'package:flutter_sample/widget/round_underline_tab_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/sliver_header_delegate.dart';

///  @author: shuYang
///  @date: 2022/7/20
///  @description: 游戏详情页
class GameDetailPage extends StatefulWidget {
  const GameDetailPage({Key? key}) : super(key: key);

  @override
  _GameDetailPageState createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  final ScrollController _scrollController = ScrollController();
  Color iconColor = Colors.white;
  Color textColor = const Color.fromRGBO(255, 255, 255, 0);
  List<String> tabs = ["详情", "评论"];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      if (offset > 220.h) {
        return;
      }
      setState(() {
        var scale = offset / 220.h;
        var color = 255 - (255 * (scale)).toInt();
        iconColor = Color.fromRGBO(color, color, color, 1);
        textColor = Color.fromRGBO(color, color, color, scale);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: tabs.length,
          child: Scaffold(
            body: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                        centerTitle: true,
                        title: Text("王者荣耀", style: TextStyle(color: textColor)),
                        leading: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: ImageIcon(
                              const AssetImage(
                                  "assets/images/common_back_white.png"),
                              color: iconColor,
                              size: 30.0,
                            )),
                        actions: [
                          IconButton(
                              onPressed: () {},
                              icon: ImageIcon(
                                const AssetImage(
                                    "assets/images/common_coll_normal.png"),
                                color: iconColor,
                                size: 30.0,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: ImageIcon(
                                const AssetImage(
                                    "assets/images/common_share_white.png"),
                                color: iconColor,
                                size: 30.0,
                              ))
                        ],
                        expandedHeight: 354.h,
                        backgroundColor: Colors.white,
                        pinned: true,
                        flexibleSpace: FlexibleSpaceBar(
                          background: Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/home_game_detail_top_bg.png"),
                                        fit: BoxFit.cover,
                                        opacity: 0.7)),
                                height: 220.h,
                                width: double.infinity,
                                child: _gameMsgArea(),
                              ),
                              _welfareArea(),
                              Expanded(
                                  child: Container(
                                color: const Color(0xfff5f5f5),
                              ))
                            ],
                          ),
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(46.h),
                          child: Container(
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(color: Color(0xffEFEFEF)))),
                            child: Material(
                              color: Colors.white,
                              child: TabBar(
                                labelColor: Colors.red,
                                unselectedLabelColor: const Color(0xff666666),
                                indicatorSize: TabBarIndicatorSize.label,
                                indicatorPadding:
                                    const EdgeInsets.only(bottom: 5.0),
                                indicator: RoundUnderlineTabIndicator(
                                    indicatorWidth: 26.w,
                                    borderSide: BorderSide(
                                        width: 2.w, color: Colors.red)),
                                tabs: tabs
                                    .map((e) => Tab(
                                          child: Container(
                                            child: Text(e),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        )),
                  ),
                ];
              },
              body: TabBarView(
                children: tabs.map((e) => _generateTabBarView(e)).toList(),
              ),
            ),
          ),
        ),
        bottomMenu()
      ],
    );
  }

  /// 底部菜单栏
  Positioned bottomMenu() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 49.h,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 7.h),
        decoration: const BoxDecoration(
            color: Colors.white,
            border:
                Border(top: BorderSide(color: Color(0xffD3D3D3), width: 1.0))),
        child: Row(
          children: [
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 11.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: const Color(0xffF35904))),
                child: const Text(
                  "云挂机",
                  style: TextStyle(color: Color(0xffF35904)),
                )),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20.w, right: 10.w),
                width: 200.w,
                padding:
                    const EdgeInsets.symmetric(vertical: 6.0, horizontal: 11.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: const Color(0xffF35904)),
                child: const Text(
                  "下载",
                  style: TextStyle(color: Colors.white),
                )),
            Image.asset("assets/images/home_game_detial_menu_commend.png")
          ],
        ),
      ),
    );
  }

  /// 上部分游戏信息区
  Stack _gameMsgArea() {
    return Stack(
      children: [
        Container(
          color: const Color.fromRGBO(0, 0, 0, 0.3),
        ),
        Positioned(
          left: 15.w,
          top: 130.h,
          width: 66.w,
          height: 66.w,
          child: Image.asset("assets/images/home_game_detail_logo.png"),
        ),
        Positioned(
            left: 95.w,
            top: 124.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "王者荣耀",
                  style: TextStyle(
                      fontSize: 18.w,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      shadows: const [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(2, 3.0),
                            blurRadius: 2.0),
                      ]),
                ),
                Container(
                  width: 130.w,
                  child: Wrap(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(maxWidth: 56.w),
                        margin: EdgeInsets.only(top: 4.h, right: 7.w),
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: const Color.fromRGBO(0, 0, 0, 0.5)),
                        child: Center(
                            child: Text("最多五个字",
                                style: TextStyle(
                                    fontSize: 10.w, color: Colors.white),
                                maxLines: 1)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(maxWidth: 56.w),
                        margin: EdgeInsets.only(top: 4.h, right: 7.w),
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: const Color.fromRGBO(0, 0, 0, 0.5)),
                        child: Center(
                            child: Text("最多五个字",
                                style: TextStyle(
                                    fontSize: 10.w, color: Colors.white),
                                maxLines: 1)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(maxWidth: 56.w),
                        margin: EdgeInsets.only(top: 4.h, right: 7.w),
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: const Color.fromRGBO(0, 0, 0, 0.5)),
                        child: Center(
                            child: Text("最多五个字",
                                style: TextStyle(
                                    fontSize: 10.w, color: Colors.white),
                                maxLines: 1)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(maxWidth: 56.w),
                        margin: EdgeInsets.only(top: 4.h, right: 7.w),
                        padding: const EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 3.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.w),
                            color: const Color.fromRGBO(0, 0, 0, 0.5)),
                        child: Center(
                            child: Text("最多五个字",
                                style: TextStyle(
                                    fontSize: 10.w, color: Colors.white),
                                maxLines: 1)),
                      )
                    ],
                  ),
                ),
              ],
            )),
        Positioned(
            right: 16.w,
            bottom: 28.h,
            child: Container(
              padding: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  color: const Color.fromRGBO(0, 0, 0, 0.5)),
              child: Column(
                children: [
                  Text(
                    "评分",
                    style: TextStyle(color: Colors.white, fontSize: 10.w),
                  ),
                  Text(
                    "8.6",
                    style: TextStyle(color: Colors.white, fontSize: 24.w),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  /// 游戏福利区
  Widget _welfareArea() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      height: 82.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 142.w,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.w),
                border: Border.all(
                  color: const Color(0xffFD4B0F),
                )),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 6.h)),
                      RichText(
                        text: TextSpan(
                          text: "￥",
                          style: TextStyle(
                              fontSize: 12.w,
                              color: const Color(0xfff35a06),
                              fontWeight: FontWeight.w600),
                          children: [
                            TextSpan(
                                text: "50", style: TextStyle(fontSize: 18.w))
                          ],
                        ),
                      ),
                      Text(
                        "免费充值卷",
                        style: TextStyle(
                            color: const Color(0xff666666), fontSize: 10.w),
                      ),
                      Container(
                        alignment: Alignment.topCenter,
                        height: 12.h,
                        width: 70.w,
                        margin: EdgeInsets.only(top: 4.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: const Color(0xffc2c2c2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "0%",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 58.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: const Color(0xffff650e),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "抢",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 17.w),
                      ),
                      Text(
                        "余868张",
                        style: TextStyle(color: Colors.white, fontSize: 10.w),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 88.w,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage(
                        "assets/images/home_game_detail_welfare_bg.png")),
                borderRadius: BorderRadius.circular(12.w)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("游戏福利",
                    style: TextStyle(
                        fontSize: 14.w,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: const [
                          BoxShadow(
                              color: Color(0xffBD5F00),
                              offset: Offset(1, 1),
                              blurRadius: 2.0)
                        ])),
                Text("价值 ￥399",
                    style: TextStyle(
                        fontSize: 10.w,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: const [
                          BoxShadow(
                              color: Color(0xffBD5F00),
                              offset: Offset(1, 1),
                              blurRadius: 2.0)
                        ]))
              ],
            ),
          ),
          Container(
            width: 88.w,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    image: const AssetImage(
                        "assets/images/home_game_detail_gift_bg.png")),
                borderRadius: BorderRadius.circular(12.w)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("游戏礼包",
                    style: TextStyle(
                        fontSize: 14.w,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: const [
                          BoxShadow(
                              color: Color(0xffBD5F00),
                              offset: Offset(1, 1),
                              blurRadius: 2.0)
                        ])),
                Text("超值大礼",
                    style: TextStyle(
                        fontSize: 10.w,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        shadows: const [
                          BoxShadow(
                              color: Color(0xffBD5F00),
                              offset: Offset(1, 1),
                              blurRadius: 2.0)
                        ]))
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 构建tab下的子页面
  Widget _generateTabBarView(String e) {
    return Builder(builder: (BuildContext context) {
      var index = tabs.indexOf(e);
      return CustomScrollView(
        slivers: [
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          index == 0
              ? SliverToBoxAdapter(child: _generateDetailPage())
              : _generateCommentPage()
        ],
      );
    });
  }

  /// 详情页
  Widget _generateDetailPage() {
    return Container(
      // padding: EdgeInsets.only(left: 16.w),
      color: const Color(0xfff5f5f5),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 1.h),
            color: Colors.white,
            height: 166.h,
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: const DecorationImage(
                          image: AssetImage(
                              "assets/images/home_game_banner_3.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                );
              },
              itemCount: 3,
              controller: PageController(viewportFraction: 0.9),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              children: const [
                Text(
                    '《饲鲲救原》是一款魔幻题材的即时战斗三端网游，武易传奇游戏画面以怀旧写实为基调，力求营造出写实逼真效果，游戏音乐以魔幻哥特为主，做到了音效能够完美地体现画面的氛围。zol提供武易传奇下载。 饲鲲救原以怀旧为主题，原滋原味地呈现经典PK，以创新为根本，分工明确的职业架构。'),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 12.h),
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "玩家必看",
                  style: TextStyle(fontSize: 15.0, color: Color(0xff121212)),
                ),
                const Padding(padding: EdgeInsets.only(top: 6.0)),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 1.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff147AE3)),
                          borderRadius: BorderRadius.circular(6.0)),
                      child: const Text(
                        "公告",
                        style:
                            TextStyle(color: Color(0xff147AE3), fontSize: 10.0),
                      ),
                    ),
                    const Text(
                      "版本号1.1更新日期9月10日",
                      style:
                          TextStyle(color: Color(0xff333333), fontSize: 14.0),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 12.h),
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "推荐游戏",
                  style: TextStyle(fontSize: 15.0, color: Color(0xff121212)),
                ),
                const Padding(padding: EdgeInsets.only(top: 6.0)),
                SizedBox(
                  height: 60.h,
                  child: _generateRecommendList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _generateRecommendList() {
    return ListView.builder(
      itemBuilder: (a, b) => Container(
          margin: const EdgeInsets.only(right: 14.0),
          child: Image.asset("assets/images/home_game_detail_logo.png")),
      itemCount: 20,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _generateCommentPage() {
    return SliverList(
        delegate: SliverChildBuilderDelegate((context, index) => Container(
            color: Colors.white,
            height: 50.h,
            margin: const EdgeInsets.only(right: 14.0),
            child: Center(child: Text("评论$index"))),childCount: 80));
  }
}
