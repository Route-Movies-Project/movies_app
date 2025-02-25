import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/auth/presentation/views/forget_pass_screen.dart';
import 'package:movies_app/auth/presentation/views/register.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/auth/presentation/widgets/register_body.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscured = true;

  final _text = TextEditingController();

  final _password = TextEditingController();

  String? _passerror;

  String? _errorText;

  bool _validatepass() {
    final password = _password.text;
    if (password.isEmpty) {
      setState(() {
        _passerror = "please enter your password";
      });
      return false;
    } else if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      setState(() {
        _passerror = "Password should contain special chracter";
      });
      return false;
    } else if (!password.contains(RegExp(r'[A-Z]'))) {
      setState(() {
        _passerror = "password should contain uppercase character";
      });
      return false;
    } else if (!password.contains(RegExp(r'[a-z]'))) {
      setState(() {
        _passerror = "password should contain lowercase character";
      });
      return false;
    } else if (!password.contains(RegExp(r'[\d]'))) {
      setState(() {
        _passerror = "password should contain numbers";
      });
      return false;
    } else if (password.length < 8) {
      setState(() {
        _passerror = "password should be 8 chracters or more";
      });
      return false;
    } else {
      _passerror = null;
      return true;
    }
  }

  bool _validateemail() {
    final email = _text.text;
    if (email.isEmpty) {
      setState(() {
        _errorText = "please enter your email";
      });
      return false;
    } else if (!email.endsWith("gmail.com")) {
      setState(() {
        _errorText = "please enter valid email address";
      });
      return false;
    } else {
      setState(() {
        _errorText = null;
      });
      return true;
    }
  }

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  AppAssets.appLogo,
                )),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _text,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide.none),
                            labelText: "Email",
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 8),
                              child: SvgPicture.asset(AppAssets.emailIcon),
                            ),
                            filled: true,
                            fillColor: ThemeColors.grey,
                            labelStyle: const TextStyle(
                                color: ThemeColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            errorText: _errorText),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: _password,
                        obscureText: _isObscured,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: ThemeColors.grey,
                          labelText: "Password",
                          prefixIcon: Padding(
                            padding:
                                const EdgeInsets.only(right: 8.0, left: 16),
                            child: SvgPicture.asset(AppAssets.passIcon),
                          ),
                          labelStyle: const TextStyle(
                              color: ThemeColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscured = !_isObscured;
                              });
                            },
                            icon: _isObscured
                                ? const Icon(Icons.visibility_off,
                                    color: ThemeColors.white)
                                : const Icon(
                                    Icons.visibility,
                                    color: ThemeColors.white,
                                  ),
                          ),
                          errorText: _passerror,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(ForgetPassScreen.routeName),
                          child: const Text(
                            "Forget Password ?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: ThemeColors.yellow),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_validateemail() && _validatepass()) {
                              print("pass");
                            } else {
                              _validateemail();
                              _validatepass();
                            }
                          },
                          child: const Text("Login")),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t Have Account ? ",
                            style: GoogleFonts.roboto(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Register.routeName);
                            },
                            child: Text(
                              "Create One",
                              style: GoogleFonts.roboto(
                                  color: ThemeColors.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.amber,
                              thickness: 1,
                              indent: 40,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "OR",
                              style: TextStyle(
                                color: Colors.amber,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.amber,
                              thickness: 1,
                              endIndent: 40,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/icon _google_.svg"),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("Login With Google"),
                            ],
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                      SvgPicture.asset("assets/icons/Language Switch (1).svg"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
