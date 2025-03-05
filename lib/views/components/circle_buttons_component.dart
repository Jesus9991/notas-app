import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
COMPONENTE: manejo del boton con efecto blur, reuzable
*/
class CircleButtonsComponent extends StatelessWidget {
  final IconData icon;
  final double? sizeWidget;
  final Function onTap;
  const CircleButtonsComponent({
    super.key,
    required this.icon,
    this.sizeWidget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;

    return InkWell(
      onTap: () => onTap(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Blur y fondo con gradiente
          ClipRRect(
            borderRadius: BorderRadius.circular(size.width * 0.06),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
              child: Container(
                width: sizeWidget ?? size.width * 0.12,
                height: sizeWidget ?? size.width * 0.12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDarkMode
                      ? PaletteTheme.principal.withAlpha((.2 * 255).toInt())
                      : PaletteTheme.secondary.withAlpha(
                          (.2 * 255).toInt()), // Fondo semitransparente
                ),
              ),
            ),
          ),
          // Icono de búsqueda
          Icon(
            icon,
            color: PaletteTheme.secondary,
            size: size.width * 0.06,
          ),
        ],
      ),
    );
  }
}
