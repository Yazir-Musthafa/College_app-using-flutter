import 'package:college/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import  'package:college/utils/theme/theme.dart';
import 'app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {

  //widget binding 
  final WidgetsBinding  widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //getx local storage
  await GetStorage.init();

  //await native splash 
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


//init fbse and auth rep
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
    );

  runApp(const App());
}

