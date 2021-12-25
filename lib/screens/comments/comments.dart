
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_cashier/constants.dart';
import 'package:smart_cashier/data_variables/ui_data.dart';
import 'package:smart_cashier/models/comments.dart';
import 'package:smart_cashier/providers/commentProvider.dart';
import 'package:smart_cashier/providers/service/commentService.dart';

class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  CommentsProvider commentProvider;
  CommentstService commentsService;
   @override
  void initState() {
    super.initState();
    commentProvider=Provider.of<CommentsProvider>(context,listen: false);
    commentsService=new CommentstService(commentProvider);
    commentsService.getCommentsUser({'user_id':user.id.toString()});


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
        title: Text("مقترحاتك تهمنا" ,style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        
        automaticallyImplyLeading: false,
      ),
      body: Container(
        
        child: CommentBox(
          
          userImage:
              "assets/logo.logo_E.png",
          
          child: Consumer<CommentsProvider>(builder: (context, model, child) {
                if (model.load) {
            return Center(child: CircularProgressIndicator());
          } else if (model.hasError || model.comments.isEmpty) {
            return Center(
              child: Text('NoDAta'),
            );
          } else {
            return commentChild(model.comments);
            }
            
          }),
          labelText: 'لطفا دون اقتراحك...',
          withBorder: false,
          errorText: 'حقل الاقتراح لا يمكن أن يكون خالي',
          sendButtonMethod: () {
            if (formKey.currentState.validate()) {
              print(commentController.text);
               Comments comments=new Comments();
               comments.userId=user.id.toString();
               comments.comment=commentController.text;
              commentsService.addComments(comments);
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor:Colors.blue[800],
          textColor: Colors.white,
          
          sendWidget: 
          Icon(Icons.send_sharp, size: 30, color: Colors.white),
        ),
      ),
    );
  }
}