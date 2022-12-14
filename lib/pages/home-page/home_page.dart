import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/pages/whatsapp-page/whatsapp-images/image.dart';
import 'package:my_flutter_application_1/pages/whatsapp-page/whatsapp-videos/videos.dart';
import 'package:my_flutter_application_1/services/bottom-navigation-changer/bottom_nav.dart';
import 'package:provider/provider.dart';
import '../../widgets/app-bar-widget/app_bar.dart';
import '../../widgets/drawer-widget/drawer_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List pages = const <Widget>[
    WhatsappImageHomePage(),
    WhatsappVideoHomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, nav, child) {
        return Scaffold(
          drawer: const DrawerWidget(),
          appBar: AppBarWidget.appBar,
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
