import 'package:flutter/material.dart';
import 'package:my_flutter_application_1/pages/settings-page/cookie-policy-page/cookie_policy_page.dart';
import 'package:my_flutter_application_1/pages/settings-page/privacy-policy-page/privacy_policy_page.dart';
import 'package:my_flutter_application_1/widgets/drawer-widget/drawer_widget.dart';
import 'package:my_flutter_application_1/widgets/sized-box-widgets/size_box_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(title: const Text("My Setting")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          constSizedBox(),
          const PrivacyPolicyButton(),
          constSizedBox(),
          const CookiePolicyButton(),
        ],
      ),
    );
  }
}
