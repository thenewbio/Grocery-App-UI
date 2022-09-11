import 'package:get_it/get_it.dart';
import 'package:grocery_app/utils/routes/navigation_service.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => NavigationService());
}
