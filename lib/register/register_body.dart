import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/Themes/theme.dart';
import 'package:movies_app/register/register_slider.dart';
import 'package:movies_app/widgets/default_elevated_button.dart';
import 'package:movies_app/widgets/default_text_field.dart';

class RegisterBody extends StatefulWidget {

  const RegisterBody({super.key});

  static const String routeName = '/register';

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: const Text(
            'Register',
          ),

         
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              RegisterSlider(),
              Text('Avatar'),
              SizedBox(

                height: 15.h,

              ),
              Container(
                child: DeafultTextFormField(
                  textEditingController: nameController,
                  hintText: 'Name',
                  prefixImageName: 'name',
                  validator: (value) {},
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Container(
                child: DeafultTextFormField(
                  textEditingController: emailController,
                  hintText: 'Email',
                  prefixImageName: 'email',
                  validator: (value) {},
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Container(
                child: DeafultTextFormField(
                  textEditingController: passwordController,
                  hintText: 'password',
                  prefixImageName: 'lock',
                  validator: (value) {},
                  isPassword: true,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Container(
                child: DeafultTextFormField(
                  textEditingController: confirmPasswordController,
                  hintText: 'confirm password',
                  prefixImageName: 'lock',
                  validator: (value) {},
                  isPassword: true,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              Container(
                child: DeafultTextFormField(
                  textEditingController: confirmPasswordController,
                  hintText: 'confirm password',
                  prefixImageName: 'phone',
                  validator: (value) {},
                  isPassword: false,
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              DefaultElevatedButton(
                  label: 'Create Account', onPressed: CreateAccount),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Account ?',
                    style: TextStyle(
                        color: ThemeColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        color: ThemeColors.yellow,
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
              SvgPicture.asset('assets/icons/Language Switch (1).svg'),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.02,
              ),
            ]),
          ),
        ));
  }

  void CreateAccount() {}
}
