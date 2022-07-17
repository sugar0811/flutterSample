import 'package:flutter/material.dart';
import 'package:flutter_sample/widget/tags.dart';

class GameWidget extends StatefulWidget {
  final GameItem gameItem;
  final bool isDownloadEnable;

  const GameWidget({Key? key, required this.gameItem , this.isDownloadEnable = false}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                          TagsWidget(tagsData: widget.gameItem.tags,bgColor: const Color(0xffF2F2F2),),
                        ],
                      ),
                      TagsWidget(
                          tagsData: widget.gameItem.activityTags,
                          borderColor: const Color(0xffF04D4D),
                          textColor: const Color(0xffF04D4D),
                          margin: const EdgeInsets.only(top: 5.0,right: 3.0),
                          padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 2.0),
                          spacing: const EdgeInsets.only(left: 3.0),
                      ),

                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.end,
                  text: TextSpan(
                      text: widget.gameItem.score,
                      style: const TextStyle(
                          fontSize: 18.0,
                          color: Color(0xffF35A06),
                          fontWeight: FontWeight.w500),
                      children: const [
                        TextSpan(
                            text: " 分",
                            style: TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.w500))
                      ]),
                ),
                Offstage(
                  offstage: !widget.isDownloadEnable,
                  child:  Container(
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
