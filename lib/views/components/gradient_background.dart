import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
GRADIENTE: effecto gradiante reutilizable en toda la app
*/
class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            /*fondo que se verá afectado por el desenfoque */
            Positioned(
              left: size.width * .46,
              child: Container(
                alignment: Alignment.topRight,
                height: size.height * 0.4,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      PaletteTheme.pink,
                      PaletteTheme.purple,
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * .2,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      PaletteTheme.principal.withAlpha((0.0 * 255).toInt()),
                      PaletteTheme.secondary.withAlpha((0.1 * 255).toInt()),
                    ],
                  ),
                ),
              ),
            ),
            /*efecto de desenfoque */
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
                child: Container(
                  color: isDarkMode
                      ? PaletteTheme.principal.withAlpha((0.2 * 255).toInt())
                      : PaletteTheme.secondary.withAlpha((0.2 * 255).toInt()),
                ),
              ),
            ),

            /*contenido principal del widget */
            child,
          ],
        ),
      ),
    );
  }
}

class GradientTwoBackground extends StatelessWidget {
  final Widget child;

  const GradientTwoBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            /*fondo que se verá afectado por el desenfoque */
            Positioned(
              left: size.width * .46,
              child: Container(
                alignment: Alignment.topRight,
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      PaletteTheme.pink,
                      PaletteTheme.purple,
                    ],
                  ),
                ),
              ),
            ),
            /*segundo fondo*/
            Positioned(
              bottom: size.height * .01,
              right: size.width * .46,
              child: Container(
                alignment: Alignment.bottomLeft,
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      PaletteTheme.pink,
                      PaletteTheme.purple,
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * .2,
                width: size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      PaletteTheme.principal.withAlpha((0.0 * 255).toInt()),
                      PaletteTheme.secondary.withAlpha((0.1 * 255).toInt()),
                    ],
                  ),
                ),
              ),
            ),
            /*efecto de desenfoque */
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
                child: Container(
                  color: isDarkMode
                      ? PaletteTheme.principal.withAlpha((0.2 * 255).toInt())
                      : PaletteTheme.secondary.withAlpha((0.2 * 255).toInt()),
                ),
              ),
            ),

            /*contenido principal del widget */
            child,
          ],
        ),
      ),
    );
  }
}
