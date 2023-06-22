import 'package:flutter/material.dart';

import '../Utilities/routes.dart';
class loginpage extends StatefulWidget {
  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  String name="";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  movetohome(BuildContext) async {
    if(_formKey.currentState!.validate()){
                           setState ((){changeButton = true;});
                           await Future.delayed(Duration(seconds: 1));
                             await Navigator.pushNamed(context, MyRoutes.homeRoute);
                             setState ((){changeButton = false;});
                          }
                          }

  
  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key :_formKey,
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
                   validator: (value){
                    if(value?.isEmpty ?? true){
                      return "username cannot be empty";
                    }
                    return null;
                   },
                   onChanged: (value){
                    name=value;
                    setState(() {
                      
                    });
                   }),
                    TextFormField(
                      obscureText: true,
                   decoration: InputDecoration(
                    hintText:"Enter Password",
                   labelText:"Password",),
                   validator : (value) {
                    if (value?.isEmpty ?? true){
                      return "password  cannot be empty";
                    }
                    else if (value!.length < 6){
                      return "password  cannot be less than 6 letters";
                    }
                    return null;
                   },),
                    SizedBox(
                      height:20,),
        
                     Material(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(changeButton ?50:8),
                            
                       child: InkWell(
                      
                          onTap: () => movetohome(context),
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
      ),
  );
  }
}
