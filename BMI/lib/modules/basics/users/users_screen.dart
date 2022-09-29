
import 'package:flutter/material.dart';

import '../../../models/user/user_model.dart';




class users_screen extends StatelessWidget {

  List<ModelData> users = [
    ModelData(id: 1, name: 'Mohammed Ali', phone: '0114335784'),
    ModelData(id: 2, name: 'Sulaiman Ahmed', phone: '011354654'),
    ModelData(id: 3, name: 'Ahmed Moahemmed ', phone: '0113546784'),
    ModelData(id: 4, name: 'Ali Mohammed', phone: '0114335784'),
    ModelData(id: 5, name: 'Jabeer Adam', phone: '011354654'),
    ModelData(id: 6, name: 'Housan Lias ', phone: '0113546784'),
    ModelData(id: 7, name: 'Mohammed Ali', phone: '0114335784'),
    ModelData(id: 8, name: 'Sulaiman Ahmed', phone: '011354654'),
    ModelData(id: 9, name: 'Ahmed Moahemmed ', phone: '0113546784'),
    ModelData(id: 10, name: 'Ali Mohammed', phone: '0114335784'),
    ModelData(id: 11, name: 'Jabeer Adam', phone: '011354654'),
    ModelData(id: 12, name: 'Housan Lias ', phone: '0113546784'),
  ];

  users_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => contactBuilder(users[index]),
          separatorBuilder:  (context, index) =>  Padding(
            padding: const EdgeInsetsDirectional.only(
              start: 20,
              end: 20
            ),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length,
      ),


    );
  }
  Widget contactBuilder(ModelData users) =>  Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 23,
          child: Text(
            '${users.id}',
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        const SizedBox(width: 20,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              users.name,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            Text(
              users.phone,
              style: const TextStyle(
                color: Colors.grey,
              ),
            )

          ],
        ),

      ],
    ),
  );
  }
