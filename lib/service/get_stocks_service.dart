import 'package:http/http.dart' as http;

Future<String> getStocksService() async {
  const String baseURL =
      'https://run.mocky.io/v3/fc3ddccf-855c-4bb6-861c-cf7896aa963e';
  
    var url = Uri.parse(baseURL);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw 'Request failed with status code ${response.statusCode}';
    }
  }
