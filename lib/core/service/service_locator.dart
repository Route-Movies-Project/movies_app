import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/core/service/service_locator.config.dart';

final GetIt getIt = GetIt.instance;
@InjectableInit()
void setupLocator() => getIt.init();
