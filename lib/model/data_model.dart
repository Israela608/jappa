class DataModel {
  String? name;
  String? description;
  int? price;
  int? stars;
  int? people;
  String? img;
  String? location;

  DataModel({
    this.name,
    this.description,
    this.price,
    this.stars,
    this.people,
    this.img,
    this.location,
  });

  DataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    people = json['people'];
    img = json['img'];
    location = json['location'];
  }

  /* Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['stars'] = this.stars;
    data['people'] = this.people;
    data['selected_people'] = this.selectedPeople;
    data['img'] = this.img;
    data['location'] = this.location;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }*/
}
