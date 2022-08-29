import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sh/components/components.dart';
import 'package:sh/screens/auth/loginscreen.dart';
import 'package:sh/themes/colors.dart';
import 'package:sh/themes/themes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../helper/cash_helper.dart';

class OnBoardingScreen extends StatefulWidget {
   const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List images=[
    'assets/onb1.png',
    'assets/onb2.png',
    'assets/onb3.png',
  ];

  final List title=[
    'Shop For Your Daily Needs\n In Your Ease',
    'Secure Payments',
    'Fast Doorstep Deliveries',
  ];
  bool isLast=false;

  final boardController=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     actions: [
       TextButton(onPressed: (){
         submit(context);

       }, child: Text("SKIP",
       style: TextStyle(
         color: HexColor(caColor)
       ),))
     ],
   ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index){
                if(index==2){
                  setState((){
                    isLast=true;
                  });
                }
                else{
                  setState((){
                    isLast=false;
                  });
                }
              },
       physics:const BouncingScrollPhysics(),
              controller: boardController,
              itemBuilder: (context,index){
               return buildColumn(index);
              },
              itemCount: 3,
            ),
          ),
        const  SizedBox(height:20,),
        SmoothPageIndicator(
            controller: boardController,
            count: 3,
            effect: ExpandingDotsEffect(
              dotColor: HexColor(f5Color),
              activeDotColor: HexColor(caColor),
              expansionFactor: 4,
              spacing: 5,
              dotWidth: 4,
              dotHeight: 5
            ),
        ),
         const SizedBox(height: 25,),
          EElevatedButton(
              caColor,
              45,
              25,
              Colors.white,
              170,
              'Next',
              (){
                if(isLast){
                  submit(context);
                }
             else{
                  boardController.nextPage(
                      duration:const Duration(
                          milliseconds: 750
                      ),
                      curve: Curves.fastLinearToSlowEaseIn);

                }
              }),
         const SizedBox(height:40,)

        ],
      ),
    );
  }

  void submit(BuildContext context) {
    CachHelper.saveData(
        key: "onBoarding",
        value: true
    ).then((value){
          if(value){
            navigateAndFinish(context, LoginScreen());
          }
    });


  }

  Column buildColumn(index) {
    return Column(
      children: [
       Image(
         image: AssetImage(
           images[index],
         ),
         height: 380,
       ),
        Text(title[index],
        style: onBTitleStyle(),textAlign: TextAlign.center,),
       const SizedBox(height: 28),
         Text('Set Your Delivery locations. Choose your\n clothes from a wide range of our required\n products.',
         style: onBSubTitleStyle(),textAlign: TextAlign.center,),

      ],
    );
  }
}
