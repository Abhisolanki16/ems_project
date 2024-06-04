import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeScreenRoute.page, initial: true),
        AutoRoute(page: AddEmployeeRoute.page),
        AutoRoute(page: UpdateEmployeeRoute.page),
        AutoRoute(page: EmployeeDetailsRoute.page),
      ];
}
