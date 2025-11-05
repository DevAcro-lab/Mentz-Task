import 'package:get_it/get_it.dart';
import 'package:mentz_task/core/injections/spot/spot_service_locator.dart';

final GetIt slInstance = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {
    final authServiceLocator = SpotServiceLocator(slInstance);
    authServiceLocator.init();
  }
}