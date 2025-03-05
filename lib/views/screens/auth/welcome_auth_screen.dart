import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
PANTALLA: Bienvenida al usuario luego de registrarse 
*/
class WelcomeAuthScreen extends StatelessWidget {
  const WelcomeAuthScreen({super.key});

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
          title: 'Lunes,  10:00 am',
          maxline: 1,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        _CustomTextComponent(
          title: 'Marzo 03, 2025',
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
          title: 'Fernando Gutiérrez',
          maxline: 1,
          style: Theme.of(context).textTheme.headlineMedium!,
        ),
        //correo de usuario
        _CustomTextComponent(
          title: 'fernando.gutierrez@example.com',
          maxline: 1,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 12),
        ),

        SizedBox(height: size.height * .06),
        //boton para registrarse
        CustomButton(
          text: 'Continuar',
          isLoading: false,
          onTap: () {
            //Todo: debe registrar al usaurio y navegar al homr
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
