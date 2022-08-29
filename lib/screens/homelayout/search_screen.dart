import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sh/screens/homelayout/cubit/shop_cubit.dart';
import 'package:sh/screens/homelayout/cubit/shop_state.dart';
import 'package:sh/themes/colors.dart';

import '../../components/components.dart';
import '../../models/search_model.dart';



class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  final searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit=BlocProvider.of<ShopCubit>(context);

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Search",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: HexColor(caColor),
              ),
            ),
            leading: Icon(
              Icons.arrow_back,
              color: HexColor(
                caColor,
              ),
              size: 28,
            ),
            elevation: 0,
          ),
          body:SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:const EdgeInsets.only(
                      top: 10,left: 20,right: 20,bottom: 10
                  ),
                  child: SizedBox(
                    height: 50,
                    child: buildTextFormField(
                      icon: Icons.search,
                      hint: 'Search',
                      onChange: (val) {
                        cubit.getSearch(val);
                      },
                      type: TextInputType.text,
                      controller: searchController,
                    ),
                  ),

                ),
               const SizedBox(height: 10,),
                if(state is ShopLoadingSearchState)
                 const LinearProgressIndicator(),
             searchController.text.isNotEmpty?
             ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var search = cubit.searchModel!.data!.data![index];
                      return buildFavItem(search, index, cubit);
                    },
                    separatorBuilder: (context, index) {
                      return Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.grey.shade300,
                      );
                    },
                    itemCount: cubit.searchModel!.data!.data!.length):
                Container(),
              ],
            ),
          ),
        );
      },
    );
  }
   Widget buildFavItem( Product search, int index, ShopCubit cubit) {
     return Stack(
       children: [
         Padding(
           padding:
           const EdgeInsets.only(top: 20, left: 10, right: 13, bottom: 15),
           child: Row(
             children: [
               Image(
                 image: NetworkImage(search.image!),
                 height: 160,
                 width: 160,

                 // width: 180,
               ),
               const SizedBox(
                 width: 7,
               ),
               Expanded(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(
                       search.name!,
                       maxLines: 2,
                       overflow: TextOverflow.ellipsis,
                       style: const TextStyle(
                         fontWeight: FontWeight.w600,
                         fontSize: 14,
                         height: 1.4,
                       ),
                     ),
                     const SizedBox(
                       height: 20,
                     ),
                     Row(
                       children: [
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               children: [
                                 Text(
                                   "EGP",
                                   style: TextStyle(
                                     fontSize: 12,
                                     fontWeight: FontWeight.w400,
                                     color: Colors.grey.shade600,
                                   ),
                                 ),
                                 const SizedBox(
                                   width: 3,
                                 ),
                                 Text(
                                   '${search.price!.round()}',
                                   maxLines: 2,
                                   overflow: TextOverflow.ellipsis,
                                   style: const TextStyle(
                                     fontSize: 15,
                                     fontWeight: FontWeight.w800,
                                     color: Colors.black,
                                   ),
                                 ),
                               ],
                             ),
                             const SizedBox(
                               height: 4,
                             ),

                           ],
                         ),
                         const Spacer(),
                         InkWell(
                             onTap: () {
                               cubit.changeFavorites(cubit.searchModel!.data!.data![index].id!);
                             },
                             child: CircleAvatar(
                               backgroundColor: cubit.favorites[cubit.searchModel!.data!.data![index].id!]
                                   ? HexColor(caColor)
                                   : Colors.grey,
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
               )
             ],
           ),
         ),

       ],
     );
   }

}
