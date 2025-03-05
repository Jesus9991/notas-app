import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';
/*
COMPONENTES: para las cards
*/

class ListCardPinnedComponents extends StatelessWidget {
  final String title;
  final String subtitle;
  final String created;
  final Function onTap;
  const ListCardPinnedComponents({
    super.key,
    required this.title,
    required this.subtitle,
    required this.created,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
          top: size.height * .03,
          right: size.width * .04,
          left: size.width * .04),
      width: size.width * .9,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: 8),
      decoration: BoxDecoration(
        color: PaletteTheme.purple,
        borderRadius: BorderRadius.circular(RoundersBorderTheme.rounderbuttons),
      ),
      child: InkWell(
        onTap: () => onTap(),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*titulo del card */
                SizedBox(
                  width: size.width * .5,
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: PaletteTheme.secondary,
                        ),
                  ),
                ),
                Text(
                  subtitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: PaletteTheme.secondary,
                      ),
                ),
                SizedBox(height: size.height * .03),
                Text(
                  created,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: PaletteTheme.secondary,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  //Todo: debe eliminar de pinned
                },
                child: CircleAvatar(
                  backgroundColor:
                      PaletteTheme.principal.withAlpha((.3 * 255).toInt()),
                  child: Center(
                    child: Icon(Icons.push_pin_outlined),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*cards para la lista de categorias*/
class ListCardComponent extends StatelessWidget {
  final String title;
  final Function onTap;
  const ListCardComponent({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    return IntrinsicWidth(
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: 8),
        decoration: BoxDecoration(
          color: isDarkMode ? PaletteTheme.blackTwo : PaletteTheme.whiteTwo,
          borderRadius:
              BorderRadius.circular(RoundersBorderTheme.rounderbuttons),
        ),
        child: Center(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: isDarkMode
                      ? PaletteTheme.whiteTwo
                      : PaletteTheme.blackTwo,
                ),
          ),
        ),
      ),
    );
  }
}
