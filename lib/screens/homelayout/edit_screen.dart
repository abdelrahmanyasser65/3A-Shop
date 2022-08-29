import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sh/components/components.dart';
import 'package:sh/screens/homelayout/cubit/shop_cubit.dart';
import 'package:sh/screens/homelayout/cubit/shop_state.dart';
import 'package:sh/themes/colors.dart';

class EditScreen extends StatelessWidget {
  EditScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<ShopCubit>(context);
        var model = cubit.getUserDataModel!.data;
        nameController.text=model!.name!;
        emailController.text=model.email!;
        phoneController.text=model.phone!;
        return
        Scaffold(
          body:

          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 250,
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Container(
                        height: 220,
                        width: double.infinity,
                        padding:const EdgeInsets.only(
                          top: 60,
                          left: 40
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back,size: 28,color: HexColor(caColor),))
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://scontent-hbe1-1.xx.fbcdn.net/v/t39.30808-1/270120856_336166048356274_4021224055519644078_n.jpg?stp=c10.3.940.940a_dst-jpg_s240x240&_nc_cat=111&ccb=1-7&_nc_sid=7206a8&_nc_ohc=mPYQ8v6QFHgAX-icb9Q&_nc_ht=scontent-hbe1-1.xx&oh=00_AT-MzE4qE-z7MLanNwBHCeLLsbfBEjOSH7JC0OamdKV7ag&oe=630EB993'),
                              )),

                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,

                            decoration: BoxDecoration(
                                color: HexColor(caColor),
                                shape: BoxShape.circle
                            ),
                            child: const Icon(Icons.camera_alt, color: Colors.white,),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 60,
                      left: 20, right: 20
                  ),
                  child: Column(
                    children: [

                      buildTextFormField(
                        icon: Icons.person,
                        hint: 'Enter your Name',
                        onChange: (val){

                        },
                        type: TextInputType.name,
                        controller: nameController,
                      ),
                      const SizedBox(height: 20,),
                      buildTextFormField(
                        icon: Icons.email,
                        hint: 'Enter your Email',
                        onChange: (val) {

                        },
                        type: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      const SizedBox(height: 20,),
                      buildTextFormField(
                        icon: Icons.phone,
                        hint: 'Enter your Phone',
                        onChange: (val){},
                        type: TextInputType.phone,
                        controller: phoneController,
                      ),
                     const SizedBox(height: 20,),
                     if (state is ShopLoadingUpdateState)
                   const   LinearProgressIndicator(),

                      const SizedBox(height: 30,),
                      EElevatedButton(
                          caColor,
                          50,
                          20,
                          Colors.white,
                          double.infinity,
                          'UPDATE',

                              (){
                            if(nameController.text.isNotEmpty){
                              cubit.upData(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text);
                            }
                            else {

                              Fluttertoast.showToast(
                                  msg: 'Enter Your Data',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 5,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 18.0);

                            }
                          }

                      ),
                    ],
                  ),
                ),]
              ,
            ),
        )
        );

      },
    );
  }


}
