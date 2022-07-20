import 'package:flutter/material.dart';
import 'package:flutter_sample/page/home.dart';
import 'package:flutter_sample/page/recommend.dart';
import 'package:flutter_sample/page/test2.dart';

import '../widget/test_widget.dart';

///  @author: shuYang
///  @date: 2022/7/20
///  @description:

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  var str = "测试";
  var isShow = false;

  @override
  void initState() {
    print("_TestPageState initState");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("_TestPageState didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void reassemble() {
    print("_TestPageState reassemble");
    super.reassemble();
  }

  @override
  void didUpdateWidget(covariant TestPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("_TestPageState didUpdateWidget");
  }

  @override
  void activate() {
    print("_TestPageState activate");
    super.activate();
  }

  @override
  Widget build(BuildContext context) {
    print("_TestPageState build");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: onPressed, child: Text(str)),
        Offstage(
          offstage: !isShow,
          child: Text("动态显示的内容"),
        ),
      ],
    );
  }

  @override
  void deactivate() {
    print("_TestPageState deactivate");
    super.deactivate();
  }

  @override
  void dispose() {
    print("_TestPageState dispose");
    super.dispose();
  }

  void onPressed() {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
      return TestPage2();
    }));
  }
}
