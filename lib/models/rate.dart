
class Rate {
	String id;
	String userId;
	double rate;
	String createdAt;
	String updatedAt;
	dynamic deletedAt;
	String firstName;
	String lastName;

	Rate({
		this.id, 
		this.userId, 
		this.rate, 
		this.createdAt, 
		this.updatedAt, 
		this.deletedAt, 
		this.firstName, 
		this.lastName, 
	});

	 Rate.fromJson(Map<String, dynamic> json) {
				id= json['id'] as String;
				userId= json['user_id'] as String;
				rate= double.parse(json['rate'])  ;
				createdAt= json['created_at'] as String;
				updatedAt= json['updated at'] as String;
				deletedAt= json['deleted_at'];
				firstName= json['firstName'] as String;
				lastName= json['lastName'] as String;
   }

	Map<String, dynamic> toJson() => {
				'id': id,
				'user_id': userId,
				'rate': rate.toString(),
				'created_at': createdAt,
				'updated at': updatedAt,
				'deleted_at': deletedAt,
				'firstName': firstName,
				'lastName': lastName,
			};
}
