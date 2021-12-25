import 'package:smart_cashier/api/Api.dart';
import 'package:smart_cashier/api/ResponseData.dart';
import 'package:smart_cashier/models/comments.dart';
import 'package:smart_cashier/providers/categoryProvider.dart';
import 'package:smart_cashier/api/Api.dart';

import '../commentProvider.dart';

class CommentstService {
  CommentsProvider commentProvider;
  CommentstService(this.commentProvider);

  Future<void> getComments() async {
    ResponseData responseData;
    responseData = await Api.apiGet(subUrl: 'commnetsSelect.php');
    if (responseData.error && responseData.timeout) {
      commentProvider.addError();
    } else {
      if (responseData.data != 'Error') {
        commentProvider.changeCommentsState(responseData.data);
      } else {
        commentProvider.addError();
      }
    }
  }

  Future<void> getCommentsUser(var data) async {
    ResponseData responseData;
    responseData = await Api.apiPost(subUrl: 'commnetsSelect.php',body: data);
    if (responseData.error && responseData.timeout) {
      commentProvider.addError();
    } else {
      if (responseData.data != 'Error') {
        commentProvider.changeCommentsState(responseData.data);
      } else {
        commentProvider.addError();
      }
    }
  }

  Future<void> addComments(Comments comments) async {
    ResponseData responseData;
    var data={
      'user_id':comments.userId.toString(),
      'comment':comments.comment,
    };
    responseData = await Api.apiPost(
        subUrl: 'commentsInsert.php', body: data);

    if (responseData.error && responseData.timeout) {
      commentProvider.addError();
    } else {
      if (responseData.data != 'Error') {
        commentProvider.changeCommentsState(responseData.data);
      } else {
        commentProvider.addError();
      }
    }
  }
}
