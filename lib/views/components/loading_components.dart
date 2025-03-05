import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
COMPONENTES PARA LOADINGS DE LA AP
*/
class LoadingButtonComponents extends StatelessWidget {
  const LoadingButtonComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final isiOS = Platform.isIOS;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Center(
      child: !isiOS
          ? CircularProgressIndicator(
              backgroundColor:
                  isDarkMode ? PaletteTheme.blackTwo : PaletteTheme.whiteTwo,
              color: isDarkMode ? PaletteTheme.whiteTwo : PaletteTheme.blackTwo,
            )
          : CupertinoActivityIndicator(
              color: isDarkMode ? PaletteTheme.blackTwo : PaletteTheme.whiteTwo,
              radius: 12,
            ),
    );
  }
}

class LoadingComponents extends StatelessWidget {
  const LoadingComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final isiOS = Platform.isIOS;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Center(
      child: !isiOS
          ? CircularProgressIndicator(
              backgroundColor:
                  isDarkMode ? PaletteTheme.blackTwo : PaletteTheme.whiteTwo,
              color: PaletteTheme.whiteTwo,
            )
          : CupertinoActivityIndicator(
              color:
                  isDarkMode ? PaletteTheme.secondary : PaletteTheme.blackTwo,
              radius: 12,
            ),
    );
  }
}
