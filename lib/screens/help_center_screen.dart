import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/settings.dart';

class HelpCenterScreen extends StatefulWidget{
  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  List<Settings> help=[];
  

    @override
  void initState() {
    super.initState();

      Future.delayed(const Duration(milliseconds: 500), () {
      // staffProfile();
      helpCenter();
    });
  
  }


    void helpCenter() {
    NetworkManager.shared
        .settings( "getSettings")
        .then((BaseResponse<List<Settings>> response) {
      //  hideLoader();
      setState(() {
      help.clear();
      help.addAll(response.data!);
       
   
      });

        // var privacy = policy.where((element)=>element.stKey=="privacy");
      
    }).catchError((e) {
      //  hideLoader();
      // showFlashMsg(e.toString());
      // print(e);
      // showFlashMsg(e.Message!);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       centerTitle: true,
        title: Text("Help Center"),
         titleTextStyle: TextStyle(fontSize: 18, fontFamily: "Poppins", fontWeight: FontWeight.w700, color: Colors.black),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.black,
            ),
            onPressed: () {

            Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,

    ),
       body: Column(children: [
        //  Padding(
        //   padding: const EdgeInsets.only(top: 50),
        //   child: Row(
        //     children: [
        //       IconButton(
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //           icon: Icon(Icons.arrow_back_ios_new)),
        //       SizedBox(
        //         width: 120,
        //       ),
        //       Center(
        //         child: Text(
        //           "Help Center",
        //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),


        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top:30),
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
              // color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
                child: ListView.builder(
                  itemCount: help.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container( 
                        width: double.infinity,
                       
                decoration: BoxDecoration(
                  //  color: Colors.white, 
                    borderRadius: BorderRadius.circular(5)),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                         if(help[index].stKey=="helpcenter")
                       Padding(
                         padding: const EdgeInsets.only(left:10, right:10),
                         child: 
                          Text(help[index].stValue.toString(), maxLines: 10),
                        //  Html(
                        //             data:
                        //                terms[index].stValue.toString() ,
                        //             style: {
                        //               "body": Style(
                        //                 fontSize: FontSize(15.0),
                        //                 fontFamily: "Poppins",
                        //               ),
                        //             },
                        //             // "Key Features",
                        //             // style: TextStyle(
                        //             //     color: Color(0xff6e706d),
                        //             //     fontSize: 13,
                        //             //     fontWeight: FontWeight.w300),
                        //             // maxLines: 10,
                        //           ),
                       ),
                     ],
                   )
                    );
                  },
                  
                ),
              ),
          ),
        ),
        
       ]),
    );
  }
}