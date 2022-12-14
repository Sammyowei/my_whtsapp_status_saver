import 'package:my_flutter_application_1/pages/splash-screen/splash_screen.dart';
import 'package:my_flutter_application_1/services/bottom-navigation-changer/bottom_nav.dart';
import 'package:my_flutter_application_1/services/get-whatsapp-business-status/get_statuses_for_whatsapp_business.dart';
import 'package:my_flutter_application_1/services/get-whatsapp-status/get_statuses_for_whatssapp.dart';
import 'package:my_flutter_application_1/utils/themes/themes.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => BottomNavProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => GetWhatsappStatusProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => GetStatusesForWhatsappBusiness(),
      )
    ],
    child: MaterialApp(
        theme: AppThemes.themeData,
        debugShowCheckedModeBanner: false,
        home: const MySplashScreen()),
  ));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
