import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';

class CheckoutSection extends StatelessWidget {
  const CheckoutSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Row(
        children: [
          // Total Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Total price",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor.withOpacity(0.6),
                ),
              ),
              SizedBox(height: 4),
              Text(
                "EGP 3,500",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
          SizedBox(width: 30),
          // Check Out Button
          Expanded(
            child: Container(
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Check Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
