import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/settings.dart';

class AboutScreen extends StatefulWidget{
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends BaseStatefulState<AboutScreen> {
  List<Settings> about=[];
  

    @override
  void initState() {
    super.initState();

      Future.delayed(const Duration(milliseconds: 500), () {
      // staffProfile();
      aboutPage();
    });
  
  }


    void aboutPage() {
      showLoader();
    NetworkManager.shared
        .settings( "getSettings")
        .then((BaseResponse<List<Settings>> response) {
        hideLoader();
      setState(() {
      about.clear();
      about.addAll(response.data!);
       
   
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
                  "About",
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
                itemCount: about.length,
                itemBuilder: (BuildContext context, int index){
                  return Container( 
                      width: double.infinity,
                     
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                       if(about[index].stKey=="about")
                     Padding(
                       padding: const EdgeInsets.only(left:10, right:10),
                       child: 
                        Text(about[index].stValue.toString(), maxLines: 10),
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