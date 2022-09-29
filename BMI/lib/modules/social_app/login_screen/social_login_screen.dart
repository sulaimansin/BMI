import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/modules/social_app/login_screen/cubit/states.dart';
import 'package:mm/modules/social_app/register/cubit/states.dart';
import 'package:mm/shared/components/components.dart';

import '../../../shared/components/constants.dart';
import '../../../shared/network/local/cache_helper.dart';
import '../home/social_home_screen.dart';
import '../register/social_register_screen.dart';
import 'cubit/cubit.dart';

class SocialLoginScreen extends StatelessWidget {
var formKey = GlobalKey<FormState>();
var emailController = TextEditingController();
var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit , SocialLoginStates>(
        listener: (context, state){
          if(state is SocialCreateSuccessState ){
            navigateAndFinish(context, SocialHomeScreen());
          }

          if(state is SocialLoginSuccessState){
            CacheHelper.saveData(kye: 'uId', value: state.uId)?.then((value) {

              navigateAndFinish(context, SocialHomeScreen());
            });
          }


        },
        builder: (context, state){
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Login now to communicate with friends',
                          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              color: Colors.grey
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          validate: (value){
                            if(value!.isEmpty){
                              return 'Email must not be empty';
                            }
                            return null;
                          },
                          label:'Email Address',
                          prefixIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          suffixIcon:SocialLoginCubit.get(context).suffix,
                          obscureText: SocialLoginCubit.get(context).isPassword,
                          suffixPress: (){
                            SocialLoginCubit.get(context).changePasswordVisibility();
                          },
                          onSubmit: (value){
                            if(formKey.currentState!.validate()){
                            SocialLoginCubit.get(context).userLogin(email: emailController.text, password:passwordController.text);
                            }
                          },
                          validate: (value){
                            if(value!.isEmpty){
                              return 'Password is too short';
                            }
                            return null;
                          },
                          label:'Password',
                          prefixIcon: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: state is! SocialLoginLoadingState,
                          builder: (context)=>defaultButton(
                            function: (){
                              if(formKey.currentState!.validate()){
                                SocialLoginCubit.get(context).userLogin(email: emailController.text, password:passwordController.text);
                              }
                            },
                            buttonText: 'LOGIN',
                          ),
                          fallback:(context)=> Center(child: CircularProgressIndicator()),
                        ),

                        SizedBox(
                          height: 15,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?"),
                            TextButton(onPressed: (){
                              navigateTo(context, SocialRegisterScreen());
                            },
                              child: Text('REGISTER'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },

      ),
    );
  }
}
