class Accounts {
  String id;
  String accId;
  String totalAmount;
  String createdAt;
  String updatedAt;
  String deletedAt;
  String userId;

  Accounts(
      {this.id,
      this.accId,
      this.totalAmount,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId});

  Accounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accId = json['acc_id'];
    totalAmount = json['total_amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['acc_id'] = this.accId;
    data['total_amount'] = this.totalAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['user_id'] = this.userId;
    return data;
  }
}
