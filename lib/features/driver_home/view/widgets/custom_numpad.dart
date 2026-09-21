import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:trip_app/core/utils/app_colors.dart';
import 'package:trip_app/core/utils/app_dimens.dart';
import 'package:trip_app/core/utils/app_text_styles.dart';

class CustomNumpad extends StatelessWidget {
  final Function(String) onDigitPressed;
  final VoidCallback onDeletePressed;

  const CustomNumpad({
    super.key,
    required this.onDigitPressed,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> keys = [
      {'num': '1', 'sub': ''},
      {'num': '2', 'sub': 'A B C'},
      {'num': '3', 'sub': 'D E F'},
      {'num': '4', 'sub': 'G H I'},
      {'num': '5', 'sub': 'J K L'},
      {'num': '6', 'sub': 'M N O'},
      {'num': '7', 'sub': 'P Q R S'},
      {'num': '8', 'sub': 'T U V'},
      {'num': '9', 'sub': 'W X Y Z'},
    ];

    return Container(
      color: const Color(0xffD1D5DB),
      padding: EdgeInsets.all(AppDimens.r8),
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.2,
              crossAxisSpacing: AppDimens.w6,
              mainAxisSpacing: AppDimens.h6,
            ),
            itemBuilder: (context, index) {
              return _buildKeyButton(
                num: keys[index]['num']!,
                sub: keys[index]['sub']!,
                onTap: () => onDigitPressed(keys[index]['num']!),
              );
            },
          ),
          hSpace(AppDimens.h6),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                child: _buildKeyButton(
                  num: '0',
                  sub: '',
                  onTap: () => onDigitPressed('0'),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: onDeletePressed,
                  child: Container(
                    height: 48.h,
                    margin: EdgeInsets.symmetric(horizontal: AppDimens.w4),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(AppDimens.r8),
                    ),
                    child: const Icon(
                      Icons.backspace_outlined,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildKeyButton({
    required String num,
    required String sub,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDimens.r8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(num, style: AppStyles.bold24.copyWith(height: 1)),
            if (sub.isNotEmpty)
              Text(
                sub,
                style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMuted,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
