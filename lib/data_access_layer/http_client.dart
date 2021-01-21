
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HttpClient {
  Future<dynamic> get(String url) async{
    var response = await http.get(url);
    if(response.statusCode == 200){
      var jsonResponse = convert.jsonDecode(response.body);
      var listResponse = jsonResponse["results"] as List;
      return listResponse;
    }else{
      print('xXx:ERROR Status');
      return Exception();
    }
  }
}