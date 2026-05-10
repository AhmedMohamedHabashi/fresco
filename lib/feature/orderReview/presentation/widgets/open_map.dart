import 'package:url_launcher/url_launcher.dart';

Future<void> openMap() async {
  final Uri url = Uri.parse(
    "https://www.google.com/maps/search/?api=1&query=30.0444,31.2357",
  );

  await launchUrl(url, mode: LaunchMode.externalApplication);
}
