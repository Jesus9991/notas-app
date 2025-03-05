import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
efecto blur para los modals
*/
class BackDropFilterBlurComponents extends StatelessWidget {
  final double height;
  final Widget child;
  const BackDropFilterBlurComponents({
    super.key,
    required this.height,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        height: height,
        width: size.width,
        decoration: BoxDecoration(
          color: isDarkMode ? PaletteTheme.principal : PaletteTheme.secondary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(RoundersBorderTheme.rounderbuttons),
            topRight: Radius.circular(RoundersBorderTheme.rounderbuttons),
          ),
        ),
        child: child,
      ),
    );
  }
}
