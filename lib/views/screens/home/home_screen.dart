import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';
import 'package:provider/provider.dart';

/*
pantalla para el home de la aplicacion
*/
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<LoginAuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body: Center(
        child: CustomButton(
          text: 'Cerrar sesion',
          isLoading: false,
          onTap: () async {
            await auth.closeSesionAuth(context);
          },
        ),
      ),
    );
  }
}
