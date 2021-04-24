import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;

  const NextButtonWidget({
    Key? key,
    required this.label,
    required this.onTap,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
  }) : super(key: key);

  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.label = label,
        this.onTap = onTap,
        this.backgroundColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.label = label,
        this.onTap = onTap,
        this.backgroundColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              backgroundColor,
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            side: MaterialStateProperty.all(BorderSide(
              color: borderColor,
            ))),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: fontColor,
          ),
        ),
      ),
    );
  }
}