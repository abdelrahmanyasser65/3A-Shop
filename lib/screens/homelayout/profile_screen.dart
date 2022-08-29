import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sh/components/components.dart';
import 'package:sh/screens/homelayout/cubit/shop_cubit.dart';
import 'package:sh/screens/homelayout/cubit/shop_state.dart';
import 'package:sh/screens/homelayout/edit_screen.dart';
import 'package:sh/themes/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
        listener: (context,state){},
      builder: (context,state){
          var cubit=BlocProvider.of<ShopCubit>(context);
          var model=cubit.getUserDataModel!.data;
          return
          Scaffold(
            body:
            cubit.getUserDataModel!=null&&cubit.homeModel!=null&&cubit.categoriesModel!=null
                &&cubit.getFavoritesModel!=null
                ?

            SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 600,
                      padding: const EdgeInsets.only(right: 40),
                      child: SizedBox(
                        height: 700,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Image(
                                  image: NetworkImage(
                                      'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-1/270120856_336166048356274_4021224055519644078_n.jpg?stp=c10.3.940.940a_dst-jpg_s240x240&_nc_cat=111&ccb=1-7&_nc_sid=7206a8&_nc_ohc=mPYQ8v6QFHgAX-icb9Q&_nc_ht=scontent-hbe1-1.xx&oh=00_AT-MzE4qE-z7MLanNwBHCeLLsbfBEjOSH7JC0OamdKV7ag&oe=630EB993'
                                  ),
                                  height: 280,
                                  width: 260,
                                  fit: BoxFit.cover,
                                ),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      height: 170,
                                      margin:const EdgeInsets.only(
                                        left: 30
                                      ),
                                      width: 110,
                                      color:HexColor(caColor),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 20, top: 47),
                                      child: Text(
                                        model!.name!,
                                        style:const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin:const EdgeInsets.only(
                                      top: 25,
                                      left: 10
                                  ),
                                  height: 45,
                                  width: 254,
                                  padding:const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Center(
                                    child:RichText(
                                      text: TextSpan(
                                          children:[
                                            TextSpan(
                                                text: 'Email : ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: HexColor(caColor)
                                                )
                                            ),
                                            TextSpan(
                                                text: model.email,
                                                style:const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black
                                                )
                                            ),
                                          ]
                                      ),

                                    ),
                                  ),
                                ),
                                Container(
                                  margin:const EdgeInsets.only(
                                      top: 25,
                                      left: 10
                                  ),
                                  height: 45,
                                  width: 254,
                                  padding:const EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Center(
                                    child:RichText(
                                      text: TextSpan(
                                          children:[
                                            TextSpan(
                                                text: 'Phone : ',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: HexColor(caColor)
                                                )
                                            ),
                                            TextSpan(
                                                text: model.phone,
                                                style:const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                    color: Colors.black
                                                )
                                            ),
                                          ]
                                      ),

                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 28,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 95,
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Text(
                                    "EDIT",
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        color: HexColor(caColor),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                InkWell(
                                    onTap: () {
                                      navigateTo(context, EditScreen());
                                    },
                                    child:  Icon(
                                      Icons.keyboard_arrow_down_sharp,
                                      color: HexColor(caColor),
                                      size: 28,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                )):const Center(
              child: CircularProgressIndicator(),
            ),
          )
          ;
      },
    );
  }
}
