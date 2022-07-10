import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/news_model.dart';

class NewsController extends GetxController {
  List<Articles> list = [];

  getData() async {
    // list = [];
    Uri url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=c6a27b354ba644fc8aafeb0610701b38");
    http.Response res = await http.get(url);
    if (res.statusCode == 200) {
      try {
        final mydata = Welcome.fromJson(jsonDecode(res.body));

        mydata.articles?.forEach((element) {
          list.add(element);
        });
        return list;
        //return jsonDecode(res.body)['articles'];
      } catch (e) {
        Get.snackbar("error", e.toString());
      }
    }
  }
}
