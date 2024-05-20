import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/colors_contants.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/constants/textstyle_constants.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final bool isLoading; // Thêm tham số cho trạng thái loading

  const ButtonWidget({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading = false, // Mặc định không ở trạng thái loading
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          isLoading ? null : onTap, // Không cho phép nhấn nút khi đang loading
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kMediumPadding),
          gradient: Gradients.defaultGradientBackgound,
        ),
        child: isLoading
            ? const SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ) // Hiển thị indicator khi đang loading
            : Text(
                title,
                style: TextStyles.defaultStyle.bold.whiteTextColor,
              ),
      ),
    );
  }
}
