import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';
/*
WIDGET para manejar los modals de la app
*/

class ModalsWidget {
  /*modal para crear una categoria*/
  static void showCreateCategorie({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      elevation: 0,
      context: context,
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: PaletteTheme.principal.withAlpha((0.5 * 255).toInt()),
      builder: (context) => CreateCategoryComponent(),
    );
  }
}

class CreateCategoryComponent extends StatefulWidget {
  const CreateCategoryComponent({super.key});

  @override
  State<CreateCategoryComponent> createState() =>
      _CreateCategoryComponentState();
}

class _CreateCategoryComponentState extends State<CreateCategoryComponent> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;

    return BackDropFilterBlurComponents(
      height: size.height * .6,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * .04, vertical: size.height * .03),
        children: [
          //categoria
          InputsComponents(
            hintext: 'Crear categoría',
            validator: (val) => ValidationInputs.inputEmpty(val),
            autocorrect: true,
            maxLine: 2,
            onChanged: (val) {},
          ),
          SizedBox(height: size.height * .03),
          //lista de colores
          Container(
              height: size.height * .3,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(RoundersBorderTheme.rounderbuttons),
                color:
                    isDarkMode ? PaletteTheme.blackTwo : PaletteTheme.whiteTwo,
              ),
              child: GridView.builder(
                itemCount: coolors.length,
                padding: EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  final colorData = coolors[index];
                  final color = Color(colorData['color']);
                  final title = colorData['name'];
                  return CardColorsComponents(
                    color: color,
                    title: title ?? '',
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0, // spacing between columns
                ),
              )),
          SizedBox(height: size.height * .03),

          //crear categoria
          CustomButton(
            text: 'Guardar categoría',
            isLoading: false,
            onTap: () {
              //Todo: debe crear la categoria
            },
          ),
        ],
      ),
    );
  }

  final List<Map<String, dynamic>> coolors = [
    {'name': 'Rojo', 'color': 0xFFFF0000},
    {'name': 'Azul', 'color': 0xFF0000FF},
    {'name': 'Verde', 'color': 0xFF00FF00},
    {'name': 'Amarillo', 'color': 0xFFFFFF00},
    {'name': 'Naranja', 'color': 0xFFFFA500},
  ];
}
