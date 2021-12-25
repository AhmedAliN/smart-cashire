import 'package:flutter/foundation.dart';

class Comments {
	 String id;
	 String  userId;
	 String  userName;
	 String  comment;
	 String  createdAt;
	 String updatedAt;


	 Comments({
		this.id, 
		this.userId, 
		this.comment, 
		this.userName, 
		this.createdAt, 
		this.updatedAt, 
 
	});
	 Comments.fromJson(Map<String, dynamic> json){
				id= json['id'];
				userId= json['user_id'];
				userName= json['firstName'] +' '+json['lastName'] ;
				comment= json['comment'];
				createdAt= json['created_at'];
				updatedAt= json['updated_at'];
   }
	Map<String, dynamic> toJson() => {
				'id': id,
				'user_id': userId,
				'comment': comment,
				'created_at': createdAt,
				'updated_at': updatedAt,
			
			};

}
