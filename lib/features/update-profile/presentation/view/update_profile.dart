import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/update-profile/cubit/update_profile_cubit.dart';
import 'package:movies_app/features/update-profile/presentation/widgets/update_profile_widget.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});
  static const routeName = '/update-profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Pick Avatar',
        ),
      ),
      body: BlocProvider(
        create: (context) => UpdateProfileCubit(),
        child: const UpdateProfileWidget(),
      ),
    );
  }
}
