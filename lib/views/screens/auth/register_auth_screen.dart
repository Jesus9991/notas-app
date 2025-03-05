import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
PANTALLA: registro de usuario
*/
class RegisterAuthScreen extends StatelessWidget {
  const RegisterAuthScreen({super.key});

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
            hintext: 'Ingresar nombre y apellido',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            validator: (val) => ValidationInputs.inputEmpty(val),
            onChanged: (val) {},
          ),
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
          //iputs-contraseña
          InputPasswordComponent(
            hintext: 'Ingresar contraseña',
            validator: (val) => ValidationInputs.password(val),
            onChanged: (val) {},
          ),

          SizedBox(height: size.height * .03),
          //boton para registrarse
          CustomButton(
            text: 'Registrarse',
            isLoading: false,
            onTap: () {
              //Todo: debe navegar a la pantalla de bienvenida
              Navigator.pushNamed(
                context,
                MainRoutes.welcomeScreenRoute,
              );
            },
          ),
          SizedBox(height: size.height * .03),

          LoginRichTextOnTap(
            title: '¿Ya tienes una cuenta?',
            subtitle: ' Iniciar sesión',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
