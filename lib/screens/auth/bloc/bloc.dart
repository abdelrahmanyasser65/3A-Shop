import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sh/components/const.dart';
import 'package:sh/helper/dio_helper.dart';
import 'package:sh/screens/auth/bloc/state.dart';

import '../../../models/login_model.dart';


class ShopLoginCubit extends Cubit<ShopLoginState> {
  ShopLoginCubit() : super(ShopLoginInitialState());


  String email='';
  String password='';
  void changeEmail(val){
    email=val;
    emit(ShopLoginChangeEmail());
  }
  void changePassword(val){
    password=val;
    emit(ShopLoginChangePassword());
  }
  LoginModel ?loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value){
       print(value.data);
    loginModel=   LoginModel.formJson(value.data);

       emit(ShopLoginSuccessState(
         loginModel!
       ));
    }).catchError((e){
      emit(ShopLoginErrorState(e.toString()));
    });
  }

}
