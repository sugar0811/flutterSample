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
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 12.h),
                                color: Colors.green,
                                height: 82.h,
                              )
                            ],
                          ),
                        ),
                        bottom: TabBar(
                          tabs: tabs
                              .map((e) => Tab(
                                    text: e,
                                  ))
                              .toList(),
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
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                              context)),
                           SliverToBoxAdapter(
                              child: Container(
                                margin: EdgeInsets.only(top: 0.h),
                                height: 30.0,
                                color: Colors.grey,
                                child: Text(
                                  "page1",
                                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                                ),
                              )),
                      ],
                    );
                  }),
                  Text("page2")
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
}
