import 'package:sh/models/favorites_model.dart';
import 'package:sh/models/get_datauser_model.dart';

abstract class ShopState{}
class ShopInitialState extends ShopState{}



class ShopChangeBottomState extends ShopState{}
class ShopChaneActionState extends ShopState{}

class ShopLoadingHomeDataState extends ShopState{}
class ShopSuccessHomeDataState extends ShopState{}
class ShopErrorHomeDataState extends ShopState{
  String error;
  ShopErrorHomeDataState(this.error);
}

class ShopSuccessCategoriesState extends ShopState{}
class ShopErrorCategoriesState extends ShopState{
  String error;
  ShopErrorCategoriesState(this.error);
}
class ShopChangeFavoritesState extends ShopState{}
class ShopSuccessChangeFavoritesState extends ShopState{
  final ChangeFavoritesModel model;
  ShopSuccessChangeFavoritesState(this.model);
}
class ShopErrorChangeFavoritesState extends ShopState{
  String error;
  ShopErrorChangeFavoritesState(this.error);
}
class ShopLoadingGetFavoritesState extends ShopState{}
class ShopSuccessGetFavoritesState extends ShopState{}
class ShopErrorGetFavoritesState extends ShopState{
  String error;
  ShopErrorGetFavoritesState(this.error);
}
class ShopLoadingGetUserDataState extends ShopState{}
class ShopSuccessGetUserDataState extends ShopState{
  GetUserDataModel getUserDataModel;
  ShopSuccessGetUserDataState(this.getUserDataModel);
}
class ShopErrorGetUserDataState extends ShopState{
  String error;
  ShopErrorGetUserDataState(this.error);
}

class ShopLoadingUpdateState extends ShopState{}
class ShopSuccessUpdateState extends ShopState{}
class ShopErrorUpdateState extends ShopState{
  String error;
  ShopErrorUpdateState(this.error);
}

class ShopLoadingSearchState extends ShopState{}
class ShopSuccessSearchState extends ShopState{}
class ShopErrorSearchState extends ShopState{
  String error;
  ShopErrorSearchState(this.error);
}