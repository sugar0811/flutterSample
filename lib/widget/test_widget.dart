import 'package:flutter/material.dart';

///  @author: shuYang
///  @date: 2022/7/20
///  @description:

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {

  var str = "测试";
  var isShow = false;

  @override
  void initState() {
    print("TestWidget initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("TestWidget didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    print("TestWidget reassemble");
    super.reassemble();
  }

  @override
  void didUpdateWidget(covariant TestWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("TestWidget didUpdateWidget");
  }

  @override
  void activate() {
    print("TestWidget activate");
    super.activate();
  }

  @override
  Widget build(BuildContext context) {
    print("TestWidget build");
    return Text("TestWidget");
  }

  @override
  void deactivate() {
    print("TestWidget deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("TestWidget dispose");
    super.dispose();
  }

  void onPressed() {
    setState(() {
      str = "更新内容后";
      isShow = true;
    });
  }
}
