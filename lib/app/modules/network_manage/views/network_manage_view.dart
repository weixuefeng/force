import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import '../controllers/network_manage_controller.dart';

class NetworkManageView extends GetView<NetworkManageController> {
  const NetworkManageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NetworkManage'),
        centerTitle: true,
      ),
      body: Obx(() => SettingsList(
            sections: [
              SettingsSection(
                title: Text("NEW"),
                tiles: controller.newNetworkConfigList
                    .map((networkConfig) => SettingsTile.navigation(
                          leading: Icon(Icons.security),
                          title: Text(networkConfig.networkName!),
                          value: Text(networkConfig.rpcUrl!),
                          onPressed: (context) => {
                            controller.changeNetworkConfig(
                                networkConfig,
                                controller.defaultNewNetworkConfig,
                                controller.newNetworkConfigList)
                          },
                          trailing: networkConfig.id ==
                                  controller.defaultNewNetworkConfig.value.id
                              ? Icon(Icons.check)
                              : null,
                        ))
                    .toList(),
              ),
              SettingsSection(
                  title: Text("ETH"),
                  tiles: controller.ethNetworkConfigList
                      .map((networkConfig) => SettingsTile.navigation(
                            leading: Icon(Icons.security),
                            title: Text(networkConfig.networkName!),
                            value: Text(networkConfig.rpcUrl!),
                            onPressed: (context) => {
                              controller.changeNetworkConfig(
                                  networkConfig,
                                  controller.defaultEthNetworkConfig,
                                  controller.ethNetworkConfigList)
                            },
                            trailing: networkConfig.id ==
                                    controller.defaultEthNetworkConfig.value.id
                                ? Icon(Icons.check)
                                : null,
                          ))
                      .toList())
            ],
          )),
    );
  }
}
