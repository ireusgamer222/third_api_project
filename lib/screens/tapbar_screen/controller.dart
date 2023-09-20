import 'package:get/get.dart';
import 'package:third_api_project/models/tapbar_model.dart';
import 'package:third_api_project/services/tapbar_services.dart';




class tapbarController extends GetxController{
  final ListOfProducts = [].obs;
  tapbar_services services = tapbar_services();
  int currentindex = 0;
  final loading=false.obs;



  Future fetchProducts() async{
    loading.value = true;
    ListOfProducts.value = (await services.FetchProducts(currentindex))!;
    loading.value = false;

  }

  void OnTapFunction(int index){
    currentindex = index;
    print("index is $currentindex");
  }

  @override
  void onInit() async {
    super.onInit();
      await fetchProducts();

  }
}