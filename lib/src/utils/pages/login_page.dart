
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stocks_app/services/auth_service.dart';
import 'package:stocks_app/src/common_widgets/my_button.dart';
import 'package:stocks_app/src/common_widgets/my_textfield.dart';
import 'package:stocks_app/src/common_widgets/square_tile.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  LoginPage({super.key,
  required this.onTap
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method


  @override
  Widget build(BuildContext context) {
    //error msg
    void showErrorMessage(String message){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          backgroundColor: Colors.indigoAccent,
          title: Center(
            child: Text(message,
            style: const TextStyle(
              color: Colors.white,
            ),),
          ),
        );
      });
    }
    //sign user in method
    void signUserIn() async{
      //show a loading circle
      showDialog(context: context, builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
      //try sign in
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        print('try');
        Navigator.pop(context);
      } on FirebaseAuthException catch (e){
        print('1');
        Navigator.pop(context);
        showErrorMessage(e.code);
      }
    }
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 50),
                //logo
                const Icon(
                  Icons.lock,
                    size: 100,
                ),
                const SizedBox(height: 50,),

                //welcome back, you have been missed
                Text('Welcome back you\'ve been missed :)',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25,),

                //username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email Id',
                  obscureText: false,
                ),

                //password text filed
                 const SizedBox(height: 10,),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10,),
                //forgot password option
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot password ??',
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),),
                    ],
                  ),
                ),

                const SizedBox(height: 10,),
                //sign in button
                MyButton(
                  onTap:  signUserIn,
                  text: "Sign In",
                ),

                const SizedBox(height: 20.0,),
                //continue with
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text("Or continue with",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey.shade700,
                      ),),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 50.0,),
                //google or apple sign in buttons
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'lib/src/images/google.png',height: 60,
                      onTap: () => AuthService().signInWithGoogle(),
                    ),
                    SizedBox(width: 10.0,),
                    SquareTile(
                      onTap: (){},
                      imagePath: 'lib/src/images/appple.png',height: 60,
                    ),
                  ],
                ),

                const SizedBox(height: 50.0,),

                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member yet ?'),
                    SizedBox(width: 10.0,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Register Now !!',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),

                  ],

                )
                //not a member yet ? Register now!!
              ],


            ),
          ),
        ),
      ),
    );


  }
}
