import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyPrivacyPage extends StatefulWidget {
  const MyPrivacyPage({super.key});

  @override
  State<MyPrivacyPage> createState() => _MyPrivacyPageState();
}

class _MyPrivacyPageState extends State<MyPrivacyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: const WebView(
          initialUrl: "https://bumble-studio-privacy-policy.netlify.app"),
    );
  }
}

class PrivacyPolicyButton extends StatefulWidget {
  const PrivacyPolicyButton({super.key});

  @override
  State<PrivacyPolicyButton> createState() => _PrivacyPolicyButtonState();
}

class _PrivacyPolicyButtonState extends State<PrivacyPolicyButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyPrivacyPage(),
        ));
      },
      child: Text(
        "Privacy Policy",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.grey.shade700),
      ),
    );
  }
}
