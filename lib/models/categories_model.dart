class CategoriesModel{
bool ?status;
CategoriesDataModel ?categoriesData;
CategoriesModel.fromJson(Map json){
  status=json['status'];
  categoriesData=CategoriesDataModel.fromJson(json['data']);

}
}
class CategoriesDataModel{
int ?currentPage;
List data=[];
CategoriesDataModel.fromJson(json){
  currentPage=json['current_page'];
  json['data'].forEach((e){
    data.add(e);
  });

}

}
class DataModel{
 late int id;
 late String name;
  late String image;
  DataModel.fromJson(json){
    id=json['id'];
    name=json['name'];
    image=json['image'];
  }
}