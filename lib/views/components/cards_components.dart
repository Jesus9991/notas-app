import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';
/*
COMPONENTES: para las cards
*/

/*card para la lista vertical de todas las notas */

class ListCardsNotesComponent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String created;
  final Function onTap;
  const ListCardsNotesComponent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.created,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .17,
      width: size.width,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.04, vertical: size.height * .01),
      margin: EdgeInsets.symmetric(horizontal: size.width * .04),
      decoration: BoxDecoration(
        color: isDarkMode ? PaletteTheme.blackTwo : PaletteTheme.whiteTwo,
        borderRadius: BorderRadius.circular(RoundersBorderTheme.rounderbuttons),
      ),
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
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Text(
                created,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * .02),
              Text(
                subtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          /*categoria */
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: size.width * .01,
            children: [
              CircleAvatar(
                backgroundColor: PaletteTheme.purple,
                radius: 7,
              ),
              SizedBox(
                width: size.width * .2,
                child: Text(
                  'categorie.name',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              radius: 15,
              child: Icon(Icons.arrow_outward_outlined),
            ),
          )
        ],
      ),
    );
  }
}

/*card pinneadas */
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

class CardColorsComponents extends StatelessWidget {
  final Color color;
  final String title;
  const CardColorsComponents({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .1,
      width: size.width * .2,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(RoundersBorderTheme.rounderbuttons),
      ),
      child: Center(
        child: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
