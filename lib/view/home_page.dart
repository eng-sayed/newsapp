import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../model/news_model.dart';
import '../controller/news_controller.dart';

class HomePage extends GetWidget<NewsController> {
  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: FutureBuilder(
        future: controller.getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // final post =
            //     snapshot.data.map((e) => Articles.fromJson(e)).toList();

            return ListView.builder(
                itemCount: controller.list.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 10.0,
                    shadowColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22.0),
                    ),
                    child: Column(
                      children: [
                        Image.network(controller.list[index].urlToImage!),
                        Text(controller.list[index].title!),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(controller.list[index].description!),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
