
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:yandex_asadbek/common/di/getIt.config.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:injectable/injectable.dart';

import '../../data/hive/locationAdapter.dart';
import '../../util/const.dart';


final getIt = GetIt.instance;

@InjectableInit()
 configureDependencies() async {
  getIt.init();
  final document = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(document.path);
  Hive.registerAdapter(LocationAdapter());
  final box = await Hive.openBox(Const.boxName);
  getIt.registerSingleton(box);
}
