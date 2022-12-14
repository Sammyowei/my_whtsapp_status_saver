import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyCookiePolicyPage extends StatefulWidget {
  const MyCookiePolicyPage({super.key});

  @override
  State<MyCookiePolicyPage> createState() => _MyCookiePolicyPageState();
}

class _MyCookiePolicyPageState extends State<MyCookiePolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cookie Policy"),
      ),
      body: const WebView(
          initialUrl: "https://bumble-studio-cookie-policy.netlify.app"),
    );
  }
}

class CookiePolicyButton extends StatefulWidget {
  const CookiePolicyButton({super.key});

  @override
  State<CookiePolicyButton> createState() => _CookiePolicyButtonState();
}

class _CookiePolicyButtonState extends State<CookiePolicyButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyCookiePolicyPage(),
        ));
      },
      child: Text(
        "Cookies Policy",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.grey.shade700),
      ),
    );
  }
}
