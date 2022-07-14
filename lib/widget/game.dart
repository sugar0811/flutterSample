import 'package:flutter/material.dart';

class GameWidget extends StatefulWidget {

  final GameItem gameItem;

  const GameWidget({Key? key, required this.gameItem}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(13.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
            )
          ]),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(13.0),
                topRight: Radius.circular(13.0)),
            child: Image.asset(widget.gameItem.cover),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, top: 10.0, right: 20.0, bottom: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.gameItem.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 15.0),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5.0),
                            padding: const EdgeInsets.all(2.0),
                            decoration: const BoxDecoration(
                                color: Color(0xffF2F2F2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            child: const Text(
                              "传奇",
                              style: TextStyle(
                                  fontSize: 12.0, color: Color(0xff666666)),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 3.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffF04D4D)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5.0))),
                        child: const Text(
                          "首充优惠",
                          style: TextStyle(
                              fontSize: 10.0, color: Color(0xffF04D4D)),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.end,
                  text: const TextSpan(
                      text: "8.6",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xffF35A06),
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: " 分",
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w500))
                      ]),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 15.0),
                  decoration: const BoxDecoration(
                      color: Color(0xffF35A06),
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  child: const Text(
                    "下载",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GameItem {
  String name, cover, gameId, logo, score, maxAmout;
  List<String> activityTags, tags;

  GameItem(this.name, this.cover, this.gameId, this.logo, this.score,
      this.maxAmout, this.activityTags, this.tags);
}
