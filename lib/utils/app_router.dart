import 'package:go_router/go_router.dart';
import 'package:mars_photo_independent/ui/settings.dart';

import '../ui/home.dart';

const String settingsPath = "/settings";

GoRouter router() {
  return GoRouter(
    routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const Home(),
    ),
    GoRoute(
      path: settingsPath,
      builder: (context, state) => const Settings(),
    ),
  ]);
}
