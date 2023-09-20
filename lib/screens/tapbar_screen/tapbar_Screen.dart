
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:third_api_project/screens/tapbar_screen/controller.dart';
import 'package:third_api_project/services/tapbar_services.dart';

class tapbar_screen extends StatelessWidget{
  final controller = Get.put(tapbarController());
  @override

  Widget build(BuildContext context){
    return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child:
        Scaffold(
          appBar: AppBar(
            title: const Text('TabBar Test'),
            bottom: TabBar(
              onTap:(int index) {
                controller.OnTapFunction(index);
                controller.fetchProducts();
                },

              tabs: const <Widget>[
                Tab(
                  icon : Text("15"),
                ),
                Tab(
                  icon: Text("22"),
                ),
              ],
            ),
          ),

          body:
              Column( children : [
                const SizedBox(height: 20,),
          Obx(() => (controller.ListOfProducts.isEmpty)?  const Center( child : Text("Empty",style: TextStyle(fontSize: 25),)):
              Expanded(child: ListView.separated(
                separatorBuilder: (context, int index){
                  return const SizedBox(height: 40,);
                },
                itemBuilder: (context, int index){
                  return Container(
                    padding: const EdgeInsets.all(10),
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("The name of the product is: ${controller.ListOfProducts.value[index].title}", style:  const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        Text("The id of the product is: ${controller.ListOfProducts.value[index].id}", style:  const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        Text("The quantity of the product is: ${controller.ListOfProducts.value[index].quantity}", style:  const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                        Text("The price of the product is: ${controller.ListOfProducts.value[index].price}", style:  const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      ],),
                  );
                },
                itemCount: controller.ListOfProducts.value.length,
              ))
          )
        ])
        )

    );
  }


}