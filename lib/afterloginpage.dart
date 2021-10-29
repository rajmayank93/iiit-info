import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/login_controller.dart';

final controller = Get.put(LoginController());

Column buildafterlogin() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      CircleAvatar(
        backgroundImage:
            Image.network(controller.googleAccount.value?.photoUrl ?? '').image,
        radius: 100,
      ),
      Text(controller.googleAccount.value?.displayName ?? '',
          style: TextStyle(color: Colors.white)),
      Text(controller.googleAccount.value?.email ?? '',
          style: TextStyle(color: Colors.white)),
      SizedBox(
        height: 16,
      ),
    ],
  );
}
