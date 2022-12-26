import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocerystore/screens/mycart.dart';
import 'package:provider/provider.dart';


class Stores extends StatefulWidget {

 
  

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {







  Widget buildItem(String name, String imgpath, String price, Color color, Color bcolor) {

    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: color.withAlpha(120)),
      // ignore: sort_child_properties_last
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imgpath,
              height: 180.0,
              width: 100.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Expanded(
                child: Text(name,
                    style: TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w400))),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Expanded(
                child: ElevatedButton(
                    onPressed: () {
                     
                        List temp=[imgpath,name,price];
                        context.read<MyData>().demo.add(temp);
                        context.read<MyData>().calculateTotal(Provider.of<MyData>(context,listen:false).demo);
                       

                       // widget.cart.add(temp);
                       // print(cart);
                        //calculateTotal();
                        

                      
                    },
                    child: Text(price),
                    style: ElevatedButton.styleFrom(
                      primary: bcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: Size(100, 40),
                    )),
              ))
        ],
      ),
      margin: EdgeInsets.all(8.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCart()));
         
      },
      backgroundColor: Colors.black,
      child:Icon(Icons.shopping_bag)),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                child: Text("Good morning,",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
                alignment: Alignment.topLeft,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 12.0, 0, 40.0),
                child: Text("Let's order fresh items for you",
                    style:
                        TextStyle(fontSize: 45.0, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                child: Align(
                  child: Text("Fresh items",
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.w300)),
                  alignment: Alignment.topLeft,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: buildItem("Avocado", "assets/avocado.png","\$4.00", Colors.green,Color.fromARGB(255, 4, 52, 5)),
                       
                        //color:Colors.green,// height: 300,
                      ),
                      //  SizedBox(width: 12.0,),
                     Expanded(
                          child: buildItem("Banana", "assets/banana.png", "\$2.50", Colors.yellow,Color.fromARGB(255, 193, 55, 9)),)
                          ],
                        ),
                ),),
                  
      Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: buildItem("Chicken", "assets/chicken.png", "\$12.80", Colors.brown,Color.fromARGB(255, 84, 34, 15)),
                       
                        //color:Colors.green,// height: 300,
                      ),
                      //  SizedBox(width: 12.0,),
                     Expanded(
                          child: buildItem("Water", "assets/water.png", "\$1.00", Colors.blue,Color.fromARGB(255, 14, 64, 164)),)
                          ],
                        ),
                ),),
               
            ],
          ),
        ),
      ),
    );
  }
}
