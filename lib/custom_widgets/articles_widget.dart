import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:sleep_app/configs/configs.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: size.height*0.25,
        width: size.width*0.9,
        decoration: BoxDecoration(
            color: AppColors.loginScaffoldColor,
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
