import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/pages/whatsapp-business-pages/whatsapp-business-image/wb_image.dart';
import 'package:my_flutter_application_1/pages/whatsapp-business-pages/whatsapp-business-videos/wb_videos.dart';
import 'package:my_flutter_application_1/services/bottom-navigation-changer/bottom_nav.dart';
import 'package:my_flutter_application_1/widgets/app-bar-widget/app_bar.dart';
import 'package:my_flutter_application_1/widgets/drawer-widget/drawer_widget.dart';
import 'package:provider/provider.dart';

class MyWhatsappBusinessHomePage extends StatefulWidget {
  const MyWhatsappBusinessHomePage({super.key});

  @override
  State<MyWhatsappBusinessHomePage> createState() =>
      _MyWhatsappBusinessHomePageState();
}

class _MyWhatsappBusinessHomePageState
    extends State<MyWhatsappBusinessHomePage> {
  List pages = const <Widget>[
    WhatsappBusinessImageHomePage(),
    WhatsappBusinessVideoHomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, nav, child) {
        return Scaffold(
          drawer: const DrawerWidget(),
          appBar: AppBarWidget.waAppBar,
          body: pages[nav.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[400],
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.image,
                ),
                label: "Images",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_library_rounded),
                label: "Videos",
              ),
            ],
            currentIndex: nav.currentIndex,
            onTap: (value) {
              nav.changeIndex(value);
            },
          ),
        );
      },
    );
  }
}
