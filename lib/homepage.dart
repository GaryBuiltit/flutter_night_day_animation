import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static bool isFullSun = false;

  final Duration duration = const Duration(seconds: 1);

  List<Color> lightBgColors = [
    const Color(0xFF8C2480),
    const Color(0xFFCE587D),
    const Color(0xFFFF9485),
    if (isFullSun) const Color(0xFFFF9D80),
  ];
  var darkBgColors = [
    const Color(0xFF0D1441),
    const Color(0xFF283584),
    const Color(0xFF376AB2),
  ];

  @override
  void initState() {
    super.initState();
    isFullSun = true;
  }

  void changebackground() {
    setState(() {
      // if (isFullSun) {
      //   isFullSun = false;
      // } else {
      //   isFullSun = true;
      // }
      isFullSun = !isFullSun;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GestureDetector(
              onTap: () => changebackground(),
              child: AnimatedContainer(
                duration: duration,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: isFullSun ? lightBgColors : darkBgColors),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: duration,
              left: screenWidth - 220,
              top: !isFullSun ? screenHeight : screenHeight - screenHeight,
              child: Image.asset('assets/images/sun.png'),
            ),
            AnimatedPositioned(
              duration: duration,
              left: screenWidth - 230,
              top: isFullSun ? screenHeight : screenHeight - screenHeight,
              child: SizedBox(
                  height: 225,
                  width: 225,
                  child: Image.asset('assets/images/moon.png')),
            ),
            Positioned(
                height: screenHeight * .50,
                width: screenWidth + 100,
                top: screenHeight - 275,
                right: -25,
                child: Image.asset('assets/images/mountains.png'))
          ],
        ),
      ),
    );
  }
}
