class User {
  String id;
  String firstName;
  String lastName;
  String phone;
  String email;
  String password;
  String createdAt;
  String role;
  String updatedAt;
  String deletedAt;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.phone,
      this.email,
      this.password,
      this.createdAt,
      this.role,
      this.updatedAt,
      this.deletedAt});

  User.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.firstName = json['firstName'];
    this.lastName = json['lastName'];
    this.phone = json['phone'];
    this.email = json['email'];
    this.password = json['password'];
    this.createdAt = json['created_at'];
    this.role = json['role'];
    this.updatedAt = json['updated_at'];
    this.deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['created_at'] = this.createdAt;
    data['role'] = this.role;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
