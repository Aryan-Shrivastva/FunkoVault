import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
    setState(() {
      changeButton = true;
    });
                 
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(
    context, MyRoutes.homeRoute);
    setState(() {
    changeButton = false;
    });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/mello.png",
               fit: BoxFit.cover,
               ),
               SizedBox(height: 20.0,
               ),
               Text( "Welcome $name",
               style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
               ),
               ),
               SizedBox(height: 20.0,
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                 child: Column(
                  children: [
                  TextFormField(
                  decoration: InputDecoration(
                    hintText: " Enter Username",
                    labelText: "Username",
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Username cannot be empty";
                    }
                    return null;
                  },
                  onChanged: (value){
                    name = value;
                    setState(() {});
                   },
                  ),
                  TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: " Enter password",
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Password cannot be empty";
                    }
                    else if(value.length < 6){
                      return "Password length should be atleast 6";
                    }
                    return null;
                  },
                 ),
                    SizedBox(height: 40.0,
                   ),
          
                  Material(
                color: Theme.of(context).hintColor,
                borderRadius: BorderRadius.circular(changeButton? 50:10),
                 child: InkWell(
                  onTap: () => moveToHome(context),
                   child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    width: changeButton? 50: 150,
                    height: 50,
                    alignment: Alignment.center,
                        
                    child: changeButton ? Icon(
                      Icons.done,
                       color: Colors.white,)
                       : Text(
                      "Login", 
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        fontSize: 10 ),
                        ),
                   ),
                 ),
               ),
          
          
          
              //  ElevatedButton(
              //   style: TextButton.styleFrom(minimumSize: Size(120,40)),
              //   onPressed:() {
              //     Navigator.pushNamed(context, MyRoutes.homeRoute);
              //   },
              //   child: Text("Login"),
              //   ),
                 ],
                 ),
               )
            ],
          ),
        ),
      )
    );
  }
}