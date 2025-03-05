// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';
import 'package:provider/provider.dart';

/*
PANTALLA: Bienvenida al usuario luego de registrarse 
*/
class WelcomeAuthScreen extends StatefulWidget {
  const WelcomeAuthScreen({super.key});

  @override
  State<WelcomeAuthScreen> createState() => _WelcomeAuthScreenState();
}

class _WelcomeAuthScreenState extends State<WelcomeAuthScreen> {
  /*key*/
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GradientBackground(child: Consumer<RegisterAuthProvider>(
      builder: (context, register, child) {
        return Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .04, vertical: size.height * .03),
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              SizedBox(height: size.height * .1),
              //logo
              LogoTitleComponent(isViewLogo: false),
              Text(
                'Tu espacio para organizar ideas, pensamientos y tareas de manera sencilla y eficiente.',
                textAlign: TextAlign.center,
                maxLines: 4,
              ),
              SizedBox(height: size.height * .06),
              //hora de creacion

              _CustomTextComponent(
                title: register.formatDayDate,
                maxline: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              _CustomTextComponent(
                title: register.formatDate,
                maxline: 1,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              //fecha de creacion

              SizedBox(height: size.height * .04),
              //photo
              CircleAvatar(
                radius: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(1000),
                  child: Image.asset(ImagesPath.memojyLogo),
                ),
              ),
              SizedBox(height: size.height * .02),
              //nombre de usuario
              _CustomTextComponent(
                title: register.fullNameController.text,
                maxline: 1,
                style: Theme.of(context).textTheme.headlineMedium!,
              ),
              //correo de usuario
              _CustomTextComponent(
                title: register.emailController.text,
                maxline: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 12),
              ),

              SizedBox(height: size.height * .06),
              //boton para registrarse
              CustomButton(
                text: 'Continuar',
                isLoading: register.isLoading,
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    /*cambio de estado*/
                    register.changeValuesStatus(true);
                    /*verificaion del correo*/
                    await register.sendEmailVerifications();
                    /*peticion para iniciar sesion*/
                    await register.registerUserLoggeo(context);
                    /*cambio de estado*/
                    register.changeValuesStatus(false);
                  }
                },
              ),
              SizedBox(height: size.height * .04),
              //editar datos
              LoginRichTextOnTap(
                title: '¿Deseas editar los datos?',
                subtitle: ' Ir a editar',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    ));
  }
}

class _CustomTextComponent extends StatelessWidget {
  final String title;
  final int maxline;
  final TextStyle style;
  const _CustomTextComponent({
    required this.title,
    required this.maxline,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: style,
    );
  }
}
