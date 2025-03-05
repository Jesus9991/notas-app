import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
COMPONENTES: para los widgets del home
*/
/*
lista vertical de las notas
*/
class ListNotesComponent extends StatelessWidget {
  const ListNotesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverList.separated(
      itemCount: 5,
      separatorBuilder: (context, index) => SizedBox(height: size.height * .02),
      itemBuilder: (context, index) {
        return ListCardsNotesComponent(
          title: 'Lorem Ipsum is simply',
          created: '12 sep 2024 · 10:00 am',
          subtitle:
              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          onTap: () {
            //Todo: debe navegar
          },
        );
      },
    );
  }
}

/*lista de banner pinneados*/
class BannerPinnedComponent extends StatelessWidget {
  const BannerPinnedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: SizedBox(
        height: size.height * .22,
        width: size.width,
        child: ListView.separated(
          itemCount: 4,
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>
              SizedBox(width: size.width * .04),
          itemBuilder: (context, index) {
            //Todo: crear un componente aparte
            return ListCardPinnedComponents(
              title: 'Lorem Ipsum is simply',
              subtitle:
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              created: '12 sep 2024 · 10:00 am',
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}

/*lista de categorias*/
class ListCategories extends StatelessWidget {
  const ListCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        height: size.height * .05,
        width: size.width,
        padding: EdgeInsets.only(left: size.width * .05),
        margin: EdgeInsets.only(top: size.height * .03),
        child: ListView.separated(
          itemCount: 4, //Todo: datos reales
          physics: const BouncingScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) =>
              SizedBox(width: size.width * .02),
          itemBuilder: (context, index) {
            return ListCardComponent(
              title: 'title categorie',
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
