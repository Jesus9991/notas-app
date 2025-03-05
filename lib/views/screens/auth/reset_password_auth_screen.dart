import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';
import 'package:provider/provider.dart';

/*
PANTALLA Para solicitar cambio de contraseña
*/
class ResetPasswordAuthScreen extends StatefulWidget {
  const ResetPasswordAuthScreen({super.key});

  @override
  State<ResetPasswordAuthScreen> createState() =>
      _ResetPasswordAuthScreenState();
}

class _ResetPasswordAuthScreenState extends State<ResetPasswordAuthScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GradientBackground(child: Consumer<ResetPasswordProvider>(
      builder: (context, auth, child) {
        return Form(
          key: formKey,
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
                autocorrect: false,
                controller: auth.emailController,
                validator: (val) => ValidationInputs.email(val),
                onChanged: (val) => auth.setEmailController(val),
              ),

              SizedBox(height: size.height * .03),
              //boton para registrarse
              CustomButton(
                text: 'Continuar',
                isLoading: auth.isLoading,
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    /*cambio de estado*/
                    auth.changeValuesStatus(true);
                    /*peticion para iniciar sesion*/
                    await auth.resetPasswordUser(context);
                  }
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
      },
    ));
  }
}
