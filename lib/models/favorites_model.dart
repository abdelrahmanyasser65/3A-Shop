class ChangeFavoritesModel{
  bool?status;
  String ?message;
  ChangeFavoritesModel.fromJson(json){
    status=json['status'];
    message=json['message'];
  }
}