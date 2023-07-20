import 'package:get/get.dart';
import 'package:rsk/auth/binding/auth_b.dart';
import 'package:rsk/auth/view/aut_v.dart';
import 'package:rsk/bayi/binding/bayi_binding.dart';
import 'package:rsk/bayi/pages/detail_bayi_page.dart';
import 'package:rsk/home_page.dart';
import 'package:rsk/resume_pasien/binding/resume_binding.dart';
import 'package:rsk/bayi/pages/bayi_page.dart';
import 'package:rsk/resume_pasien/pages/resume_page.dart';
import 'package:rsk/resume_pasien/pages/signature_page.dart';
import 'package:rsk/routes/app_routes.dart';
import 'package:rsk/splash_screen.dart';
import 'package:rsk/ttd_dokter/binding/ttd_dokter_b.dart';
import 'package:rsk/ttd_dokter/view/signature_widget.dart';
import 'package:rsk/ttd_dokter/view/ttd_dokter_v.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.AUTH,
      page: () => AuthPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.RESUME,
      page: () => ResumePage(),
      binding: ResumeBinding(),
    ),
    GetPage(
        name: AppRoutes.BAYI, page: () => BayiPage(), binding: BayiBinding()),
    GetPage(
      name: AppRoutes.DETAILRESUME,
      page: () => SignatureWidget(),
    ),
    GetPage(
        name: AppRoutes.DOKTER,
        page: () => TtdDokterPage(),
        binding: TtdDokterBinding()),
    GetPage(
        name: AppRoutes.DETAILRESUMEDOKTER,
        page: () => SignatureWidgetDokter(),
        binding: TtdDokterBinding()),
    GetPage(
        name: AppRoutes.BAYIDETAIL,
        page: () => BayiDetailPage(),
        binding: BayiBinding()),
  ];
}
