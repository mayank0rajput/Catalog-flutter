import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget{
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool changeButton = false;
  String name = "";
  void moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
    }
    final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context){
    return Material(
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login_image.png",
                fit: BoxFit.cover
              ),
              SizedBox(height: 10.0),
              Text("Welcome $name",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Username",
                        labelText: "Username",
                        hintStyle: TextStyle(color: Colors.black26),
                      ),
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Username cannot be empty.d";
                        }
                        return null;
                      },
                      onChanged: (value){
                        name = value;
                        setState(() {
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                        hintStyle: TextStyle(color: Colors.black26),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password cannot be empty";
                        }else if(value!.length<6){
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: (changeButton ? 50 : 150),
                      height: 50,
                      alignment: Alignment.center,
                      child: changeButton? Icon(
                        Icons.done,
                        color: Colors.white,
                      ) : Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}