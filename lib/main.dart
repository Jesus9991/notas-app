import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:notas_app/controllers/exports/exports.dart';
import 'package:notas_app/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /*inicializa la traducción*/
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const ProviderApp());
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginAuthProvider()),
        ChangeNotifierProvider(create: (context) => RegisterAuthProvider()),
        ChangeNotifierProvider(create: (context) => ResetPasswordProvider()),
        ChangeNotifierProvider(create: (context) => SocialNetworkProvider()),
        ChangeNotifierProvider(create: (context) => SystemNavegationProvider()),
      ],
      child: NavegationSystemApp(),
    );
  }
}

/*sistema de navegación*/
class NavegationSystemApp extends StatelessWidget {
  const NavegationSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<SystemNavegationProvider>(context);
    return MyApp(
      navProvider: navProvider,
    );
  }
}

class MyApp extends StatefulWidget {
  final SystemNavegationProvider navProvider;
  const MyApp({
    super.key,
    required this.navProvider,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<void> initialization;

  @override
  void initState() {
    super.initState();
    initialization = widget.navProvider.setNavegationSystemUser();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FutureBuilder(
      future: initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Consumer<SystemNavegationProvider>(
              builder: (context, value, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Notas',
              theme: MainTheme.whiteTheme,
              darkTheme: MainTheme.darkTheme,
              routes: MainRoutes.routes,
              initialRoute: value.tokenUser.isEmpty
                  ? MainRoutes.loginScreenRoute
                  : MainRoutes.navBarRoute,
            );
          });
        } else {
          return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Scaffold(
                  body: Center(
                child: LoadingComponents(),
              )));
        }
      },
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Notas',
    //   theme: MainTheme.whiteTheme,
    //   darkTheme: MainTheme.darkTheme,
    //   routes: MainRoutes.routes,
    //   initialRoute: MainRoutes.loginScreenRoute,
    // );
  }
}
