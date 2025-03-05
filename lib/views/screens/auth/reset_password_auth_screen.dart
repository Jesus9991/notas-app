import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
PANTALLA Para solicitar cambio de contraseña
*/
class ResetPasswordAuthScreen extends StatelessWidget {
  const ResetPasswordAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GradientBackground(
      child: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .04, vertical: size.height * .03),
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          SizedBox(height: size.height * .06),
          //logo
          LogoTitleComponent(isViewLogo: true),
          SizedBox(height: size.height * .03),

          //inputs-correo
          InputsComponents(
            hintext: 'Ingresar correo electrónico',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            validator: (val) => ValidationInputs.email(val),
            onChanged: (val) {},
          ),

          SizedBox(height: size.height * .03),
          //boton para registrarse
          CustomButton(
            text: 'Continuar',
            isLoading: false,
            onTap: () {
              //Todo: debe registrar al usuario
            },
          ),
          SizedBox(height: size.height * .03),

          LoginRichTextOnTap(
            title: '¿Recuerdas tu contraseña?',
            subtitle: ' Iniciar sesión',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
