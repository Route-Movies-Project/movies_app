import 'package:flutter/material.dart';
import 'package:movies_app/features/update-profile/presentation/widgets/update_profile_widget.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});
  static const routeName = '/update-profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pick Avatar',
        ),
      ),
      body: const UpdateProfileWidget(),
    );
  }
}
