import 'package:flutter/material.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = 'home_tab';
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> images = [
    "assets/images/5f51f696241415.5eb2d19f8b3e1 1 (1).png",
    "assets/images/1917_-_Sam_Mendes_-_Hollywood_War_Film_Classic_English_Movie_Poster_9ef86295-4756-4c71-bb4e-20745c5fbc1a 5.png",
    "assets/images/5f51f696241415.5eb2d19f8b3e1 1.png"
  ];

  @override
  Widget build(BuildContext context) {
    int currentphoto = 0;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned.fill(
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              ThemeColors.black.withAlpha(128),
                              BlendMode.darken),
                          child: Image.asset(
                            images[currentphoto],
                            fit: BoxFit.cover,
                          ))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset("assets/images/Available Now.png"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: CarouselSlider.builder(
                            options: CarouselOptions(
                                scrollDirection: Axis.horizontal,
                                enlargeCenterPage: true,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.height,
                                height:
                                    MediaQuery.of(context).size.height * 0.4),
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index, _) {
                              return Stack(children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Image.asset(
                                    images[index],
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                    top: 10,
                                    left: 20,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: Colors.yellow, size: 16),
                                          SizedBox(width: 4),
                                          Text("7.4",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ))
                              ]);
                            }),
                      ),
                    ],
                  ),
                ],
              ),
              Image.asset("assets/images/Watch Now.png"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Action",
                    style: TextStyle(
                      color: ThemeColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      const Text(
                        "See More",
                        style: TextStyle(
                          color: ThemeColors.yellow,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward),
                        color: ThemeColors.yellow,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Stack(
                        children: [
                          Image.asset(images[index]),
                          Positioned(
                              top: 10,
                              left: 5,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 16),
                                    SizedBox(width: 4),
                                    Text("7.4",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
