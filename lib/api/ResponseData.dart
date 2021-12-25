class ResponseData {
var data;
bool error =false;
bool timeout =false;
bool fatalError =false;
ResponseData({this.data,this.error=false,this.timeout=false,this.fatalError=false});
   ResponseData.fromJson(Map<String, dynamic> json) {
  data = json['data'];
  fatalError = json['fatalError'];

  error = json['error'];
  
  timeout = json['timeout'];
  
 }
 Map<String, dynamic> toJson() {
 final Map<String, dynamic> data = new Map<String, dynamic>();
  data['data'] = this.data;
  data['timeout'] = this.timeout;
  data['error'] = this.error;
  return data;
 }
}