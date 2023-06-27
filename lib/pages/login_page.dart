import 'package:flutter/material.dart';

import '../Utilities/routes.dart';
class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String name="";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/login_image.png",
            fit: BoxFit.cover,
            height: 300),
            SizedBox(height:20),
            Text("Welcome $name",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            )) ,
            SizedBox(
              height:20,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:16.0,horizontal:32.0),
                child: Column(children:[
                  TextFormField(
                 decoration: InputDecoration(
                  hintText:"Enter Username",
                 labelText:"Username",),
                 onChanged: (value){
                  name=value;
                  setState(() {
                    
                  });
                 }),
                  TextFormField(
                    obscureText: true,
                 decoration: InputDecoration(
                  hintText:"Enter Password",
                 labelText:"Password",),),
                  SizedBox(
                    height:20,),

                    InkWell(
                      onTap: () async {
                       setState ((){changeButton = true;});
                       await Future.delayed(Duration(seconds: 1));
                         Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration:Duration(seconds: 1),
                        width: changeButton?50 : 150,
                        height:50,
                        alignment: Alignment.center,
                        child: changeButton? Icon(Icons.done, color:Colors.white,):
                         Text("login",
                        style: TextStyle(color:Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,)
                        ),
                        decoration: BoxDecoration(
                         // shape: changeButton ? BoxShape.circle :BoxShape.rectangle,
                          color:Colors.deepPurple,
                          borderRadius: BorderRadius.circular(changeButton ?50:8),
                        ),
                      ),
                    ),
                   // ElevatedButton
                    //(child: Text("login"),
                   // style: TextButton.styleFrom(minimumSize: Size(150,40)),
                   // onPressed: () {
                   //   Navigator.pushNamed(context, MyRoutes.homeRoute);
                   // },
                    //)
                ],
               ),
             ),
         ],
          ),
      ),
  );
  }
}
            

     
