import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:sh/components/const.dart';
import 'package:sh/screens/auth/bloc/state.dart';
import 'package:sh/screens/auth/sgin_up.dart';
import 'package:sh/screens/homelayout/homelayout.dart';

import '../../components/components.dart';
import '../../helper/cash_helper.dart';
import '../../themes/colors.dart';
import 'bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLoginCubit, ShopLoginState>(
      listener: (context, state) {
        if (state is ShopLoginSuccessState) {
          if (state.loginModel.status!) {
            CachHelper.saveData(
                key: 'token', value: state.loginModel.data!.token)
                .then((value) {
                  token=state.loginModel.data!.token!;
              navigateAndFinish(context, HomeLayout());
            });
          } else {
            Fluttertoast.showToast(
                msg: state.loginModel.message!,
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
        var cubit = BlocProvider.of<ShopLoginCubit>(context);
        return Scaffold(
            backgroundColor: HexColor(eaColor),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 70, bottom: 35, left: 35, right: 35),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.close,
                              size: 25,
                            )),
                        const Spacer(),
                        const Text(
                          'Forgot your credentials?',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 38),
                        height: 647,
                        child: Container(
                          height: 647,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(35),
                                topRight: Radius.circular(35),
                              )),
                          padding: const EdgeInsets.only(
                              top: 90, right: 35, left: 35, bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  "Let's Sign You In ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor(textColor),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Center(
                                child: Text(
                                  "Welcome back, you’ve been missed!",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      color: HexColor(textColor)),
                                ),
                              ),
                              const SizedBox(
                                height: 60,
                              ),
                              defaultText('Email Address'),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 45,
                                child: buildTextForm(
                                    onChanged: (val) {
                                      cubit.changeEmail(val);
                                    },
                                    controller: nameController,
                                    obscureText: false,
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'Enter Email',
                                    prefixIcon: Icons.email,
                                    text: cubit.email),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              defaultText('Password'),
                              const SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 45,
                                child: buildTextForm(
                                    onChanged: (val) {
                                      cubit.changePassword(val);
                                    },
                                    controller: passwordController,
                                    obscureText: true,
                                    keyboardType:
                                    TextInputType.visiblePassword,
                                    hintText: 'Enter Password',
                                    prefixIcon: Icons.lock,
                                    text: cubit.password),
                              ),
                              const Spacer(),
                              EElevatedButton(
                                  caColor,
                                  45,
                                  20,
                                  Colors.white,
                                  305,
                                  'SIGN IN ',
                                  (cubit.email.isNotEmpty &&
                                      cubit.password.isNotEmpty)
                                      ? () {
                                    state is! ShopLoginLoadingState
                                        ? cubit.userLogin(
                                        email: cubit.email,
                                        password: cubit.password)
                                        : const Center(
                                      child:
                                      CircularProgressIndicator(),
                                    );
                                  }
                                      : null),
                              const SizedBox(
                                height: 15,
                              ),
                              EElevatedButton('#E4E5E9', 45, 20, Colors.black,
                                  305, 'Create an account ', () {
                                 navigateTo(context, SignUpScreen());
                                  }),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: HexColor(caColor),
                        child: Image.asset('assets/Thumb.png'),
                      )
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
