import 'package:flutter/material.dart';
import 'package:forcewallet/generated/locales.g.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text(LocaleKeys.settings_wallet_title.tr),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.wallet),
              title: Text(LocaleKeys.settings_wallet_wallet_account.tr),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.wallet),
              title: Text(LocaleKeys.settings_wallet_observer_account.tr),
            ),
          ],
        ),
        SettingsSection(
          title: Text(LocaleKeys.settings_secure_title.tr),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.security),
              title: Text(LocaleKeys.settings_secure_secure_setting.tr),
            ),
            SettingsTile.switchTile(
              initialValue: true,
              onToggle: (bool) => {},
              leading: Icon(Icons.developer_mode),
              title: Text(LocaleKeys.settings_secure_developer.tr),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.money),
              title: Text(LocaleKeys.settings_secure_fiat.tr),
            ),
          ],
        ),
        SettingsSection(
          title: Text(LocaleKeys.settings_common_title.tr),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text(LocaleKeys.settings_common_language.tr),
              value: Text("english"),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.inventory_2_outlined),
              title: Text(LocaleKeys.settings_common_invite.tr),
            ),
          ],
        ),
      ],
    );
  }
}
