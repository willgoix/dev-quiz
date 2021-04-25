import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/models/awnser_model.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final AwnserModel awnser;
  final bool selected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AwnserWidget({
    Key? key,
    required this.awnser,
    this.selected = false,
    this.disabled = false,
    required this.onTap,
  }) : super(key: key);

  Color get _selectedColorRight =>
      awnser.right ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRight =>
      awnser.right ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRight =>
      awnser.right ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRight =>
      awnser.right ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleRight =>
      awnser.right ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRight => awnser.right ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () => onTap(awnser.right),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: selected ? _selectedColorCardRight : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(
                color: selected ? _selectedBorderCardRight : AppColors.border,
              )),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    awnser.title,
                    style:
                        selected ? _selectedTextStyleRight : AppTextStyles.body,
                  ),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: selected ? _selectedColorRight : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(BorderSide(
                        color: selected
                            ? _selectedBorderRight
                            : AppColors.border)),
                  ),
                  child: selected
                      ? Icon(
                          _selectedIconRight,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
