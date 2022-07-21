import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/sliver_header_delegate.dart';

///  @author: shuYang
///  @date: 2022/7/20
///  @description:
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
                            onPressed: () {},
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
                                color: Color(0xfff5f5f5),
                              ))
                            ],
                          ),
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(40.h),
                          child: Material(
                            color: Colors.white,
                            child: TabBar(
                              labelColor: Colors.red,
                              unselectedLabelColor: Color(0xff666666),
                              indicatorSize: TabBarIndicatorSize.label,
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(width: 3.w,color: Colors.red)
                              ),
                              tabs: tabs
                                  .map((e) => Tab(
                                        child: Container(
                                          child: Text(e),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        )),
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  Builder(builder: (BuildContext context) {
                    return CustomScrollView(
                      slivers: [
                        SliverOverlapInjector(
                            handle:
                                NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context)),
                        SliverToBoxAdapter(
                            child: Container(
                          margin: EdgeInsets.only(top: 0.h),
                          height: 30.0,
                          color: Colors.grey,
                          child: const Text(
                            "page1",
                            style:
                                TextStyle(color: Colors.black, fontSize: 20.0),
                          ),
                        )),
                      ],
                    );
                  }),
                  const Text("page2")
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 49.h,
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 7.h),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(color: Color(0xffD3D3D3), width: 1.0))),
            child: Row(
              children: const [Text("云,,,,")],
            ),
          ),
        )
      ],
    );
  }

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
  Container _welfareArea() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
      height: 82.h,
      child: Row(
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
                        alignment: Alignment.center,
                        height: 10.h,
                        width: 70.w,
                        margin: EdgeInsets.only(top: 7.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.w),
                          color: const Color(0xffc2c2c2),
                        ),
                        child: Text(
                          "0%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.w,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 58.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.w),
                    color: Color(0xffff650e),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
