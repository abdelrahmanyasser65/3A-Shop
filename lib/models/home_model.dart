class HomeModel{
late  bool status;
late  HomeDataModel dataModel;
  HomeModel.formJson(Map json){
    status=json['status'];
    dataModel=HomeDataModel.fromJson(json['data']);
  }
}
class HomeDataModel{
 List banners=[];
 List products=[];
  HomeDataModel.fromJson(Map json){
    json['banners'].forEach((e){
      banners.add(e);
    });
    json['products'].forEach((e){
      products.add(e);
    });
  }
}
class BannerModel{
  int ?id;
  String?image;

BannerModel.fromJson(Map json){
id=json['id'];
image=json['image'];
}
}
class ProductModel{
  int ?id;
  double? price;
  double? oldPrice;
  double? discount;
  String ?image;
  String ?name;
  bool?in_favorites;
  bool ?in_cart;
  ProductModel.fromJson(Map json){
  id=json['id'];
  price=json['price'];
  oldPrice=json['old_price'];
  discount=json['discount'];
  image=json['image'];
  name=json['name'];
  in_favorites=json['in_favorites'];
  in_cart=json['in_cart'];
  }
}