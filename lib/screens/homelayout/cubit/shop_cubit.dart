
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sh/components/const.dart';
import 'package:sh/helper/dio_helper.dart';
import 'package:sh/models/categories_model.dart';
import 'package:sh/models/favorites_model.dart';
import 'package:sh/models/get_datauser_model.dart';
import 'package:sh/models/get_favorites_model.dart';
import 'package:sh/models/home_model.dart';
import 'package:sh/models/search_model.dart';
import 'package:sh/screens/homelayout/cart_screen.dart';
import 'package:sh/screens/homelayout/cateogries_screen.dart';
import 'package:sh/screens/homelayout/cubit/shop_state.dart';
import 'package:sh/screens/homelayout/favorites_screen.dart';
import 'package:sh/screens/homelayout/home_screen.dart';
import 'package:sh/screens/homelayout/profile_screen.dart';



class ShopCubit extends Cubit<ShopState>{
  ShopCubit():super(ShopInitialState());
  static ShopCubit get(context)=>BlocProvider.of(context);
  int currentIndex=4;
  List<Widget>screens=const[
    CategoriesScreen(),
    FavoritesScreen(),
    CartScreen(),
    ProfileScreen(),
    HomeScreen(),
  ];
  void changeBottom(int index){
    currentIndex=index;
    emit(ShopChangeBottomState());
  }
  void changeAction(){
    currentIndex=4;
    emit(ShopChaneActionState());
  }

  HomeModel ?homeModel;
 Map favorites={};
  void getHomeData(){
  emit(ShopLoadingHomeDataState());
  DioHelper.getData(
      url:HOME,
    token:token,
  ).then((value){
   homeModel=HomeModel.formJson(value.data);

   homeModel!.dataModel.products.forEach((element) {
     favorites.addAll({element['id']: element['in_favorites']});

      });

  emit(ShopSuccessHomeDataState());
  }).catchError((e){
  print(e.toString());

  emit(ShopErrorHomeDataState(
    e.toString()
  ));
  });
  }
  CategoriesModel ?categoriesModel;

  void getCategories(){

    DioHelper.getData(
      url:CATEGORIES,
      token:token,
    ).then((value){
     categoriesModel=CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((e){
      print(e.toString());

      emit(ShopErrorCategoriesState(
          e.toString()
      ));
    });
  }
ChangeFavoritesModel ?changeFavoritesModel;
 void changeFavorites(int productId){
   favorites[productId]=!favorites[productId];
   emit(ShopChangeFavoritesState());
    DioHelper.postData(
        url: FAVORITES,
        data: {
          'product_id':productId,
        },
      token: token,
    ).then((value) {
      changeFavoritesModel=ChangeFavoritesModel.fromJson(value.data);
      if(!changeFavoritesModel!.status!){
        favorites[productId]=!favorites[productId];
      }else{
        getFavorites();
      }
    emit(ShopSuccessChangeFavoritesState(changeFavoritesModel!));
    }).catchError(
        (e){
          favorites[productId]=!favorites[productId];
emit(ShopErrorChangeFavoritesState(e));
        });
 }

  GetFavoritesModel ?getFavoritesModel;

  void getFavorites(){
     emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      url:FAVORITES,
      token:token,
    ).then((value){
      getFavoritesModel=GetFavoritesModel.fromJson(value.data);
    emit(ShopSuccessGetFavoritesState());
    }).catchError((e){
      print(e.toString());

      emit(ShopErrorGetFavoritesState(
          e.toString()
      ));
    });
  }

  GetUserDataModel ?getUserDataModel;
  void getUserData(){
    emit(ShopLoadingGetUserDataState());
    DioHelper.getData(
      url:PROFILE,
      token:token,
    ).then((value){
      getUserDataModel=GetUserDataModel.fromJson(value.data);
      emit(ShopSuccessGetUserDataState(getUserDataModel!));
    }).catchError((e){
      print(e.toString());

      emit(ShopErrorGetUserDataState(
          e.toString()
      ));
    });
  }

  void upData({
  required String name,
  required String email,
  required String phone,
}){
    emit(ShopLoadingUpdateState());
    DioHelper.putData(
      url:UPDATEPROFILE,
      token:token,
      data: {
        'name':name,
        'email':email,
        'phone':phone
      },
    ).then((value){
      getUserDataModel=GetUserDataModel.fromJson(value.data);
     emit(ShopSuccessUpdateState());
    }).catchError((e){
      print(e.toString());

      emit(ShopErrorUpdateState(
          e.toString()
      ));
    });
  }

  SearchModel ?searchModel;
  getSearch(String text){
    emit(ShopLoadingSearchState());
    DioHelper.postData(
        url: SEARCH,
        data: {
          'text':text
        },
    token: token
    ).
    then((value) {
   searchModel=   SearchModel.fromJson(value.data);
      print(value.data);
      emit(ShopSuccessSearchState());
    }).
    catchError((e){
      print(e);
      ShopErrorSearchState(e.toString());
    });
  }
}