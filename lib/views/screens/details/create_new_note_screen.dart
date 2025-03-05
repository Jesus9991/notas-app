import 'package:flutter/material.dart';

/*
PANTALLA: para crear una nueva nota 
*/
class CreateNewNoteScreen extends StatelessWidget {
  const CreateNewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(''),
      ),
    );
  }
}
