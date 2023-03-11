part of 'widgets.dart';

class AccountFormField extends StatelessWidget {
  final TextEditingController controller ;
  final String hintText;
  final Color textColor;
  final Color hintTextColor;

  const AccountFormField({
    Key? key,
    required this.hintText,
    required this.textColor,
    required this.hintTextColor, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: textColor, fontSize: 16),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: AppColors.dashLineColor, fontSize: 16),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.dashLineColor)),
      ),
    );
  }
}
