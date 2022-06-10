import 'package:get/get.dart';

import '../modules/create/bindings/create_binding.dart';
import '../modules/create/views/create_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/import/bindings/import_binding.dart';
import '../modules/import/views/import_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/network_manage/bindings/network_manage_binding.dart';
import '../modules/network_manage/views/network_manage_view.dart';
import '../modules/send/bindings/send_binding.dart';
import '../modules/send/views/send_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/wallet/bindings/wallet_binding.dart';
import '../modules/wallet/views/wallet_view.dart';
import '../modules/wallet_manage/bindings/wallet_manage_binding.dart';
import '../modules/wallet_manage/views/wallet_manage_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.WALLET,
      page: () => const WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.IMPORT,
      page: () => const ImportView(),
      binding: ImportBinding(),
    ),
    GetPage(
      name: _Paths.CREATE,
      page: () => const CreateView(),
      binding: CreateBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: _Paths.MAIN,
        page: () => const MainView(),
        binding: MainBinding(),
        children: [
          GetPage(
            name: _Paths.SETTING,
            page: () => const SettingView(),
            binding: SettingBinding(),
          ),
          GetPage(
            name: _Paths.HOME,
            page: () => const HomeView(),
            binding: HomeBinding(),
          ),
        ]),
    GetPage(
      name: _Paths.SEND,
      page: () => const SendView(),
      binding: SendBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_MANAGE,
      page: () => const WalletManageView(),
      binding: WalletManageBinding(),
    ),
    GetPage(
      name: _Paths.NETWORK_MANAGE,
      page: () => const NetworkManageView(),
      binding: NetworkManageBinding(),
    ),
  ];
}
