import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:fresco/feature/orderReview/presentation/widgets/open_map.dart';
import 'package:go_router/go_router.dart';

class OrderChangeSheet extends StatelessWidget {
  const OrderChangeSheet({super.key, required this.isPayment});

  final bool isPayment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isPayment ? "Change Payment" : "Change Address",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),

          if (isPayment)
            ListTile(
              leading: const Icon(
                Icons.payment_outlined,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                "Change Payment",
                style: TextStyle(color: AppColors.primaryColor),
              ),
              onTap: () {
                context.pop();

                // اعمل هنا التنقل لصفحة الدفع
              },
            ),

          if (!isPayment)
            ListTile(
              leading: const Icon(
                Icons.location_on,
                color: AppColors.primaryColor,
              ),
              title: const Text(
                "Change Address",
                style: TextStyle(color: AppColors.primaryColor),
              ),
              onTap: () async {
                await openMap(context);
                context.pop();
              },
            ),
        ],
      ),
    );
  }
}
