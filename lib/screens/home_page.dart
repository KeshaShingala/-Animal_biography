
import 'package:flutter/material.dart';

import '../helpers/helper.dart';
import '../modals/data_modal.dart';


class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  late Future getData;

  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.grey.shade200,
       leading: Icon(Icons.clear_all_outlined,color: Colors.black,size: 40,),
       actions: [
         Icon(Icons.keyboard_voice_outlined,color: Colors.black,size: 40,)
       ],
     ),
      body: SingleChildScrollView(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Discover",style: TextStyle(color: Colors.black,fontSize: 34,fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Animals",style: TextStyle(color: Colors.black,fontSize: 45,fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search,color: Colors.black,),
                  hintText: "Enter Animal Name...",
                  hintStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(90),borderSide: BorderSide(color: Colors.white)),
                ),
                onChanged: (val) {
                  setState(() {
                      getData = DBHelper.dbHelper.fetchSearchData(name: val);
                  });
                },
              ),
            ),
            SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Container(
                    height: 50,
                    width: 120,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0XFFc19e82),
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("Categories",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("name",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("Fileds",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("Forest",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                  SizedBox(width: 15,),
                  Container(
                    height: 50,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Text("Location",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
            ),


            SizedBox(width: 15,),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: Animaldata.animallist
                    .map(
                      (e) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        "secondpage", arguments: e,);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: 380,
                            width: 300,
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://source.unsplash.com/random/?$e",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.20),
                                    offset: const Offset(0, 0),
                                    blurRadius: 5,
                                    spreadRadius: 3,
                                  )
                                ]),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text("$e",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
                        ],
                      ),
                    ),
                  ),
                )
                    .toList(),
            ),
          ),
        ),

          ],
        ),
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
