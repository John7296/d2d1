import 'package:flutter/material.dart';
import 'package:project_d2d/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget{
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
   final GlobalKey<FormState> _form = GlobalKey<FormState>();

      final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    body: SingleChildScrollView(child:
    Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
              ],
            ),
          ),

          Container(
              height: 80,
              width: 190,
              child: Image(
                image: AssetImage("assets/images/logo-d2d.png"),
                fit: BoxFit.contain,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  Text(
                    "Registration  👍🏻",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  ),
                
                
                ],
              ),
            ),

             Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                children: [
                  Text(
                    "Let's Register. More features ahead!",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffAFB0B6)),
                  ),
                ],
              ),
            ),

            Form(
              key: _form,
              child: Column(children: [
                Padding(
                      padding: const EdgeInsets.only(left: 20, top: 40, right: 20),
                      child: TextFormField(
                        //  controller: _usernameController,
                        //     validator: (val) {
                        //       if (val!.isEmpty) return "Enter E-mail or Phone Number";
                        //       return null;
                        //     },
                          decoration: InputDecoration(
                        contentPadding: EdgeInsets.
                            //only(left:10, top:5, bottom:5),
                            symmetric(vertical: 20, horizontal: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffAFB0B6),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: "  Full Name",
                        labelStyle:
                            TextStyle(color: Color(0xffAFB0B6), fontWeight:FontWeight.w500,fontSize: 15),
                      )),
                    ),

                     Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: TextFormField(
                        //  controller: _usernameController,
                        //     validator: (val) {
                        //       if (val!.isEmpty) return "Enter E-mail or Phone Number";
                        //       return null;
                        //     },
                          decoration: InputDecoration(
                        contentPadding: EdgeInsets.
                            //only(left:10, top:5, bottom:5),
                            symmetric(vertical: 20, horizontal: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffAFB0B6),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: "  E-mail",
                        labelStyle:
                            TextStyle(color: Color(0xffAFB0B6), fontWeight:FontWeight.w500,fontSize: 15),
                      )),
                    ),

                     Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: TextFormField(
                        //  controller: _usernameController,
                        //     validator: (val) {
                        //       if (val!.isEmpty) return "Enter E-mail or Phone Number";
                        //       return null;
                        //     },
                          decoration: InputDecoration(
                        contentPadding: EdgeInsets.
                            //only(left:10, top:5, bottom:5),
                            symmetric(vertical: 20, horizontal: 10),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffAFB0B6),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        labelText: "  Phone Number",
                        labelStyle:
                            TextStyle(color: Color(0xffAFB0B6), fontWeight:FontWeight.w500,fontSize: 15),
                      )),
                    ),



                    Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.
                                //only(left:10, top:5, bottom:5),
                                symmetric(vertical: 20, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xffAFB0B6)),
                            ),
                            labelText: "  Password",
                            labelStyle:
                                TextStyle(color: Color(0xffAFB0B6), fontWeight:FontWeight.w500,fontSize: 15),

                                suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xffCACBCE),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            // suffixIcon: Padding(
                            //   padding: const EdgeInsets.only(right: 20),
                            //   child: Icon(
                            //     Icons.visibility,
                            //     color: Color(0xffCACBCE),
                            //   ),
                            // )
                            
                            ),
                            obscureText: _obscureText,
                          controller: _passwordController,
                          validator: (val) {
                            if (val!.isEmpty) return "Enter your password";
                            return null;
                          }
                            ),
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.
                                //only(left:10, top:5, bottom:5),
                                symmetric(vertical: 20, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Color(0xffAFB0B6)),
                            ),
                            labelText: "  Confirm Password",
                            labelStyle:
                                TextStyle(color: Color(0xffAFB0B6), fontWeight:FontWeight.w500,fontSize: 15),

                                suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Color(0xffCACBCE),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            // suffixIcon: Padding(
                            //   padding: const EdgeInsets.only(right: 20),
                            //   child: Icon(
                            //     Icons.visibility,
                            //     color: Color(0xffCACBCE),
                            //   ),
                            // )
                            
                            ),
                            obscureText: _obscureText,
                          controller: _passwordController,
                          validator: (val) {
                            if (val!.isEmpty) return "Enter your password";
                            return null;
                          }
                            ),
                  ),


                   Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Container(
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFD425B),
                        ),
                        onPressed: () {
                  
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) {
        return LoginScreen();
      },),(route) => false);
                        },
                        child: Center(
                            child: Text(
                          "Register",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )),
                      ),
                    ),
                  ),


                  Center(
                      child: Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account?",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffAFB0B6)),
                        ),

                        TextButton(onPressed: 
                        (){}, child: 
                        Text("Login", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFD425B)),
                        
                        ))
                      ],
                    ),
                  ))
              ],),
            )
      ],

    ),
    ),
  ),

);

  }
}