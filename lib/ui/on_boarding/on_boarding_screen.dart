import 'package:flutter/material.dart';
import 'package:focus_node/ui/focus_node/focus_node.dart';
import 'package:focus_node/ui/on_boarding/page/page_one/page_one.dart';
import 'package:focus_node/ui/on_boarding/page/page_three/page_three.dart';
import 'package:focus_node/ui/on_boarding/page/page_two/page_two.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPageIndex = 0;
  String buttonText = "Next";
  PageController controller = PageController(initialPage: 0);
  List<Widget> screens = [
    PageOne(),
    PageTwo(),
    PageThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext c) => const FocusNodeScreen(),
                      ),
                    );
                  });
                },
                child: Text(
                  "Skip",
                ),
              ),
            ],
          ),
          Expanded(
              child: PageView(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (pageIndex) {
              print(pageIndex);
            },
            controller: controller,
            children: screens,
          )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: currentPageIndex == 0 ? Colors.orange : Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: currentPageIndex == 0 ? 30 : 10,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: currentPageIndex == 1 ? Colors.orange : Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: currentPageIndex == 1 ? 30 : 10,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: currentPageIndex == 2 ? Colors.orange : Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: currentPageIndex == 2 ? 30 : 10,
              )
            ],
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  if (currentPageIndex < 2) {
                    currentPageIndex++;
                    controller.jumpToPage(currentPageIndex);
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext c) {
                      return FocusNodeScreen();
                    }));
                  }
                  if (currentPageIndex == 2) {
                    buttonText = "Let's start";
                  }
                });
              },
              child: Container(
                height: 55,
                child: Center(
                  child: Text(buttonText),
                ),
              ))
        ],
      ),
    );
  }
}
