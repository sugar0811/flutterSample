import 'package:flutter/material.dart';

// 标签横向布局
class TagsWidget extends StatefulWidget {
  final List<String> tagsData;
  final Color? borderColor, textColor, bgColor;
  final EdgeInsetsGeometry? padding, margin, spacing;

  const TagsWidget({
    Key? key,
    required this.tagsData,
    this.borderColor,
    this.textColor = const Color(0xff666666),
    this.bgColor,
    this.padding = const EdgeInsets.all(2.0),
    this.margin = const EdgeInsets.only(left: 5.0),
    this.spacing = const EdgeInsets.all(2.0),
  }) : super(key: key);

  @override
  State<TagsWidget> createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  @override
  Widget build(BuildContext context) {
    var tags = widget.tagsData
        .map((tag) => Container(
              margin: widget.margin,
              padding: widget.padding,
              decoration: BoxDecoration(
                  color: widget.bgColor,
                  border: widget.borderColor != null
                      ? Border.all(color: widget.borderColor!)
                      : null,
                  borderRadius: const BorderRadius.all(Radius.circular(5.0))),
              child: Text(
                tag,
                style: TextStyle(fontSize: 12.0, color: widget.textColor),
              ),
            ))
        .toList();

    return Row(
      children: tags,
    );
  }
}
