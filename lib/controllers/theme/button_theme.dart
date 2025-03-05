import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notas_app/controllers/exports/exports.dart';

class ButtonsTheme {
  /*tipo de fuente */
  static TextStyle typeFont = GoogleFonts.inter();

  //: textos para el modo claro
  static ElevatedButtonThemeData elevatedButtonLight = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: PaletteTheme.transparent,
          elevation: 20,
          textStyle: typeFont.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteTheme.principal),
          foregroundColor: PaletteTheme.secondary, //color de las letras */
          backgroundColor: PaletteTheme.principal, //color del boton */
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(RoundersBorderTheme.rounderbuttons))));
  //
  static OutlinedButtonThemeData outlinedButtonLight = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PaletteTheme.principal,
      ),
      backgroundColor: PaletteTheme.transparent,
      surfaceTintColor: PaletteTheme.transparent,
      disabledBackgroundColor: PaletteTheme.principal,
      disabledForegroundColor: PaletteTheme.principal,
      elevation: 0,
      shadowColor: PaletteTheme.transparent,
      side: const BorderSide(color: PaletteTheme.principal),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RoundersBorderTheme.rounderbuttons),
        side:
            const BorderSide(color: PaletteTheme.principal), // Color del borde
      ),
    ),
  );
  //
  static TextButtonThemeData textButtonLight = TextButtonThemeData(
      style: TextButton.styleFrom(
    shadowColor: PaletteTheme.principal.withAlpha((0.5 * 255).toInt()),
    elevation: 0,
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: PaletteTheme.principal),
    foregroundColor: PaletteTheme.principal,
  ));

  static IconButtonThemeData iconButtonLight = IconButtonThemeData(
      style: ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    shadowColor: WidgetStatePropertyAll(
        PaletteTheme.principal.withAlpha((0.5 * 255).toInt())),
    foregroundColor: const WidgetStatePropertyAll(
        PaletteTheme.principal), //color de las letras */

    iconSize: WidgetStateProperty.all(25),
    iconColor: WidgetStateProperty.all(PaletteTheme.principal),
  ));
  //: textos para el modo oscuro

  static OutlinedButtonThemeData outlinedButtonDark = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PaletteTheme.principal),
    backgroundColor: PaletteTheme.transparent,
    surfaceTintColor: PaletteTheme.transparent,
    disabledBackgroundColor: PaletteTheme.blackTwo,
    disabledForegroundColor: PaletteTheme.blackTwo,
    elevation: 0,
    shadowColor: PaletteTheme.transparent,
    side: const BorderSide(color: PaletteTheme.principal),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(RoundersBorderTheme.rounderbuttons),
      side: const BorderSide(color: PaletteTheme.principal), // Color del borde
    ),
  ));
  static ElevatedButtonThemeData elevatedButtonDark = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          shadowColor: PaletteTheme.transparent,
          textStyle: typeFont.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: PaletteTheme.secondary),
          foregroundColor: PaletteTheme.secondary, //color de las letras */
          backgroundColor: PaletteTheme.secondary, //color del boton */
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(RoundersBorderTheme.rounderbuttons))));
  static TextButtonThemeData textButtonDark = TextButtonThemeData(
      style: TextButton.styleFrom(
    shadowColor: PaletteTheme.transparent,
    textStyle: typeFont.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        color: PaletteTheme.secondary),
    elevation: 0,
    foregroundColor: PaletteTheme.secondary,
  ));

  static IconButtonThemeData iconButtonDark = IconButtonThemeData(
      style: ButtonStyle(
    elevation: const WidgetStatePropertyAll(0),
    shadowColor: WidgetStatePropertyAll(
        PaletteTheme.principal.withAlpha((0.5 * 255).toInt())),
    foregroundColor: const WidgetStatePropertyAll(
        PaletteTheme.secondary), //color de las letras */

    iconSize: WidgetStateProperty.all(25),
    iconColor: WidgetStateProperty.all(PaletteTheme.secondary),
  ));
}
