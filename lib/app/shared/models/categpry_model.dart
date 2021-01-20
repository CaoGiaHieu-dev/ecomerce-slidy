class CategoryModel
{
  String name;
  
  CategoryModel({this.name});

  CategoryModel.fromJSON( json)
  {
    // id= json['id'];
    name = json;
    // title = json['title'];
    // image = json['image'];
  }

  Map<dynamic, dynamic> toJson() 
  {
    final Map<String, dynamic> data = new Map<dynamic, dynamic>();
    // data['id'] = this.id;
    data['name'] = this.name;
    // data['title'] = this.title;
    // data['image'] = this.image;
    return data;
  }
}