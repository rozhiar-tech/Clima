import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    var call = Uri.parse(url);
    http.Response response = await http.get(call);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = convert.jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
