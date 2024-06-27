import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/app/app_settings_notifier.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Future<void> openWhatsapp() async {
    const contact = '+77756716423';
    const androidUrl =
        'whatsapp://send?phone=$contact&text=Отзыв :';
    final iosUrl =
        "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try {
      if (Platform.isIOS) {
        await launchUrl(Uri.parse(iosUrl));
      } else {
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text(AppLocalizations.of(context)!.somethingWasGoneWrong)));
      }
    }
  }


  Widget settingCard(
      {required void Function() onTap,
      required String settingText,
      bool needRightChevron = false}) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        title:
            Text(settingText, style: Theme.of(context).textTheme.displayMedium),
        trailing: needRightChevron
            ? const Icon(Icons.chevron_right_outlined)
            : const SizedBox(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppSettingsNotifier>(context);
    return Scaffold(
      appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
          title: Text(AppLocalizations.of(context)!.settings),
          centerTitle: true),
      body: ListView(
        children: [
          settingCard(
              onTap: themeProvider.changeLocale,
              settingText: AppLocalizations.of(context)!.changeLocale),
          settingCard(
              onTap: themeProvider.changeTheme,
              settingText: AppLocalizations.of(context)!.changeTheme),
          settingCard(
              onTap: () async {
                await openWhatsapp();
              },
              settingText: AppLocalizations.of(context)!.giveFeedback,
              needRightChevron: true),
        ],
      ),
    );
  }
}
