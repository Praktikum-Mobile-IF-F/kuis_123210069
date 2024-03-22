import 'package:flutter/material.dart';
import 'package:kuisprakmobile/home_page.dart';

class Loginpage extends StatefulWidget {
  // final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  const Loginpage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(
          children: [
            Text("LOGIN"),
            _usernameField(),
            _passwordField(),
            _loginButton(context)
          ],
        ),
      ),
    );
  }

  Widget _usernameField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.deepOrange)
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: (isLoginSuccess ? Colors.green : Colors.red))
          )
        ),
      ),
    );
  }
  Widget _passwordField(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.all(10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.deepOrange)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: (isLoginSuccess ? Colors.green : Colors.red))
            )
        ),
      ),
    );
  }
  Widget _loginButton(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: (isLoginSuccess) ? Colors.green : Colors.red,
        ),
          onPressed: (){
            String text = "";
            if(username == "ahnaf" && password == "123210069"){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder : (context)=> Homepage())
              );
              setState(() {
                text = "Login Success";
                isLoginSuccess = true;
              });
            } else {
              setState(() {
                text = "Login Success";
                isLoginSuccess = true;
              });
            }
            print("isLoginSuccess : $isLoginSuccess");
            SnackBar snackBar = SnackBar(
              content: Text(text),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child:const Text('Login'),
        ),
    );
  }
}