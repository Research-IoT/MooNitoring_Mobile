part of 'widgets.dart';

class CircleContainer extends StatelessWidget {
  final double height;
  final double width;
  final String name;
  final double sizeName;
  final String desc;
  final double sizeDesc;
  final Color color;

  const CircleContainer({
    super.key,
    this.height = 100,
    this.width = 100,
    required this.name,
    this.sizeName = 14,
    required this.desc,
    this.sizeDesc = 10,
    this.color = AppColor.black,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: color,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: name,
              style: body1.copyWith(fontSize: sizeName),
            ),
            const SizedBox(height: 5),
            AppText(
              text: desc,
              style: paragraph3.copyWith(fontSize: sizeDesc),
            ),
          ],
        ),
      ),
    );
  }
}

class ToggleOnOff extends StatefulWidget {
  final double height;
  final double width;
  final String icPath;
  final String name;
  final String desc;
  final bool isToggled;
  final bool isSwitchEnabled;
  final Function valueChanged;

  const ToggleOnOff({
    super.key,
    required this.height,
    required this.width,
    required this.icPath,
    required this.isToggled,
    required this.name,
    required this.desc,
    this.isSwitchEnabled = true,
    required this.valueChanged,
  });

  @override
  State<ToggleOnOff> createState() => _ToggleOnOffState();
}

class _ToggleOnOffState extends State<ToggleOnOff> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: AppColor.grey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
              child: Image.asset(
                widget.icPath,
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: widget.name,
                    style: body2,
                  ),
                  AppText(
                    text: widget.desc,
                    style: paragraph3.copyWith(fontSize: 10),
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Switch(
              activeColor: AppColor.green,
              value: widget.isToggled,
              onChanged: widget.isSwitchEnabled
                  ? (value) {
                      setState(() {
                        widget.valueChanged(value);
                      });
                    }
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
