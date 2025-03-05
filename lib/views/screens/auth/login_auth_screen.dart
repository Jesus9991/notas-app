import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
pantalla para el inicio de sesion
*/
class LoginAuthScreen extends StatelessWidget {
  const LoginAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GradientBackground(
      child: FadeInComponent(
        child: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .04, vertical: size.height * .03),
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: [
            SizedBox(height: size.height * .06),
            //logo
            LogoTitleComponent(),
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
            //olvide mi contraseña
            SizedBox(height: size.height * .01),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  /*navega a olvide mi contraseña*/
                  Navigator.pushNamed(
                    context,
                    MainRoutes.resetPasswordScreenRoute,
                  );
                },
                child: Text(
                  'Olvidé mi contraseña',
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(height: size.height * .01),
            //boton para sesion
            CustomButton(
              text: 'Iniciar sesión',
              isLoading: false,
              onTap: () {
                //Todo: debe iniciar la sesion del usuario
              },
            ),
            SizedBox(height: size.height * .03),
            LineRowComponent(title: 'O inicia sesión con'),
            SizedBox(height: size.height * .03),
            //inicio de sesion con google
            SocialNetworkComponent(
              title: 'Inicia sesión con Google',
              icon: ImagesPath.googleLogo,
              isLoading: false,
              onTap: () {
                //Todo: debe iniciar sesion con Google
              },
            ),
            //registrarse
            SizedBox(height: size.height * .03),

            LoginRichTextOnTap(
              title: '¿Aún no tienes una cuenta?',
              subtitle: ' Registrarse',
              onTap: () {
                //Todo: debe llevar al registro
                Navigator.pushNamed(
                  context,
                  MainRoutes.registerScreenRoute,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
