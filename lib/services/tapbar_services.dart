
import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/tapbar_model.dart';

class tapbar_services{
  dynamic url = 'https://dummyjson.com/carts/user/';
  dynamic numbers = ["15","22"];

  Future FetchProducts(int index) async{

    final JsonRespone = await http.get(Uri.parse(url+numbers[index]));

    if(JsonRespone.statusCode == 200){
      final result = jsonDecode(JsonRespone.body);
      try {
        final ProductResults = TapbarModel.fromJson(result);

        if (ProductResults.carts != null) {
          print(ProductResults.carts?[0].products);
          return ProductResults.carts?[0].products;
        }
      }
      catch(e){
        return [];
      }


    }
    else{
      throw Exception("Error");
    }

  }

}

