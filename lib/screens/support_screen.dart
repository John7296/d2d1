import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/settings.dart';

class SupportScreen extends StatefulWidget{
  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends BaseStatefulState<SupportScreen> {
   List<Settings> support=[];
  

    @override
  void initState() {
    super.initState();

      Future.delayed(const Duration(milliseconds: 500), () {
      // staffProfile();
     supportPage();
    });
  
  }


    void supportPage() {
      showLoader();
    NetworkManager.shared
        .settings( "getSettings")
        .then((BaseResponse<List<Settings>> response) {
        hideLoader();
      setState(() {
      support.clear();
      support.addAll(response.data!);
       
   
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

       body: Column(children: [
         Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new)),
              SizedBox(
                width: 120,
              ),
              Center(
                child: Text(
                  "Support",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),


        Expanded(
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
             color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: ListView.builder(
                itemCount: support.length,
                itemBuilder: (BuildContext context, int index){
                  return Container( 
                      width: double.infinity,
                     
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                       if(support[index].stKey=="helpcenter")
                     Padding(
                       padding: const EdgeInsets.only(left:10, right:10),
                       child: 
                        Text(support[index].stValue.toString(), maxLines: 10),
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
        
       ]),
    );
  }
  
  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}