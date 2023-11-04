import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpleapp/controller/controller.dart';
import 'package:simpleapp/model/UserModel.dart';
import 'package:simpleapp/views/wideget/customwidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
            onPressed: () {
              Get.isDarkMode
                  ? Get.changeTheme(ThemeData.light())
                  : Get.changeTheme(ThemeData.dark());
            },
            child: Text("child")),
      ),
      body: SafeArea(
        child: GetBuilder<productcontreoller>(
          init: productcontreoller(),
          builder: (controller) {
            return FutureBuilder<List<UserModel>>(
              future: controller.getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Error loading data'));
                } else if (snapshot.hasData) {
                  List<UserModel> users = snapshot.data!;

                  return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (_, index) => CustomWidgetItem(
                      model: users[index],
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemBuilder: (_, index) => CustomWidget(),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
