import 'package:flutter/material.dart';
import 'package:movies_app/features/profile/data/model/profile_model.dart';
import 'package:movies_app/features/profile/presentation/widgets/update_profile_widget.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});
  static const routeName = '/update-profile';

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  ProfileModel? profileModel;

  @override
  Widget build(BuildContext context) {
    profileModel = ModalRoute.of(context)?.settings.arguments as ProfileModel;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Pick Avatar',
        ),
      ),
      body: UpdateProfileWidget(
        profileModel: profileModel!,
      ),
    );
  }
}
