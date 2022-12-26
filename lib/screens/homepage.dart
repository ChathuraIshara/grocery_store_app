import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocerystore/screens/itemstores.dart';
import 'package:provider/provider.dart';

import 'mycart.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //appBar: AppBar(),
      body:Padding(
        padding: const EdgeInsets.all(12.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
            Expanded(child: Image.asset('assets/avocado.png'),),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text("We deliver groceries at your doorstep",style:TextStyle(fontSize: 35.0,fontWeight: FontWeight.w600),textAlign: TextAlign.center,),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text("Fresh item everyday",style:TextStyle(fontSize: 21.0,fontWeight: FontWeight.w300)),
            ),
             Padding(
               padding: const EdgeInsets.all(30.0),
               child: ElevatedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Stores()));
            },
            child:Text("Get Started"),
            style:ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 93, 11, 107),
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  
                ),
                minimumSize: Size(120,50),
                
            )),
             )
            ],
          ),
        ),
      ),
    
    );
  }
}