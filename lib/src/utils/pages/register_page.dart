
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stocks_app/services/auth_service.dart';
import 'package:stocks_app/src/common_widgets/my_button.dart';
import 'package:stocks_app/src/common_widgets/my_textfield.dart';
import 'package:stocks_app/src/common_widgets/square_tile.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key,
    required this.onTap
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
    //sign user up method
    void signUserUp() async{
      //show a loading circle

      showDialog(context: context, builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
      //try sign up
      //check if password and confirm password are same

      try{
        if(passwordController.text==confirmPasswordController.text) {
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
        }else{
            showErrorMessage("Passwords doesnt match !!");
        }
        Navigator.pop(context);
      } on FirebaseAuthException catch (e){
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

                const SizedBox(height: 25),
                //logo
                const Icon(
                  Icons.lock,
                  size: 35,
                ),
                const SizedBox(height: 25.0,),

                //welcome back, you have been missed
                Text('Let\'s create an account for you :)',
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
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'confirm password',
                  obscureText: true,
                ),

                const SizedBox(height: 10,),
                //forgot password option

                const SizedBox(height: 10,),
                //sign in button
                MyButton(
                  onTap:  signUserUp,
                  text: "Sign Up",
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


                const SizedBox(height: 25.0,),
                //google or apple sign in buttons
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      onTap: () => AuthService().signInWithGoogle(),
                      imagePath: 'lib/src/images/google.png',height: 60,),
                    SizedBox(width: 10.0,),
                    SquareTile(
                      onTap: (){},
                      imagePath: 'lib/src/images/appple.png',height: 60,),
                  ],
                ),

                const SizedBox(height: 25.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ALready have an account ??'),
                    SizedBox(width: 10.0,),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text('Login Now !!',
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
