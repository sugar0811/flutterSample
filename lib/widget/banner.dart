import 'dart:async';

import 'package:flutter/material.dart';

// 轮播图控件
class BannerWidget extends StatefulWidget {
  final List<String> _images;
  final ValueChanged<int>? onTap;
  final double height;
  final int duration;

  const BannerWidget(this._images,
      {Key? key, this.onTap, this.height = 200, this.duration = 3})
      : super(key: key);

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  int currentIndex = 0;
  late final PageController _pageController;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    currentIndex = widget._images.length;
    _pageController = PageController(initialPage: currentIndex,viewportFraction: 0.9);
    _initTimer();
  }

  void _initTimer() {
    _timer = Timer.periodic(Duration(seconds: widget.duration), (timer) {
      currentIndex++;
      _pageController.animateToPage(currentIndex,
          duration: const Duration(seconds: 1), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // 图片
        _buildPageView(),
        // 指示器
        _buildIndicator()
      ],
    );
  }

  Widget _buildPageView() {
    return NotificationListener(
        onNotification: (ScrollNotification notify){
          // 滑动时暂停自动轮播
          if(notify.depth == 0 && notify is ScrollStartNotification){
            _timer.cancel();
          }else if(notify is ScrollEndNotification){
            _timer.cancel();
            _initTimer();
          }
          return false;
        },
        child: SizedBox(
      height: widget.height,
      child: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              if (index == 0) {
                currentIndex = widget._images.length;
                _pageController.jumpToPage(currentIndex);
              } else {
                currentIndex = index;
              }
            });
          },
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (widget.onTap != null) {
                  widget.onTap!(index % widget._images.length);
                }
              },
              child: Container(
                margin:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(
                          widget._images[index % widget._images.length]),
                      fit: BoxFit.cover),
                ),
              ),
            );

            // Image.asset(widget._images[index],height: widget.height,width: double.infinity,);
          }),
    )
    );
  }

  Widget _buildIndicator() {
    return Positioned(
      bottom: 10,
      child: Row(
        children: widget._images
            .map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: ClipOval(
                  child: Container(
                    width: 8,
                    height: 8,
                    color: (widget._images.indexOf(e) == currentIndex % widget._images.length) ? Colors.white : Colors.grey,
                  ),
                )))
            .toList(),
      ),
    );
  }
}
