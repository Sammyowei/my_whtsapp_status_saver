import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/widgets/drawer-contents/app-widget-constants/app_constants.dart';
import 'package:my_flutter_application_1/widgets/drawer-contents/buttons-widgets/settings-button/settings_buttons.dart';
import 'package:my_flutter_application_1/widgets/drawer-contents/buttons-widgets/whatsapp-button/whatsapp_button.dart';
import 'package:my_flutter_application_1/widgets/sized-box-widgets/size_box_widget.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.green,
              padding: const EdgeInsets.only(left: 30),
              height: MediaQuery.of(context).size.height / 4.5,
              child: Center(
                child: appName(),
              ),
            ),
            constSizedBox(),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  WhatsappStatusButton(),
                  WhatsappBusinessButton(),
                  SettingsButton(),
                  RateUsButton(),
                  ShareButton(),
                  ContactButton(),
                ],
              ),
            ),
            constSizeFromTop(),
            companyName(),
          ],
        ),
      ),
    );
  }
}
