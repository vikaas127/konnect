import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';

import 'ui/tally_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //name: 'Tally Konnect',
    options: FirebaseOptions(
      measurementId: 'G-R3TKNMSTBB',
      projectId: 'tally-konnect-55ffb',
      messagingSenderId: '93429636162',
      storageBucket: 'tally-konnect-55ffb.appspot.com',
      appId: '1:93429636162:web:5bcd680539d281a6fa61db',
      apiKey: 'AIzaSyAHymgOs0UYWTDOmQqoD50YsjA4iW8CSv4',
      authDomain: 'tally-konnect-55ffb.firebaseapp.com',
      databaseURL: 'https://tally-konnect-55ffb-default-rtdb.firebaseio.com',
    ),
  );
  setPathUrlStrategy();

  Provider.debugCheckInvalidValueType = null;
  runApp(startApp());
}
