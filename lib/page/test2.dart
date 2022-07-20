import 'package:flutter/material.dart';
import 'package:flutter_sample/page/home.dart';
import 'package:flutter_sample/page/recommend.dart';

import '../widget/test_widget.dart';

///  @author: shuYang
///  @date: 2022/7/20
///  @description:

class TestPage2 extends StatefulWidget {
  const TestPage2({Key? key}) : super(key: key);

  @override
  _TestPage2State createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {

  var str = "测试";
  var isShow = false;

  @override
  void initState() {
    print("_TestPage2State initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("_TestPage2State didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    print("_TestPage2State reassemble");
    super.reassemble();
  }

  @override
  void didUpdateWidget(covariant TestPage2 oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("_TestPage2State didUpdateWidget");
  }

  @override
  void activate() {
    print("_TestPage2State activate");
    super.activate();
  }

  @override
  Widget build(BuildContext context) {
    print("_TestPage2State build");
    return Text("_TestPage2State");
  }

  @override
  void deactivate() {
    print("_TestPage2State deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("_TestPage2State dispose");
    super.dispose();
  }

}
