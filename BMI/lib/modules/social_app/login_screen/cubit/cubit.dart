
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/modules/social_app/login_screen/cubit/states.dart';
import 'package:mm/shared/network/remote/dio_helper.dart';

import '../../../../models/shope_app/shope_app.dart';
import '../../../../shared/network/remote/end_points.dart';

ShopeLoginModel? loginModel;

class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitialState());

  static SocialLoginCubit get(context) => BlocProvider.of(context);


  void userLogin({required String email, required String password}) {
    emit(SocialLoginLoadingState());

   FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)
       .then((value) {
     // print(value.user?.email);
     // print(value.user?.uid);

     emit(SocialLoginSuccessState(value.user!.uid));
   }).catchError((error){
     emit(SocialLoginErrorState(error.toString()));
     
   });
  }



  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }
}
