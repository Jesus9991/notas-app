import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:notas_app/controllers/exports/exports.dart';
import 'package:provider/provider.dart';
/*
COMPONENTS: appbars para toda lapp
*/

class AppbarHomeComponents extends StatelessWidget {
  const AppbarHomeComponents({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverAppBar(
      toolbarHeight: size.height * .01,
      expandedHeight: size.height * .01,
      elevation: 0,
      pinned: true,
      backgroundColor: PaletteTheme.transparent,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
        background: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: size.height * .04),
              padding: EdgeInsets.symmetric(horizontal: size.width * .04),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _UserDataComponente(),
                  const Spacer(),

                  /*nueva categoria*/
                  CircleButtonsComponent(
                    icon: Iconsax.folder_add_bold,
                    onTap: () {
                      //Todo: debe abrir el buscador
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _UserDataComponente extends StatelessWidget {
  const _UserDataComponente();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<UserInformationProvider>(
      builder: (context, info, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: size.width * .02,
          children: [
            CircleAvatar(
              radius: 22,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(ImagesPath.memojyLogo),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Bienvenido,'),
                //nombre de usuario
                SizedBox(
                  width: size.width * .4,
                  child: Text(
                    info.nameUser,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
