part of 'widgets.dart';

class PassFormField extends StatefulWidget {
  final String hintText;
  final Color textColor;
  final TextEditingController textEditingController ;

 const PassFormField(
      {super.key, required this.hintText, required this.textColor, required this.textEditingController});

  @override
  State<PassFormField> createState() => _PassFormFieldState();
}

class _PassFormFieldState extends State<PassFormField> {
  bool isVisible = true;
 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: widget.textColor, fontSize: 16),
      obscureText: isVisible,
      controller: widget.textEditingController,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: AppColors.dashLineColor, fontSize: 16),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.dashLineColor)),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            child: isVisible
                ? Icon(
                    Icons.visibility,
                    size: 14,
                    color: AppColors.dashLineColor,
                  )
                : Icon(
                    Icons.visibility_off,
                    size: 14,
                    color: AppColors.dashLineColor,
                  ),
          )),
    );
  }
}
