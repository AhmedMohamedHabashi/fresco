import 'package:flutter/material.dart';
import 'package:fresco/feature/payment/presentation/widgets/payment_screen_body.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const PaymentScreenBody(),
    );
  }
}
