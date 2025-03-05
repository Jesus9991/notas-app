import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
manejo del tema global de la aplicación
*/

class MainTheme {
  /*modo claro */
  static final ThemeData whiteTheme = ThemeData.light().copyWith(
    appBarTheme: AppBarMainTheme.appbarLight,
    primaryColor: PaletteTheme.principal,
    highlightColor: PaletteTheme.secondary,
    colorScheme: const ColorScheme.light(primary: PaletteTheme.blackTwo),
    textTheme: FontsTheme.lightThemeFont,
    disabledColor: PaletteTheme
        .whiteTwo, //Establece el color para los elementos desactivados
    dividerColor: PaletteTheme.blackTwo, //Color del widget Divider()
    scaffoldBackgroundColor:
        PaletteTheme.secondary, // Establece el color para el "scaffold"
    visualDensity: VisualDensity
        .adaptivePlatformDensity, //Adaptándose a diferentes tamaños y resoluciones de pantalla.
    unselectedWidgetColor: PaletteTheme.blackTwo, //widgets no seleccionados
    scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(10),
            thumbColor: WidgetStatePropertyAll(
                PaletteTheme.secondary.withAlpha((0.5 * 255).toInt())),
            trackColor: const WidgetStatePropertyAll(PaletteTheme.blackTwo))
        .copyWith(thumbColor: WidgetStateProperty.all(PaletteTheme.blackTwo)),

    iconTheme: const IconThemeData(color: PaletteTheme.blackTwo, size: 20),
    sliderTheme: SliderThemeData(
      activeTrackColor: PaletteTheme.principal,
      thumbColor: PaletteTheme.principal,
      overlayColor: PaletteTheme.principal,
      inactiveTrackColor: PaletteTheme.blackTwo.withAlpha((0.2 * 255).toInt()),
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: PaletteTheme.principal),
    outlinedButtonTheme: ButtonsTheme.outlinedButtonLight,

    elevatedButtonTheme: ButtonsTheme.elevatedButtonLight,
    textButtonTheme: ButtonsTheme.textButtonLight,
    iconButtonTheme: ButtonsTheme.iconButtonLight,
    dividerTheme: const DividerThemeData(color: PaletteTheme.blackTwo),
    splashColor: PaletteTheme.secondary.withAlpha((0.2 * 255).toInt()),
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        }),
    // navigationBarTheme: NavBarMainThemeData.navigationBarLight,
  );

  /* Tema Oscuro */
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarMainTheme.appbarDark,
    primaryColor: PaletteTheme.secondary,
    highlightColor: PaletteTheme.principal,
    colorScheme: const ColorScheme.dark(
      primary: PaletteTheme.secondary,
      onPrimary: PaletteTheme.principal,
      secondary: PaletteTheme.principal,
      onSecondary: PaletteTheme.principal,
      error: Color.fromARGB(255, 220, 22, 22),
      onError: PaletteTheme.principal,
      surface: PaletteTheme.secondary,
      onSurface: PaletteTheme.blackTwo,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: PaletteTheme.whiteTwo,
      thumbColor: PaletteTheme.whiteTwo,
      overlayColor: PaletteTheme.whiteTwo,
      inactiveTrackColor: PaletteTheme.blackTwo,
    ),
    textTheme: FontsTheme.dartThemeFont,
    disabledColor: PaletteTheme.whiteTwo,
    dividerColor: PaletteTheme.whiteTwo,
    scaffoldBackgroundColor: PaletteTheme.principal,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    unselectedWidgetColor: PaletteTheme.whiteTwo,
    scrollbarTheme: ScrollbarThemeData(
      radius: const Radius.circular(10),
      thumbColor: WidgetStatePropertyAll(
          PaletteTheme.principal.withAlpha((0.5 * 255).toInt())),
      trackColor: const WidgetStatePropertyAll(PaletteTheme.whiteTwo),
    ).copyWith(thumbColor: WidgetStateProperty.all(PaletteTheme.whiteTwo)),
    iconTheme: const IconThemeData(color: PaletteTheme.principal, size: 20),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: PaletteTheme.principal),
    outlinedButtonTheme: ButtonsTheme.outlinedButtonDark,
    elevatedButtonTheme: ButtonsTheme.elevatedButtonDark,
    textButtonTheme: ButtonsTheme.textButtonDark,
    iconButtonTheme: ButtonsTheme.iconButtonDark,
    dividerTheme: const DividerThemeData(color: PaletteTheme.whiteTwo),
    splashColor: PaletteTheme.whiteTwo.withAlpha((0.2 * 255).toInt()),
    splashFactory: InkSparkle.splashFactory,
    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        }),
  );
}
