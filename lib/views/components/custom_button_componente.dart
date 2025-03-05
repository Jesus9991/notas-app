/*
componente para el boton de la app global
*/
import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Function onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.isLoading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      width: size.width,
      height: size.height * .07,
      decoration: BoxDecoration(
        color: isDarkMode ? PaletteTheme.secondary : PaletteTheme.principal,
        borderRadius: BorderRadius.circular(15),
      ),
      child: isLoading == true
          ? Center(
              child: LoadingButtonComponents(),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: PaletteTheme.transparent,
                elevation: 0,
                textStyle: FontsTheme.typeFont.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: PaletteTheme.secondary),
                backgroundColor: isDarkMode
                    ? PaletteTheme.secondary
                    : PaletteTheme.principal,
                foregroundColor: isDarkMode
                    ? PaletteTheme.principal
                    : PaletteTheme.secondary, // Color de las letras
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () => onTap(),
              child: Text(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: FontsTheme.typeFont.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  // color: PaletteTheme.secondary,
                ),
              ),
            ),
    );
  }
}
