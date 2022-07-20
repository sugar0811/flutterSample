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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
            surfaceTintColor:Colors.black,
            foregroundColor: Colors.orange,
              leading: Text("leading"),
                actions: [
                  Text("王者荣耀1 "),
                  Text("王者荣耀2 "),
                  Text("王者荣耀3 "),
                ],
                backgroundColor: Colors.white,
                expandedHeight: 220.h,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/home_game_detail_top_bg.png"),
                            fit: BoxFit.cover,
                            opacity: 0.7)),
                  ),
                )),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.green,
                height: 82.h,
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegate(
                  child: Container(
                      color: Colors.orange, child: const Text("tabBar")),
                  maxHeight: 50.0,
                  minHeight: 50.0),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.red,
                height: 900.h,
                child: Column(
                  children: [
                    Text("1"),
                    Text(
                      "2",
                    ),
                    Text(
                      "3",
                    ),
                    Text(
                      "4",
                    ),
                    Text(
                      "5",
                    ),
                    Text(
                      "6",
                    )
                  ],
                ),
              ),
            ),
          ],
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
