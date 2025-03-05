import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';
import 'package:provider/provider.dart';

/*
pantalla para el inicio de sesion
*/
class LoginAuthScreen extends StatefulWidget {
  const LoginAuthScreen({super.key});

  @override
  State<LoginAuthScreen> createState() => _LoginAuthScreenState();
}

class _LoginAuthScreenState extends State<LoginAuthScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final registerPrv = Provider.of<RegisterAuthProvider>(context);
    final resetPrv = Provider.of<ResetPasswordProvider>(context);
    final socialPrv = Provider.of<SocialNetworkProvider>(context);
    return GradientBackground(
      child: FadeInComponent(
        child: Form(
          key: formKey,
          child: Consumer<LoginAuthProvider>(
            builder: (context, auth, child) {
              return ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .04, vertical: size.height * .03),
                physics: const BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                children: [
                  SizedBox(height: size.height * .06),
                  //logo
                  LogoTitleComponent(isViewLogo: true),
                  SizedBox(height: size.height * .03),
                  //inputs-correo
                  InputsComponents(
                    hintext: 'Ingresar correo electrónico',
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    controller: auth.emailController,
                    validator: (val) => ValidationInputs.email(val),
                    onChanged: (val) => auth.setEmailController(val),
                  ),
                  SizedBox(height: size.height * .03),
                  //iputs-contraseña
                  InputPasswordComponent(
                    hintext: 'Ingresar contraseña',
                    controller: auth.passwordController,
                    validator: (val) => ValidationInputs.password(val),
                    onChanged: (val) => auth.setPasswordController(val),
                  ),
                  //olvide mi contraseña
                  SizedBox(height: size.height * .01),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        /*limpia el provider */
                        resetPrv.cleanAllProvider();
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
                    isLoading: auth.isLoading,
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        /*cambio de estado*/
                        auth.changeValuesStatus(true);
                        /*peticion para iniciar sesion*/
                        await auth.postSesionLoggeoUser(context);
                        /*cambio de estado*/
                        auth.changeValuesStatus(false);
                      }
                    },
                  ),
                  SizedBox(height: size.height * .03),
                  LineRowComponent(title: 'O inicia sesión con'),
                  SizedBox(height: size.height * .03),
                  //inicio de sesion con google
                  SocialNetworkComponent(
                    title: 'Inicia sesión con Google',
                    icon: ImagesPath.googleLogo,
                    isLoading: socialPrv.isLoadingForGoogle,
                    onTap: () async {
                      socialPrv.changeLoadingForGoogle(true);
                      /*sesion con GOOGLE*/
                      await socialPrv.signInWithGoogle(context);
                      socialPrv.changeLoadingForGoogle(false);
                    },
                  ),
                  //registrarse
                  SizedBox(height: size.height * .03),

                  LoginRichTextOnTap(
                    title: '¿Aún no tienes una cuenta?',
                    subtitle: ' Registrarse',
                    onTap: () {
                      /*limpia el provider */
                      registerPrv.cleanAllProvider();
                      /*navega al registro */
                      Navigator.pushNamed(
                        context,
                        MainRoutes.registerScreenRoute,
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
