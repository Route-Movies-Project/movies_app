import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/Themes/colors.dart';

class RegisterSlider extends StatefulWidget {
  @override
  State<RegisterSlider> createState() => _RegisterSliderState();
}

class _RegisterSliderState extends State<RegisterSlider> {
 int selectedAvatarIndex = 1; // Default selected avatar index

  final List<String> avatars = [
    'assets/images/profile_avatar_1.png', 
    'assets/images/profile_avatar_2.png',
    'assets/images/profile_avatar_3.png',
    'assets/images/profile_avatar_5.png',
    'assets/images/profile_avatar_6.png',
    'assets/images/profile_avatar_7.png',
    'assets/images/profile_avatar_8.png',
    'assets/images/profile_avatar_9.png',
  ];
 

  @override
  Widget build(BuildContext context) {
    return 
    
    SingleChildScrollView(
      physics: BouncingScrollPhysics(),scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar Selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(avatars.length, (index) {
                   
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                           selectedAvatarIndex = index;
                        });
                      },
              child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: CircleAvatar(
                          radius: selectedAvatarIndex == index ? 50 : 35,
                          backgroundColor: Colors.blueGrey,
                          child: CircleAvatar(
                            radius: selectedAvatarIndex == index ? 48 : 38,
                            backgroundImage: AssetImage(avatars[index]),
                          ),
                        ),
              ),
                      
                    );
                  }),
                  
              
        ),
        
              ]
        ),
      ),
    );
    
            
  }
}         

  
