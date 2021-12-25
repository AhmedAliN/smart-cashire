import 'package:smart_cashier/api/Api.dart';
import 'package:smart_cashier/api/ResponseData.dart';
import 'package:smart_cashier/models/rate.dart';
import 'package:smart_cashier/api/Api.dart';

import '../rateProvider.dart';

class RatetService {
  RateProvider rateProvider;
  RatetService(this.rateProvider);

  Future<void> getRate() async {
    ResponseData responseData;
    responseData = await Api.apiGet(subUrl: 'rateSelect.php');
    if (responseData.error && responseData.timeout) {
      rateProvider.addError();
    } else {
      if (responseData.data != 'Error') {
        rateProvider.changeRateState(responseData.data);
      } else {
        rateProvider.addError();
      }
    }
  }

  Future<void> getRateUser(var data) async {
    ResponseData responseData;
    responseData = await Api.apiPost(subUrl: 'rateSelect.php',body: data);
    if (responseData.error && responseData.timeout) {
      rateProvider.addError();
    } else {
      if (responseData.data != 'Error') {
        rateProvider.changeRateState(responseData.data);
      } else {
        rateProvider.addError();
      }
    }
  }

  Future<void> addRate(Rate rate) async {
    ResponseData responseData;
    var data={
      'user_id':rate.userId.toString(),
      'rate':rate.rate.toString(),
    };
    responseData = await Api.apiPost(
        subUrl: 'rateInsert.php', body: data);

    if (responseData.error && responseData.timeout) {
      rateProvider.addError();
    } else {
      if (responseData.data != 'Error') {
        rateProvider.changeRateState(responseData.data);
      } else {
        rateProvider.addError();
      }
    }
  }
}
