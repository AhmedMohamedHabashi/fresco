import 'package:flutter/material.dart';
import 'package:fresco/core/utils/colors/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openMap(BuildContext context) async {
  try {
    final Uri url = Uri.parse("https://www.google.com/maps");

    await launchUrl(url, mode: LaunchMode.externalApplication);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Couldn't open map. Try again"),
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }
}
