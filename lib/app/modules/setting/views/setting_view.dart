import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import 'package:forcewallet/generated/locales.g.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Setting',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: SettingsList(
          sections: [
            SettingsSection(
              title: Text(LocaleKeys.settings_wallet_title.tr),
              tiles: <SettingsTile>[
                SettingsTile.navigation(
                  leading: Icon(Icons.wallet),
                  title: Text(LocaleKeys.settings_wallet_wallet_account.tr),
                  onPressed: (context) => {controller.openWalletManage()},
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.wallet),
                  title: Text(LocaleKeys.settings_wallet_observer_account.tr),
                ),
                SettingsTile.navigation(
                    leading: Icon(Icons.wifi),
                    title: Text("network config"),
                    onPressed: (context) => {controller.openNetworkConfig()}),
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
                  value: Obx(() => Text("english ${controller.count.value}")),
                ),
                SettingsTile.navigation(
                  leading: Icon(Icons.inventory_2_outlined),
                  title: Text(LocaleKeys.settings_common_invite.tr),
                ),
              ],
            ),
          ],
        ));
  }
}
