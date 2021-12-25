class Products {
  String id;
  String name;
  String barcode;
  String price;
  String discount;
  String catid;
  String image;
  String dateEx;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Products(
      {this.id,
      this.name,
      this.barcode,
      this.price,
      this.discount,
      this.catid,
      this.image,
      this.dateEx,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    barcode = json['barcode'];
    price = json['price'];
    discount = json['discount'];
    catid = json['catid'];
    image = json['image'];
    dateEx = json['date_ex'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['barcode'] = this.barcode;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['catid'] = this.catid;
    data['image'] = this.image;
    data['date_ex'] = this.dateEx;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
