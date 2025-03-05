import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
pantalla para el home de la aplicacion
*/
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GradientTwoBackground(
        child: CustomScrollView(
      physics: BouncingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      slivers: [
        /*apbbar*/
        AppbarHomeComponents(),
        //abre el buscador
        SliverToBoxAdapter(child: OpenSearchComponent()),
        //categorias
        ListCategories(),
        //pinned
        BannerPinnedComponent(),
        SliverToBoxAdapter(child: SizedBox(height: size.height * .03)),
        //lista de notas
        ListNotesComponent(),
      ],
    ));
  }
}
