import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sh/screens/auth/loginscreen.dart';

import '../../components/components.dart';
import '../../themes/colors.dart';
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
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
                      'Already have an account?',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, LoginScreen());
                      },
                      child: Text(
                        " Sign in ",
                        style:
                            TextStyle(fontSize: 14, color: HexColor(caColor)),
                      ),
                    )
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
                          top: 70, right: 35, left: 35, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Getting Started",
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
                              "Create an account to continue!",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: HexColor(textColor)),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          defaultText('Name'),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 40,
                            child: buildTextForm(
                                onChanged: (val) {},
                                controller: nameController,
                                obscureText: false,
                                keyboardType: TextInputType.name,
                                hintText: 'Enter Your Name',
                                prefixIcon: Icons.person,
                                text: nameController.text),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultText('Email Address'),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 40,
                            child: buildTextForm(
                                onChanged: (val) {},
                                controller: emailController,
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                hintText: 'Enter Your Email ',
                                prefixIcon: Icons.email,
                                text: emailController.text),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultText('Password'),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 40,
                            child: buildTextForm(
                                onChanged: (val) {},
                                controller: passwordController,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                hintText: 'Enter Your Password',
                                prefixIcon: Icons.lock,
                                text: passwordController.text),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          defaultText('Phone'),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 40,
                            child: buildTextForm(
                                onChanged: (val) {},
                                controller: phoneController,
                                obscureText: false,
                                keyboardType: TextInputType.phone,
                                hintText: 'Enter Your Phone Number',
                                prefixIcon: Icons.phone,
                                text: phoneController.text),
                          ),
                          const Spacer(),
                          EElevatedButton(caColor, 45, 20, Colors.white, 305,
                              'SIGN UP ',

                                  () {}),
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
  }
}
