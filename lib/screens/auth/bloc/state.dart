import 'package:sh/models/login_model.dart';

abstract class ShopLoginState{}
class ShopLoginInitialState extends ShopLoginState{}
class ShopLoginChangeEmail extends ShopLoginState{}
class ShopLoginChangePassword extends ShopLoginState{}
class ShopLoginLoadingState extends ShopLoginState{}
class ShopLoginSuccessState extends ShopLoginState{
  final LoginModel loginModel;
  ShopLoginSuccessState(this.loginModel);
}
class ShopLoginErrorState extends ShopLoginState{
  final String error;
  ShopLoginErrorState(this.error);
}
