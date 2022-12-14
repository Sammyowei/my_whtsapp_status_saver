import "package:flutter/material.dart";
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:my_flutter_application_1/pages/settings-page/settings_page.dart';
import 'package:url_launcher/url_launcher.dart';

Widget bottomText() {
  return const Text("");
}

class SettingsButton extends StatefulWidget {
  const SettingsButton({super.key});

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  final Text _settings = const Text(
    "Settings                       ",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.grey,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      child: TextButton.icon(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
              (route) => false);
        },
        label: _settings,
        icon: const Icon(
          Icons.settings_rounded,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class ContactButton extends StatefulWidget {
  const ContactButton({super.key});

  @override
  State<ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        final contactLink = Uri.parse("https://wa.me/message/3QCJQFEV6N2JH1");
        launchUrl(contactLink);
      },
      icon: const Icon(
        Icons.phone,
        color: Colors.grey,
      ),
      label: const Text(
        "Contact Us",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class RateUsButton extends StatefulWidget {
  const RateUsButton({super.key});

  @override
  State<RateUsButton> createState() => _RateUsButtonState();
}

class _RateUsButtonState extends State<RateUsButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        final link = Uri.parse(
            "https://play.google.com/store/apps/details?id=com.bumblestudio.whatsappstatussaverfirst");
        launchUrl(link);
      },
      icon: const Icon(
        Icons.star_rate_outlined,
        color: Colors.grey,
      ),
      label: const Text(
        "Rate us",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class ShareButton extends StatefulWidget {
  const ShareButton({super.key});

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        FlutterNativeApi.shareText(
            """You can get this amazing whatsapp status saver to save all your whatsapp and whatsapp business statuses by clicking this link: https://play.google.com/store/apps/details?id=com.bumblestudio.whatsappstatussaverfirst
""");
      },
      icon: const Icon(
        Icons.share_sharp,
        color: Colors.grey,
      ),
      label: const Text(
        "Share",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.grey,
        ),
      ),
    );
  }
}
