import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sh/models/categories_model.dart';
import 'package:sh/models/home_model.dart';
import 'package:sh/screens/homelayout/cubit/shop_cubit.dart';
import 'package:sh/screens/homelayout/cubit/shop_state.dart';
import 'package:sh/themes/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
     if(state is ShopSuccessChangeFavoritesState){
       if(!state.model.status!){
         Fluttertoast.showToast(
             msg: state.model.message!,
             toastLength: Toast.LENGTH_LONG,
             gravity: ToastGravity.BOTTOM,
             timeInSecForIosWeb: 5,
             backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 16.0);
       }
     }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<ShopCubit>(context);
        return Scaffold(
            body: cubit.homeModel != null && cubit.categoriesModel != null
            &&cubit.getFavoritesModel!=null&&cubit.getUserDataModel!=null
                ? productsBuilder(cubit.homeModel!, cubit.categoriesModel!,cubit)
                : const Center(
                    child: CircularProgressIndicator(),
                  ));
      },
    );
  }

  Widget productsBuilder(HomeModel model, CategoriesModel model2,ShopCubit cubit) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          startScreen(model),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          buildCategoryItem(model2, index),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                      itemCount: model2.categoriesData!.data.length),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "New Products",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 1 / 1.62,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: List.generate(
                    model.dataModel.products.length,
                    (index) =>
                        productsColumn(model.dataModel.products[index],cubit)),),
          )
        ],
      ),
    );
  }

  SizedBox buildCategoryItem(CategoriesModel model2, index) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(
            image: NetworkImage(model2.categoriesData!.data[index]['image']),
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            color: Colors.black.withOpacity(0.7),
            child: Text(
              model2.categoriesData!.data[index]['name'],
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Container productsColumn(model,ShopCubit cubit) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(

            children: [
              Image(
                image: NetworkImage(model['image']),
                height: 180,
              ),
              if (model['discount'] != 0)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  color: Colors.red,
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model['name'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Text("EGP",style: TextStyle(
                             fontSize: 12,
                             fontWeight: FontWeight.w400,
                             color: Colors.grey.shade600,
                           ),),
                         const  SizedBox(width: 3,),
                           Text(
                             '${model['price'].round()}',
                             maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                             style:const TextStyle(
                               fontSize: 15,
                               fontWeight: FontWeight.w800,
                               color: Colors.black,
                             ),
                           ),
                         ],
                       ),
                      const   SizedBox(height: 4,),
                       Row(
                         crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           if (model['discount'] != 0)
                             Text(
                               'EGP ${model['old_price']}',
                               maxLines: 2,
                               overflow: TextOverflow.ellipsis,
                               style: const TextStyle(
                                   fontSize: 12,
                                   fontWeight: FontWeight.w400,
                                   color: Colors.grey,
                                   decoration: TextDecoration.lineThrough),
                             ),
                           SizedBox(width: 3,),
                           if (model['discount'] != 0)
                           Text(
                             '${model['discount']}%OFF',
                             maxLines: 2,
                             overflow: TextOverflow.ellipsis,
                             style:  TextStyle(
                                 fontSize: 12,
                                 fontWeight: FontWeight.w500,
                                 color: HexColor(caColor),)

                           ),
                         ],
                       )
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          cubit.changeFavorites(model['id']);
                        },
                        child: CircleAvatar(
                          backgroundColor:
                         cubit.favorites[model['id']]?HexColor(caColor):
                          Colors.grey,

                          radius: 15,
                          child: const Icon(
                            Icons.favorite_border,
                            size: 14,
                            color: Colors.white,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget startScreen(HomeModel model) {
    return CarouselSlider(
      items: model.dataModel.banners
          .map((val) => Image(
                image: NetworkImage("${val['image']}"),
                width: double.infinity,
                fit: BoxFit.cover,
              ))
          .toList(),
      options: CarouselOptions(
        scrollPhysics: const BouncingScrollPhysics(),
        height: 200,
        initialPage: 0,
        enableInfiniteScroll: true,
        viewportFraction: 1,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
