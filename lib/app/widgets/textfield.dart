part of 'widgets.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscureText;
  final double radius;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.textInputType = TextInputType.name,
    this.obscureText = false,
    this.radius = 10,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool whenActive = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        obscureText: widget.obscureText ? whenActive : false,
        keyboardType: widget.textInputType,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppColor.green,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          hintText: widget.hintText,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                      whenActive ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() => whenActive = !whenActive);
                  },
                )
              : null,
        ),
      ),
    );
  }
}
