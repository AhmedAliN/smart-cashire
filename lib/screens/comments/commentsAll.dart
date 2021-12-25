
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/models/comments.dart';
import 'package:smart_cashier/providers/commentProvider.dart';
import 'package:smart_cashier/providers/service/commentService.dart';

class CommentsAll extends StatefulWidget {
  @override
  _CommentsAllState createState() => _CommentsAllState();
}

class _CommentsAllState extends State<CommentsAll> {

  CommentsProvider commentProvider;
  CommentstService commentsService;
   @override
  void initState() {
    super.initState();
    commentProvider=Provider.of<CommentsProvider>(context,listen: false);
    commentsService=new CommentstService(commentProvider);
    commentsService.getComments();


  }
  Widget commentChild(List<Comments> comments) {
    return ListView(
      children: comments.map((e) => 
       Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                     child: Text(
                       e.userName.substring(0,1),
                     ),
                      ),
                ),
              ),
              title: Text(
               e.userName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(e.comment),
            ),
          )
      ).toList()
        
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الاقتراحات",style:TextStyle(color:Colors.white)),
        backgroundColor: Colors.blue[800],
      ),
      body: Container(
        child:Consumer<CommentsProvider>(builder: (context, model, child) {
                if (model.load) {
            return Center(child: CircularProgressIndicator());
          } else if (model.hasError || model.comments.isEmpty) {
            return Center(
              child: Text('noDAta'),
            );
          } else {
            return commentChild(model.comments);
            }
            
          }),
      ),
    );
  }
}