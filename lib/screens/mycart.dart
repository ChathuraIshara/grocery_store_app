import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocerystore/screens/itemstores.dart';
import 'package:provider/provider.dart';


class MyCart extends StatefulWidget {
  

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
   
   
  
  
  


  // late Stores s;
  Widget itemslist() {
    if (Provider.of<MyData>(context).demo.isEmpty) {
      return Container(
       child: Text("Cart is empty!", style: TextStyle(fontSize: 18.0))
       );
    } else {
      
      return  ListView.builder(
              itemCount: Provider.of<MyData>(context).demo.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(Provider.of<MyData>(context).demo[index][0]),
                  title: Text(Provider.of<MyData>(context).demo[index][1]),
                  subtitle: Text(Provider.of<MyData>(context).demo[index][2]),
                  trailing: Icon(Icons.close),
                );
              }
        
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        leading: IconButton(
          icon:Icon(Icons.arrow_back_ios,color:Colors.black),
         
          onPressed: ()
          {
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Stores()));

          },
        ),      // Spacer(),     
       
        elevation: 0,
      ),
      body: Provider.of<MyData>(context).demo.length>0 ?Container(
        margin: EdgeInsets.all(12.0),
        padding:EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text("My Cart",
                      style:
                          TextStyle(fontSize: 38.0, fontWeight: FontWeight.w500),textAlign: TextAlign.left,),
            ),
                        SizedBox(height: 30.0),
            Expanded(
              child: ListView.builder(
                      itemCount: Provider.of<MyData>(context).demo.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin:EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color:Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Expanded(
                            child: ListTile(
                              leading: Image.asset(Provider.of<MyData>(context).demo[index][0]),
                              title: Text(Provider.of<MyData>(context).demo[index][1]),
                              subtitle: Text(Provider.of<MyData>(context).demo[index][2]),
                              trailing: Icon(Icons.cancel),
                              onTap: ()
                              {
                                
                                  Provider.of<MyData>(context,listen:false).demo.removeAt(index);
                                  context.read<MyData>().calculateTotal(Provider.of<MyData>(context,listen: false).demo);
                                 // widget.total;
                                
                                
                              },
                            ),
                          ),
                        );
                      }
                
              ),
            ),
            Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin:EdgeInsets.symmetric(horizontal: 20.0),
              padding:EdgeInsets.symmetric(horizontal: 18.0,vertical: 18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                 color: Colors.green,
              ),
              alignment:Alignment.bottomLeft,
              height: 100,
              width: double.infinity,
             
              child: GestureDetector(
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Price",style:TextStyle(color:Colors.white,fontSize: 18.0),textAlign: TextAlign.center,),
                          SizedBox(height: 8.0),
                          Text("\$ "+Provider.of<MyData>(context).total.toStringAsFixed(2),style:TextStyle(color:Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        ],
                      ),
                      Spacer(),
                      OutlinedButton.icon(onPressed: () {},
                      icon: Text("Pay Now"),
                      label:Icon(Icons.arrow_forward_ios),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(80, 50),
                        primary: Colors.white,
                        side: BorderSide(width: 1,color:Colors.white),
                        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
                        
                       // minimumSize: Size.fromHeight(20.0)
                        
                      ),),
                    ],
                 
                  ),
                ),
              
            ),
          ),
          ],
        ),
      ):Container(
        margin: EdgeInsets.all(12.0),
        padding:EdgeInsets.all(8.0),
        //padding:EdgeInsets.all(20.0),
        child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text("My Cart",
                    style:
                        TextStyle(fontSize: 38.0, fontWeight: FontWeight.w500)),
          ),
          SizedBox(height: 30.0),            
          Align(
            alignment:Alignment.topLeft,child: Text("Cart is empty!", style: TextStyle(fontSize: 18.0))),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin:EdgeInsets.symmetric(horizontal: 20.0),
              padding:EdgeInsets.symmetric(horizontal: 18.0,vertical: 18.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                 color: Colors.green,
              ),
              alignment:Alignment.bottomLeft,
              height: 100,
              width: double.infinity,
             
              child: GestureDetector(
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Total Price",style:TextStyle(color:Colors.white,fontSize: 18.0),textAlign: TextAlign.center,),
                          SizedBox(height: 8.0),
                          Text("\$ "+Provider.of<MyData>(context).total.toStringAsFixed(2),style:const TextStyle(color:Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        ],
                      ),
                      Spacer(),
                      OutlinedButton.icon(onPressed: () {},
                      icon: Text("Pay Now"),
                      label:Icon(Icons.arrow_forward_ios),
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(80, 50),
                        primary: Colors.white,
                        side: BorderSide(width: 1,color:Colors.white),
                        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
                        
                       // minimumSize: Size.fromHeight(20.0)
                        
                      ),),
                    ],
                 
                  ),
                ),
              
            ),
          ),
        ],
      ))
    );
  }
}

class MyData extends ChangeNotifier
{
  late double total=0;
  List demo = [];
  void calculateTotal(List demo)
  {
    total=0;
   
    for(var item in demo)
    {
      total+=double.parse(item[2].toString().substring(1));
      //print(total);
    }
    notifyListeners();
   
  }

  //double get total =>_total;



}
