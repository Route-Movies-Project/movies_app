import 'package:flutter/widgets.dart';
import 'package:movies_app/features/profile/presentation/widgets/profile_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return const ProfileWidget();
  }
}
