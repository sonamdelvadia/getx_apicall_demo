import 'package:get/get.dart';
import 'package:getx_apicall_demo/api/api_service.dart';
import 'package:getx_apicall_demo/model/product_response.dart';
class ProductController extends GetxController{
  var isLoading=true.obs;
  var productList=<ProductResponse>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading(true);

      var products =await ApiService.fetchProduct();

  if(productList!=null){
    productList.assignAll(products);
  }


    }
    finally{
    isLoading(false);
    }

  }

}