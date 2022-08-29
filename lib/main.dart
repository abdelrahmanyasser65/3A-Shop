import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sh/bolcobserver.dart';
import 'package:sh/helper/dio_helper.dart';
import 'package:sh/screens/auth/bloc/bloc.dart';
import 'package:sh/screens/auth/on_boarding_screen.dart';
import 'package:sh/screens/homelayout/cubit/shop_cubit.dart';
import 'package:sh/screens/homelayout/homelayout.dart';
import 'package:sh/screens/auth/loginscreen.dart';
import 'package:sh/themes/themes.dart';

import 'components/const.dart';
import 'helper/cash_helper.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CachHelper.init();
  bool onBoarding=CachHelper.getData(key: 'onBoarding');
   token=CachHelper.getData(key: 'token');
  Widget widget;
  if(onBoarding!=null){
    if(token!=null){
      widget= HomeLayout();
    }else{
      widget=LoginScreen();
    }
  }
  else{
    widget=const OnBoardingScreen();
  }
  Bloc.observer=MyBlocObserver();
  runApp( MyApp(
   startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
final Widget startWidget;
const MyApp({Key? key,
 required this.startWidget,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context)=>ShopCubit()..getHomeData()..getCategories()
            ..getFavorites()..getUserData(),
        ),
        BlocProvider(create:
            (BuildContext context) => ShopLoginCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home:LoginScreen(),
        //SplashScreen(startWidget: startWidget,),
      ),
    );
  }
}
