import 'package:e_commerce_app_c11/core/resources/utils/shared_preferences_utils.dart';
import 'package:e_commerce_app_c11/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: IconButton(
            onPressed: () {
              SharedPreferencesUtils.removeData('token');
              Navigator.of(context).pushNamedAndRemoveUntil(
                  Routes.signInRoute, (route) => false);
            },
            icon: const Icon(Icons.logout)),
      ),
    );
  }
}
