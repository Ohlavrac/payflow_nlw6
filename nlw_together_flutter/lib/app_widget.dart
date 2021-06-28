import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nlw_together_flutter/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:nlw_together_flutter/modules/home/home_page.dart';
import 'package:nlw_together_flutter/modules/insert_boleto/insert_boleto_page.dart';
import 'package:nlw_together_flutter/modules/splash/splash_page.dart';
import 'package:nlw_together_flutter/shared/models/user_models.dart';
import 'package:nlw_together_flutter/shared/themes/app_colors.dart';

import 'modules/login/login_page.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pay Flow",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(user: ModalRoute.of(context)!.settings.arguments as UserModel,),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarcodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage(
          barcode: ModalRoute.of(context) != null ? ModalRoute.of(context)!.settings.arguments.toString() : null,
        ),
      }
    );
  }
}

//Parei no 55:54