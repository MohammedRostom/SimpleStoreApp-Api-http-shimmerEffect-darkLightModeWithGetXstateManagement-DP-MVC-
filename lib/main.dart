import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:simpleapp/bin.dart';
import 'package:simpleapp/services/constains.dart';
import 'package:simpleapp/services/get_all_product_service.dart';
import 'package:simpleapp/views/homePage.dart';

void main() {
  Stripe.publishableKey = ApiKeys.PublischedKey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Bind(),
      home: const HomePage(),
    );
  }
}
