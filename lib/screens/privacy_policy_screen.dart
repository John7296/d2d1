import 'package:flutter/material.dart';
import 'package:project_d2d/base/base_stateful_state.dart';
import 'package:project_d2d/connection/network_manager.dart';
import 'package:project_d2d/model/base_response.dart';
import 'package:project_d2d/model/settings.dart';

class PrivacyPolicyScreen extends StatefulWidget{
  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends BaseStatefulState<PrivacyPolicyScreen> {

  List<Settings> policy=[];
  

    @override
  void initState() {
    super.initState();

      Future.delayed(const Duration(milliseconds: 500), () {
      // staffProfile();
      privacypolicy();
    });
  
  }


    void privacypolicy() {
      showLoader();
    NetworkManager.shared
        .settings( "getSettings")
        .then((BaseResponse<List<Settings>> response) {
        hideLoader();
      setState(() {
      policy.clear();
      policy.addAll(response.data!);
       
   
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
        title: Text("Privacy Policy"),
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
        //       Text(
        //         "Privacy Policy",
        //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
               //color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
                child: ListView.builder(
                  itemCount: policy.length,
                  itemBuilder: (BuildContext context, int index){
                    return Container( 
                        width: double.infinity,
                       
                decoration: BoxDecoration(
                   // color: Colors.white, 
                    borderRadius: BorderRadius.circular(5)),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                         if(policy[index].stKey=="privacy")
                       Padding(
                         padding: const EdgeInsets.only(left:10, right:10),
                         child: Text(policy[index].stValue.toString(), maxLines: 10),
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
  
  @override
  bool isAuthenticationRequired() {
    // TODO: implement isAuthenticationRequired
    throw UnimplementedError();
  }
}