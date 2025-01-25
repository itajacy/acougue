// import 'package:acougue/batch_register.dart';
import 'package:flutter/material.dart';

import 'my_butcher_home.dart';

class MyButcher extends StatelessWidget {
  const MyButcher({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   // '/': (_) => MyButcher(),
      //   '/register': (_) => BatchRegister(
      //         batches: [],
      //       ),
      // },
      home: MyButcherHome(),
    );
  }
}
