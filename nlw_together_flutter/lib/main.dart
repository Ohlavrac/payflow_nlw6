import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nlw_together_flutter/app_widget.dart';

void main() {
  runApp(AppFireBase());
}

class AppFireBase extends StatefulWidget {
  const AppFireBase({ Key? key }) : super(key: key);

  @override
  _AppFireBaseState createState() => _AppFireBaseState();
}

class _AppFireBaseState extends State<AppFireBase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text(
                "Não foi possivel inicializar o firebase",
                textDirection: TextDirection.ltr,
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return AppWidget();
        }
        return Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}