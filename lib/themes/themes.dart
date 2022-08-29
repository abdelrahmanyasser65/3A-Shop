import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme=ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: HexColor('333739'),
  floatingActionButtonTheme:const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: HexColor('333739'),
  ),
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.dark,

    ),
    backgroundColor: HexColor('333739'),
    elevation: 0,
    titleTextStyle:const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold
    ),

  ),
  textTheme:const TextTheme(
    bodyText1:TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  )

);

ThemeData lightTheme=ThemeData(
    primarySwatch: Colors.deepOrange,
    scaffoldBackgroundColor:Colors.white,
    floatingActionButtonTheme:const FloatingActionButtonThemeData(
      backgroundColor: Colors.deepOrange,
    ),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 20.0,
      backgroundColor: Colors.white,
    ),
    appBarTheme:const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      titleSpacing: 20,
     // backwardsCompatibility: false,
      // systemOverlayStyle: SystemUiOverlayStyle(
      //   statusBarColor:Colors.white,
      //   statusBarIconBrightness: Brightness.dark,
      //
      // ),
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),

    ),
    textTheme:const TextTheme(
      bodyText1:TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    )

);

TextStyle onBTitleStyle(){
  return TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: HexColor('#003C5A'),
  );
}
TextStyle onBSubTitleStyle(){
  return TextStyle(
    fontSize: 14,height: 1.3,
    fontWeight: FontWeight.w500,
    color: HexColor('#9B9B9B'),
  );
}