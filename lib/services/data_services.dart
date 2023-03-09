import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jappa/model/data_model.dart';

class DataServices {
  String baseUrl = 'http://mark.bslmeiyu.com/api';

  Future<List<DataModel>> getInfo() async {
    var apiUrl = '/getplaces';

    //We get the json data from the server
    http.Response res = await http.get(Uri.parse(baseUrl + apiUrl));

    try {
      //If successful
      if (res.statusCode == 200) {
        //we decode the data into a list
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      } else {
        return <DataModel>[];
      }
    } catch (e) {
      print(e);
      return <DataModel>[];
    }
  }
}
