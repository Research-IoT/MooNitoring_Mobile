part of 'widgets.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double top;
  final double left;
  final double right;
  final double bottom;
  final TextOverflow overflow;
  final int maxLines;
  final TextAlign textAlign;

  AppText({
    super.key,
    required this.text,
    TextStyle? style,
    this.top = 0.0,
    this.left = 0.0,
    this.right = 0.0,
    this.bottom = 0.0,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
  })  : style = style ?? paragraph2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.only(
          left: left,
          top: top,
          right: right,
          bottom: bottom,
        ),
        child: Text(
          text,
          textAlign: textAlign,
          style: style,
          overflow: overflow,
          maxLines: maxLines,
        ),
      ),
    );
  }
}
