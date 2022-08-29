import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sh/screens/homelayout/cubit/shop_cubit.dart';
import 'package:sh/screens/homelayout/cubit/shop_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<ShopCubit>(context);
        var model = cubit.categoriesModel!.categoriesData!.data;
        return Scaffold(
          body: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 15, right: 20, left: 10),
                  child: Row(
                    children: [
                      Image(
                        image: NetworkImage(
                          model[index]['image'],
                        ),
                        height: 130,
                        width: 130,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        model[index]['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 20,
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                );
              },
              itemCount: model.length),
        );
      },
    );
  }
}
