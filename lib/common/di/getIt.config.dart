// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:yandex_asadbek/common/network/api_base.dart' as _i24;
import 'package:yandex_asadbek/common/network/main_api.dart' as _i198;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i24.ApiBase>(() => _i24.ApiBase());
    gh.factory<_i198.MainApi>(() => _i198.MainApi(gh<_i24.ApiBase>()));
    return this;
  }
}
