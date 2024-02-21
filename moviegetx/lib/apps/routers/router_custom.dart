import 'package:get/get.dart';
import 'package:moviegetx/apps/routers/router_name.dart';
import 'package:moviegetx/managers/bindings/explore_binding.dart';
import 'package:moviegetx/managers/bindings/home_binding.dart';
import 'package:moviegetx/managers/bindings/loading_binding.dart';
import 'package:moviegetx/managers/bindings/movie_detail_binding.dart';
import 'package:moviegetx/managers/bindings/movie_new_release_binding.dart';
import 'package:moviegetx/managers/bindings/movie_now_playing_binding.dart';
import 'package:moviegetx/managers/bindings/movie_top_binding.dart';
import 'package:moviegetx/managers/bindings/my_list_binding.dart';
import 'package:moviegetx/managers/bindings/navigator_bottom_binding.dart';
import 'package:moviegetx/managers/bindings/premium_binding.dart';
import 'package:moviegetx/managers/bindings/profile_binding.dart';
import 'package:moviegetx/managers/bindings/setup_account_binding.dart';
import 'package:moviegetx/managers/bindings/sign_in_binding.dart';
import 'package:moviegetx/managers/bindings/sign_up_binding.dart';
import 'package:moviegetx/managers/bindings/video_play_binding.dart';
import 'package:moviegetx/managers/bindings/wellcome_binding.dart';
import 'package:moviegetx/managers/midlewares/loading_midleware.dart';
import 'package:moviegetx/managers/midlewares/navigator_bottom_midleware.dart';
import 'package:moviegetx/managers/midlewares/sigin_midleware.dart';
import 'package:moviegetx/pages/explore/explore_page.dart';
import 'package:moviegetx/pages/home/home_page.dart';
import 'package:moviegetx/pages/loading/loading_page.dart';
import 'package:moviegetx/pages/movie_detail/movie_detail_page.dart';
import 'package:moviegetx/pages/movie_new_release/movie_new_release_page.dart';
import 'package:moviegetx/pages/movie_now_playing/movie_now_playing_page.dart';
import 'package:moviegetx/pages/movie_top/movie_top_page.dart';
import 'package:moviegetx/pages/my_list/my_list_page.dart';
import 'package:moviegetx/pages/navigator_bottom/navigator_bottom_page.dart';
import 'package:moviegetx/pages/premium/premium_page.dart';
import 'package:moviegetx/pages/premium/premium_payment.dart';
import 'package:moviegetx/pages/premium/premium_payment_add_card.dart';
import 'package:moviegetx/pages/premium/premium_payment_summary.dart';
import 'package:moviegetx/pages/profile/profile_page.dart';
import 'package:moviegetx/pages/profile/widgets/profile_notification.dart';
import 'package:moviegetx/pages/setup_account_interest/setup_account_interest_page.dart';
import 'package:moviegetx/pages/setup_account_pin/setup_account_pin_page.dart';
import 'package:moviegetx/pages/setup_account_profile.dart/setup_account_profile_page.dart';
import 'package:moviegetx/pages/sign_in/sign_in_page.dart';
import 'package:moviegetx/pages/sign_in/sign_in_password.dart';
import 'package:moviegetx/pages/sign_up/sign_up_page.dart';
import 'package:moviegetx/pages/video_play/video_play_page.dart';
import 'package:moviegetx/pages/video_play/youtube_play_page.dart';
import 'package:moviegetx/pages/wellcome/wellcome_page.dart';

class RouterCustom {
  static List<GetPage> listPage = [
    GetPage(
      name: RouterName.loading,
      page: () => const LoadingPage(),
      binding: LoadingBinding(),
    ),
    GetPage(
      name: RouterName.wellcome,
      page: () => const WellComePage(),
      binding: WellcomeBinding(),
      middlewares: [
        WellcomeMidleware(),
      ],
    ),
    GetPage(
      name: RouterName.signIn,
      page: () => const SignInPage(),
      binding: SignInBinding(),
      middlewares: [
        SignInMidleware(),
      ],
    ),
    GetPage(
      name: RouterName.signInWithPassword,
      page: () => const SignInPasswordPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: RouterName.signUp,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: RouterName.navgigatorBottom,
      page: () => const NavigatorBottomPage(),
      binding: NavigatorBottomBinding(),
      middlewares: [
        NavigatorBottomMidleware(),
      ],
    ),
    GetPage(
      name: RouterName.setupAccountInterest,
      page: () => const SetupAccountInterestPage(),
      binding: SetupAccountBinding(),
    ),
    GetPage(
      name: RouterName.setupAccountProfile,
      page: () => const SetupAccountProfilePage(),
      binding: SetupAccountBinding(),
    ),
    GetPage(
      name: RouterName.setupAccountPin,
      page: () => const SetupAccountPinPage(),
      binding: SetupAccountBinding(),
    ),
    GetPage(
      name: RouterName.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: RouterName.profileNotification,
      page: () => const ProfileNotification(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: RouterName.premium,
      page: () => const PremiumPage(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: RouterName.premiumPayment,
      page: () => const PremiumPayment(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: RouterName.premiumPaymentAddCard,
      page: () => const PremiumPaymentAddCard(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: RouterName.premiumPaymentSummary,
      page: () => const PremiumPaymentSummary(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: RouterName.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouterName.movieNewRelease,
      page: () => const MovieNewReleasePage(),
      binding: MovieNewReleaseBinding(),
    ),
    GetPage(
      name: RouterName.movieTop,
      page: () => const MovieTopPage(),
      binding: MovieTopBinding(),
    ),
    GetPage(
      name: RouterName.movieNowPlaying,
      page: () => const MovieNowPlayingPage(),
      binding: MovieNowPlayingBinding(),
    ),
    GetPage(
      name: RouterName.explore,
      page: () => const ExplorePage(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: RouterName.movieDetail,
      page: () => const MovieDetailPage(),
      binding: MovieDetailBinding(),
    ),
    GetPage(
      name: RouterName.videoPlayYoutube,
      page: () => const YoutubePlayPage(),
      binding: VideoPlayBinding(),
    ),
    GetPage(
      name: RouterName.myList,
      page: () => const MyListPage(),
      binding: MyListBinding(),
    ),
    GetPage(
      name: RouterName.videoPlayPage,
      page: () => const VideoPlayPage(),
    ),
  ];
}
