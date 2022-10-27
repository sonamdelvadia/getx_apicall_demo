import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_apicall_demo/controller/product_controller.dart';

class HomeScreen extends StatelessWidget {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProductList")),
      body: Obx(() {
        if (productController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: productController.productList.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            productController.productList[index].id.toString()),
                        Container(
                          height: 50,
                          width: 50,
                          child: Text(
                            productController.productList[index].name,
                            style: TextStyle(color: Colors.red, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      height: 10,
                      thickness: 1,
                    )
                  ],
                );
              });
        }
      }),
    );
  }
}
