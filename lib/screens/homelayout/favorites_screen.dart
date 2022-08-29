import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sh/models/get_favorites_model.dart';
import 'package:sh/screens/homelayout/cubit/shop_cubit.dart';
import 'package:sh/screens/homelayout/cubit/shop_state.dart';

import '../../components/components.dart';
import '../../themes/colors.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<ShopCubit>(context);

        return cubit.homeModel != null && cubit.categoriesModel != null
            &&cubit.getFavoritesModel!=null&&cubit.getUserDataModel!=null
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var fav = cubit.getFavoritesModel!.data!.data![index];
                  return buildFavItem(fav, index, cubit);
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                  );
                },
                itemCount: cubit.getFavoritesModel!.data!.data!.length)
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }


}
