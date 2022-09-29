


import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mm/models/social_app/social_app_model.dart';

import '../../../../../shared/network/remote/dio_helper.dart';
import '../../../../../shared/network/remote/end_points.dart';
import 'states.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterStates> {
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(
      {
         String? name,
         String? email,
         String? password,
         String? phone,
      }
      ) {
    emit(SocialRegisterLoadingState());
    
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email!, password:password! )
        .then((value){
          print(value.user?.email);
          print(value.user?.uid);
          userCreate(
            name: name,
            email: email,
            uId: value.user?.uid,
            phone: phone,
          );
    }).catchError((error){
      emit(SocialRegisterErrorState(error.toString()));
    });
   
  }

  void userCreate(
      {
        String? name,
        String? email,
        String? phone,
        String? uId,
      }
      ){
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uId: uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance.collection('users').doc(uId).set(model.toMap()).then((value) {
      emit(SocialCreateSuccessState());
    }).catchError((error){
      emit(SocialCreateErrorState(error.toString()));
    });

  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordVisibilityState());
  }
}
