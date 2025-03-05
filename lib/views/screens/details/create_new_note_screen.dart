import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
PANTALLA: para crear una nueva nota 
*/
class CreateNewNoteScreen extends StatelessWidget {
  const CreateNewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    /*entorno el brillo actual (modo oscuro o claro) */
    Brightness brightness = MediaQuery.of(context).platformBrightness;
    /*verifica si el modo es oscuro o claro */
    bool isDarkMode = brightness == Brightness.dark;

    return GradientActionBackground(
        actions: [
          //pinnear
          Padding(
            padding: EdgeInsets.only(right: size.width * .02),
            child: CircleButtonsComponent(
              icon: Icons.push_pin_outlined,
              onTap: () async {
                /*efecto de vibracion */
                await VibrationEffectService().vibrationEffect();
              },
            ),
          ),
          SizedBox(width: size.width * .02),
          //guardar
          Padding(
            padding: EdgeInsets.only(right: size.width * .02),
            child: CircleButtonsComponent(
              icon: Iconsax.document_upload_bold,
              onTap: () async {
                /*efecto de vibracion */
                await VibrationEffectService().vibrationEffect();
              },
            ),
          ),
        ],
        child: Padding(
          padding: EdgeInsets.only(
              top: size.height * .15,
              left: size.width * .04,
              right: size.width * .04,
              bottom: size.height * .05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            // padding: EdgeInsets.symmetric(
            //     horizontal: size.width * .04, vertical: size.height * .03),
            // physics: const BouncingScrollPhysics(),
            // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              //titulo
              InputTitleNoteComponent(
                hintext: 'Añadir título de la nota...',
                autocorrect: true,
                maxLine: 2,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) {},
              ),
              const Divider(),
              //cuerpo de la nota
              Expanded(
                child: TextField(
                  // controller: _descriptionController,
                  maxLines: null,
                  cursorColor: isDarkMode
                      ? PaletteTheme.secondary
                      : PaletteTheme.principal,
                  keyboardType: TextInputType.multiline,

                  decoration: InputDecoration(
                    hintText: "Escribe tu nota aquí...",
                    border: InputBorder.none,
                    hintStyle: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w200),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
