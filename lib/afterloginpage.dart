import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon/login_controller.dart';

Column buildafterlogin(controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
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
