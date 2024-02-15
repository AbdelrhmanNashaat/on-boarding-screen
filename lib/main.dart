import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

int pageNumber = 0;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff221F1E),
        body: PageView(
          onPageChanged: (value) {
            setState(() {
              pageNumber = value;
            });
          },
          controller: _pageController,
          children: [
            MyView(
              image: 'assets/image/Saly-2.png',
              text1: 'Achieve Higher Goals',
              text2:
                  'By boosting your productivity we help\n you achieve higher goals',
              textButton: 'Get Started',
              onTap: () {
                _pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              heigh: 56,
              width: 165,
            ),
            MyView(
              image: 'assets/image/Saly-1.png',
              text1: 'Boost Productivity',
              text2:
                  'Foc.io helps you boost your productivity\n on a differnet level',
              textButton: 'Next',
              onTap: () {
                _pageController.animateToPage(2,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              heigh: 54,
              width: 114,
            ),
            MyView(
              image: 'assets/image/Saly-13.png',
              text1: 'Work Seamlessly',
              text2: 'Get your work done seamlessly\n without interruption',
              textButton: 'Next',
              onTap: () {
                _pageController.animateToPage(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              },
              heigh: 54,
              width: 114,
            ),
          ],
        ),
      ),
    );
  }
}

class MyView extends StatelessWidget {
  const MyView({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.textButton,
    required this.onTap,
    required this.width,
    required this.heigh,
  });
  final String image;
  final String text1;
  final String text2;
  final String textButton;
  final Function onTap;
  final double width;
  final double heigh;
  Widget dotPage() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              width: i == pageNumber ? 25 : 6,
              height: 6,
              margin: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: pageNumber == i ? Colors.white : Colors.grey,
              ),
            ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context, {re}) {
    return Column(
      children: [
        const SizedBox(height: 60),
        Image.asset(image),
        const SizedBox(height: 50),
        Text(
          text1,
          style: const TextStyle(
              fontSize: 30, color: Colors.white, fontFamily: 'Gilroy'),
        ),
        const SizedBox(height: 10),
        Text(
          textAlign: TextAlign.center,
          text2,
          style: const TextStyle(
              fontSize: 14, color: Colors.white, fontFamily: 'Gilroy Pro'),
        ),
        const SizedBox(height: 50),
        InkWell(
          onTap: onTap as void Function()?,
          child: Container(
            width: width,
            height: heigh,
            decoration: BoxDecoration(
              color: const Color(0xffEF895F),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                textButton,
                style: const TextStyle(
                    fontSize: 18, color: Colors.white, fontFamily: 'Gilroy'),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50.0),
        dotPage(),
      ],
    );
  }
}
