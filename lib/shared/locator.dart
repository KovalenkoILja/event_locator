import 'package:event_locator/services/events_service.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => EventsService());
}
