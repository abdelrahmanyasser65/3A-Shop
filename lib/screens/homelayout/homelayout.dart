import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sh/components/components.dart';
import 'package:sh/screens/homelayout/cubit/shop_cubit.dart';
import 'package:sh/screens/homelayout/cubit/shop_state.dart';
import 'package:sh/screens/homelayout/search_screen.dart';
import 'package:sh/themes/colors.dart';

class HomeLayout extends StatelessWidget {
final  List<IconData> iconList=[
  Icons.apps,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person_outline_outlined,
  ];
final List title=[
  'Categories',
  'Favorites',
  'Cart',
  'Profile',
  '3A Shop',
];


  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return  BlocConsumer<ShopCubit,ShopState>(
      listener: (context,state){},
      builder:(context,state){
        var cubit=BlocProvider.of<ShopCubit>(context);
        return  Scaffold(
          extendBody: true,
          body: cubit.screens[cubit.currentIndex],
          appBar: AppBar(
            backgroundColor: HexColor('#373A36'),
            actions: [
              IconButton(
                  onPressed: (){
                    navigateTo(context, SearchScreen());
                  }
                  , icon:const Icon(Icons.search_outlined,color:Colors.white,size: 30,))
            ],
            centerTitle: true,
            title: Text(title[cubit.currentIndex],style:
          const  TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,color:Colors.white),),
          ),
          floatingActionButton: FloatingActionButton(

            onPressed: (){
              cubit.changeAction();

            },
            backgroundColor:HexColor(caColor),

            child:const Icon(Icons.home),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: iconList,
            backgroundColor: HexColor('#373A36'),
            activeIndex: cubit.currentIndex,
            gapLocation: GapLocation.center,
            splashColor: HexColor(caColor),
            activeColor: HexColor(caColor),
            inactiveColor: Colors.white,
            notchSmoothness: NotchSmoothness.smoothEdge,
            onTap: (index) {
              cubit.changeBottom(index);

            },
            //other params
          ),
        );
      } ,
    );
  }
}
