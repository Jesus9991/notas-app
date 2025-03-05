import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
LOGO: para el auth, reutilizable en varias pantalla
*/
class LogoTitleComponent extends StatelessWidget {
  const LogoTitleComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return Column(
      // spacing: size.height * .02,
      children: [
        Image.asset(
          isDarkMode ? ImagesPath.logoDark : ImagesPath.logoLight,
        ),
        SizedBox(height: size.height * .02),
        Text(
          'Bienvenido a',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.w200,
              ),
        ),
        Text(
          'Notas UX',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

/*
componente para el row que dice "iniciar sesiòn con"
*/
class LineRowComponent extends StatelessWidget {
  final String title;

  const LineRowComponent({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: size.height * .001,
          width: size.width * .2,
          decoration: BoxDecoration(
            color: isDarkMode
                ? PaletteTheme.secondary.withAlpha((0.2 * 255).toInt())
                : PaletteTheme.principal.withAlpha((0.2 * 255).toInt()),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: isDarkMode
                    ? PaletteTheme.secondary.withAlpha((0.2 * 255).toInt())
                    : PaletteTheme.principal.withAlpha((0.2 * 255).toInt()),
              ),
        ),
        const Spacer(),
        Container(
          height: size.height * .001,
          width: size.width * .2,
          decoration: BoxDecoration(
            color: isDarkMode
                ? PaletteTheme.secondary.withAlpha((0.2 * 255).toInt())
                : PaletteTheme.principal.withAlpha((0.2 * 255).toInt()),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}
