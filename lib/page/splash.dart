import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sample/page/home.dart';
import 'package:flutter_sample/util/screen_utils.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  _SplashWidgetState createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtils.screenW(context),
      height: ScreenUtils.screenH(context),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const Image(
            image: AssetImage("assets/images/common_bg_start.webp"),
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.topRight,
            child: CountDownWidget(
              onCountDownFinishCallBack: finish,
            ),
          ),
        ],
      ),
    );
  }

  void finish(bool value) {
    if (value) {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return const HomePage();
          }));
    }
  }

}

class CountDownWidget extends StatefulWidget {
  final onCountDownFinishCallBack;

  const CountDownWidget({Key? key, @required this.onCountDownFinishCallBack})
      : super(key: key);

  @override
  _CountDownWidgetState createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  var _second = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "$_second",
      style: const TextStyle(fontSize: 16.0),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
      if (_second <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _second--;
    });
  }

  void _cancelTimer() {
    _timer?.cancel();
  }
}
