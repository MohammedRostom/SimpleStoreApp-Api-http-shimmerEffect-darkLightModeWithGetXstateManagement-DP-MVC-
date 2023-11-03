import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stripe_payment/constains.dart';
import 'package:flutter_stripe_payment/stripe_payment/payment_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

bool isloding = false;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await PaymentManager.makePayment(ApiKeys.numper, "EGP");

              setState(() {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: Text(""),
                        ));
              });
            },
            child:
                Container(child: Center(child: Text("${ApiKeys.numper} \$ "))),
          )
        ],
      ),
    );
  }
}
