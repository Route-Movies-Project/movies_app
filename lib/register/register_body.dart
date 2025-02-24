import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/Themes/theme.dart';
import 'package:movies_app/register/register_slider.dart';
import 'package:movies_app/widgets/default_elevated_button.dart';
import 'package:movies_app/widgets/default_text_form_field.dart';

class RegisterBody extends StatefulWidget {
  
  

  static const String routeName = '/register';

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {},
        ),
         title: Text('Register', style: TextStyle(color: ThemeColors.yellow)),
        centerTitle: true,
      ),
       body: SafeArea(
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 8),
             child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                RegisterSlider(),
                Text('Avatar'),
               SizedBox(height: 15,),
                 Container(
                  height: MediaQuery.sizeOf(context).height*0.08,
                  decoration:BoxDecoration(color: ThemeColors.grey, borderRadius: BorderRadius.circular(15)) ,
                   child: DefaultTextFormField(
                   controller: nameController,
                    hintText: 'Name'
                   , prefixIconImageName: 'name',
                    Validator: (value){},
                    isPassword: false,),
                 ),
                    SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                
                 Container(
                  height: MediaQuery.sizeOf(context).height*0.08,
                  decoration:BoxDecoration(color: ThemeColors.grey, borderRadius: BorderRadius.circular(15)) ,
                   child: DefaultTextFormField(
                   controller: emailController,
                    hintText: 'Email'
                   , prefixIconImageName: 'email',
                    Validator: (value){},
                    isPassword: false,
                    ),
                 ),

                   SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                
                 Container(
                  height: MediaQuery.sizeOf(context).height*0.08,
                  decoration:BoxDecoration(color: ThemeColors.grey, borderRadius: BorderRadius.circular(15)) ,
                   child: DefaultTextFormField(
                   controller: passwordController,
                    hintText: 'password'
                   , prefixIconImageName: 'lock',
                    Validator: (value){},
                    isPassword: true,),
                 ),
                SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                
                   Container(
                    height: MediaQuery.sizeOf(context).height*0.08,
                  decoration:BoxDecoration(color: ThemeColors.grey, borderRadius: BorderRadius.circular(15)) ,
                     child: DefaultTextFormField(
                  controller: confirmPasswordController,
                    hintText: 'confirm password'
                  , prefixIconImageName: 'lock',
                  Validator: (value){},
                  isPassword: true,),
                   ),
                    
                
                SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                
                   Container(
                    height: MediaQuery.sizeOf(context).height*0.08,
                  decoration:BoxDecoration(color: ThemeColors.grey, borderRadius: BorderRadius.circular(15)) ,
                     child: DefaultTextFormField(
                   controller: confirmPasswordController,
                   hintText: 'confirm password',
                   prefixIconImageName: 'phone',
                   Validator: (value){},
                   isPassword: false,),
                   ),
                   
                    SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),

                    DefaultElevatedButton(
                      label: 'Create Account',
                       onPressed: CreateAccount),

                    
                    SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),

                   const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already Have Account ?', style: TextStyle(color: ThemeColors.white,
                        fontSize: 14, fontWeight: FontWeight.w400),),
                        SizedBox(width: 5,),


                          Text('Login',style: TextStyle(color: ThemeColors.yellow,
                        fontSize: 14, fontWeight: FontWeight.w900),)
                      ],
                    ),
                    SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),

                    SvgPicture.asset('assets/icons/Language Switch (1).svg'),
                     SizedBox(height: MediaQuery.sizeOf(context).height*0.02,),
                
                  
                    
               ] 
                     ),
           ),
             
           )
         );
     
    
     
    
    
  }
   void CreateAccount() {}
}