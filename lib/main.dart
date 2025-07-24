import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:utilidades/src/app/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

//remote config
await FirebaseRemoteConfig.instance.setConfigSettings(
  RemoteConfigSettings(
  fetchTimeout: const Duration(minutes: 1),
  //define o intervalo entre as tentativas de bucas 
  minimumFetchInterval: const Duration(minutes: 1)
),
);
await FirebaseRemoteConfig.instance.setDefaults(
  const {
    'saudacao' : "bem vindo"
  }
);

runApp(AppWidget());
}

