import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
// import 'package:file_picker/file_picker.dart';

import 'ResponseData.dart';
import 'package:http/http.dart' as http;

String mainURL = 'http://192.168.1.104:8080/superphp/';
// 192.168.43.133 3g
//192.168.137.14 Prov Salma
//192.168.1.104 Omar
class Api {
  static String url = mainURL;
  static Future<ResponseData> apiGet({String subUrl}) async {
    ResponseData responseData = ResponseData();
    responseData.error = false;
    responseData.timeout = false;
    try {
      var response =
          await http.get(Uri.parse(url + subUrl)).timeout(Duration(seconds: 30));
      responseData.data = jsonDecode(response.body);
      responseData.error = response.statusCode != 200;
      responseData.timeout = false;
      return responseData;
    } on TimeoutException catch (_) {
      responseData.error = false;
      responseData.timeout = true;
      responseData.data = "";
      return responseData;
    } on SocketException catch (_) {
      // print(_.osError.message);
      responseData.fatalError = _.osError.errorCode == 111;
      responseData.error = true;
      responseData.timeout = false;
      responseData.data = "";
      return responseData;
    } on FormatException catch (_) {
      responseData.error = true;
      responseData.timeout = false;
      responseData.data = "";
      return responseData;
    }
  }

  static apiPost({String subUrl, body}) async {
    // print(body);
    ResponseData responseData = ResponseData();
    responseData.error = false;
    responseData.timeout = false;
    try {
      var response = await http
          .post(
           Uri.parse( url + subUrl),
            body: body,
          )
          .timeout(Duration(seconds: 30));
      // print(response.body);
      responseData.data = jsonDecode(response.body);
      responseData.error = response.statusCode != 200;
      // print(responseData.data);
      return responseData;
    } on TimeoutException catch (_) {
      responseData.error = false;
      responseData.timeout = true;
      responseData.data = "";
      // print(responseData.data);
      return responseData;
    } on SocketException catch (_) {
      // print(_.osError.errorCode);
      // print(responseData.data);
      responseData.error = true;
      responseData.timeout = false;
      responseData.data = "";
      // responseData.error=true;
      return responseData;
    } on FormatException catch (_) {
      responseData.error = true;
      responseData.timeout = false;
      responseData.data = "";
      // print(responseData.data);
      return responseData;
    }
  }

//   static apiUploadFiles(PlatformFile files, String suburl, dynamic body) async {
//     // ignore: unused_local_variable
//     // http.IOClient client = http.IOClient(HttpClient());

//     ResponseData responseData = ResponseData();
//     responseData.error = false;
//     responseData.timeout = false;
//     try {
   
//       print(body['name']);
//       var requesqt = http.MultipartRequest('POST', Uri.parse(url + suburl));
//       requesqt.fields['name'] = body['name'];
//       requesqt.fields['phone'] = body['phone'];
//       requesqt.fields['size'] = body['size'];
//       requesqt.fields['desc'] = body['desc'];
//       requesqt.files.add(await http.MultipartFile.fromPath(
//         'image',
//         files.path,
//         filename: 'image-' +
//             getRandomString(5) +
//             '-' +
//             DateTime.now().day.toString() +
//             '-' +
//             DateTime.now().month.toString() +
//             '-' +
//             DateTime.now().year.toString() +
//             '-' +
//             DateTime.now().millisecond.toString() +
//             '.' +
//             files.path.split('.').last,
//       ));

// // ).toList();
//       // await requesqt.send().then((response) async {
//       //   // listen for response
//       //   response.stream.transform(utf8.decoder).listen((value) {
//       //     print(value);
//       //     responseData.data = value;
//       //     print(responseData.data);
//       //     // responseData.error = value.statusCode == 300;
//       //     return responseData;
//       //   });
//       // }).catchError((e) {
//       //   print(e);
//       // });
//       var res = await requesqt.send();
//       // return res.reasonPhrase;
//       responseData.data = 'ok';
//       print(responseData.data);
//       responseData.error = res.statusCode == 300;
//       return responseData;
//     } on TimeoutException catch (_) {
//       responseData.error = false;
//       responseData.timeout = true;
//       responseData.data = "";
//       return responseData;
//     } on SocketException catch (_) {
//       // Other exception
//       // A timeout occurred.
//       responseData.error = true;
//       responseData.timeout = false;
//       responseData.data = "";
//       // responseData.error=true;
//       return responseData;
//     } on FormatException catch (_) {
//       // Other exception
//       responseData.error = true;
//       responseData.timeout = false;
//       responseData.data = "";
//       // responseData.error=true;
//       return responseData;
//     }
//   }

}

// String _chars =
//     'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
// Random _rnd = Random();

// String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
//     length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
