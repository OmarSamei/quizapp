import 'package:flutter/material.dart';
import 'package:quizz_app/colors.dart';
import 'package:quizz_app/widgets/custom_text.dart';


// ignore: must_be_immutable
class CenterText extends StatelessWidget {
  CenterText({
    super.key,
    required this.textHint,
    required this.textButton,
    required this.onTap,
  });
  String textHint, textButton;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        text(
          title: textHint,
          fontSize: 16,
          color: Colors.black,
        ),
        GestureDetector(
          onTap: onTap,
          child: text(
            title: textButton,
            color: ColorManager.primaryColor,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
