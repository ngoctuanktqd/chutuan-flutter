import 'package:get/get.dart';
import 'package:savvygetx/apps/routers/router_name.dart';
import 'package:savvygetx/managers/bindings/navigator_binding.dart';
import 'package:savvygetx/managers/bindings/setting_binding.dart';
import 'package:savvygetx/managers/bindings/tools_binding.dart';
import 'package:savvygetx/managers/bindings/transaction_binding.dart';
import 'package:savvygetx/managers/bindings/wallet_binding.dart';
import 'package:savvygetx/managers/controllers/wallet_controller.dart';
import 'package:savvygetx/pages/currency/currency_page.dart';
import 'package:savvygetx/pages/navigator/navigator_bottom_page.dart';
import 'package:savvygetx/pages/onboarding/onboarding_page.dart';
import 'package:savvygetx/pages/overview/overview_page.dart';
import 'package:savvygetx/pages/setting/setting_page.dart';
import 'package:savvygetx/pages/tools/tools_page.dart';
import 'package:savvygetx/pages/transaction/transaction_new_page.dart';
import 'package:savvygetx/pages/wallet/wallet_create.dart';
import 'package:savvygetx/pages/wallet/wallet_page.dart';
import 'package:savvygetx/pages/wallet/widgets/wallet_create_new.dart';
import 'package:savvygetx/pages/welcome/welcome_page.dart';

class RouterCustom {
  static List<GetPage> getPage = [
    GetPage(
      name: RouterName.onboarding,
      page: () => const OnboardingPage(),
    ),
    GetPage(
      name: RouterName.welcome,
      page: () => const WelComePage(),
    ),
    GetPage(
      name: RouterName.navigatorBottom,
      page: () => const NavigatorBottomPage(),
      binding: NavigatorBinding(),
    ),
    GetPage(
      name: RouterName.overview,
      page: () => const OverViewPage(),
    ),
    GetPage(
      name: RouterName.transactionNew,
      page: () => const TransactionNewPage(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: RouterName.tools,
      page: () => const ToolsPage(),
      binding: ToolsBinding(),
    ),
    GetPage(
      name: RouterName.settings,
      page: () => const SettingPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: RouterName.settingCurrency,
      page: () => const CurrencyPage(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: RouterName.wallet,
      page: () => const WalletPage(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: RouterName.walletCreate,
      page: () => const WalletCreate(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: RouterName.walletCreateNew,
      page: () => const WalletCreateNew(),
      binding: WalletBinding(),
    ),
  ];
}
