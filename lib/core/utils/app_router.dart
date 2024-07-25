import 'package:books_reading_helper/features/home/presentation/views/home_view.dart';
import 'package:books_reading_helper/features/home/presentation/views/pdf_viewer_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String homeView = '/homeView';
  static const String pdfViewerView = '/pdfViewerView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: pdfViewerView,
        builder: (context, state) => PdfViewerView(
          filePath: state.extra as String,
        ),
      ),
    ],
  );
}
