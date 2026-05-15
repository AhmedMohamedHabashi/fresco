import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/core/utils/text_style/app_text_style.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/order_change_sheet.dart';

class OrderInfoCard extends StatelessWidget {
  final String sectionTitle;
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isPayment;

  const OrderInfoCard({
    super.key,
    required this.sectionTitle,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isPayment,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionTitle,
                style: AppTextStyle.bodyText18.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    builder: (context) {
                      return OrderChangeSheet(isPayment: isPayment);
                    },
                  );
                },
                child: const Text(
                  "Change",
                  style: TextStyle(color: AppColors.primaryColor),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.mediumGrey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Icon(icon, color: AppColors.primaryColor),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subtitle,
                      style: AppTextStyle.bodyText12.copyWith(
                        color: AppColors.mediumGrey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
