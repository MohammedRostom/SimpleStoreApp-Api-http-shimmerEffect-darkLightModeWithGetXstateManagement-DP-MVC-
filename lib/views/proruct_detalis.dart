import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/instance_manager.dart';
import 'package:simpleapp/controller/controller.dart';
import 'package:simpleapp/model/UserModel.dart';
import 'package:simpleapp/services/stripe_payment/payment_manager.dart';
import 'package:simpleapp/views/wideget/customwidget.dart';

class proudctInfo extends GetView<productcontreoller> {
  proudctInfo({super.key, required this.modells});
  UserModel modells;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.grey[300],
                  ),
                  CircleAvatar(
                    radius: 120,
                    backgroundImage: NetworkImage("${modells.image}"),
                  ),
                ],
              ),
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text("${modells.description}"),
            ),
            SizedBox(
              height: 12,
            ),
            pricewideget(model: modells),
            Spacer(),
            Container(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      double priced = modells.price as double;
                      print(modells.price.runtimeType);
                      await PaymentManager.makePayment(priced, "EGP");
                      Get.snackbar("Payment Done ",
                          "Thinkes for use this servises with other enjoy");
                    },
                    child: Text("Cheackout")))
          ],
        ),
      )),
    );
  }
}
