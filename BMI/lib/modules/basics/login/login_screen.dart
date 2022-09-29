import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';



class login_screen extends StatefulWidget {
  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    label: 'Email Address',
                    textInputType: TextInputType.emailAddress,
                    controller: emailController,
                    prefixIcon: Icons.email,
                    validate: (value){
                      if(value!= null && value.isEmpty){
                        return 'Email must not be empty';
                      }
                      return null;
                    }
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                      label: 'Password',
                      textInputType: TextInputType.visiblePassword,
                      controller: passwordController,
                      prefixIcon: Icons.lock,
                      suffixIcon: obscureText ?Icons.visibility: Icons.visibility_off,
                      obscureText: obscureText,
                      suffixPress: (){
                        setState((){
                          obscureText =!obscureText;
                        });

                      },
                      validate: (value){
                        if(value!= null && value.isEmpty){
                          return 'Password mut not be empty';
                        }
                        return null;
                      }
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      buttonText: 'login',
                      function: () {
                        if (formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                    function: () {
                      if (formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    buttonText: 'reGIstEr',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Register now'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
