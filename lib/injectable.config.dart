// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_core/firebase_core.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:justplay/app/services/firebase.dart' as _i10;
import 'package:justplay/core/services/i_auth_service.dart' as _i8;
import 'package:justplay/core/services/i_country_service.dart' as _i4;
import 'package:justplay/core/services/i_user_service.dart' as _i6;
import 'package:justplay/data/services/auth_service.dart' as _i9;
import 'package:justplay/data/services/country_service.dart' as _i5;
import 'package:justplay/data/services/user_service.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    await gh.factoryAsync<_i3.FirebaseApp>(
      () => firebaseModule.firebase,
      preResolve: true,
    );
    gh.factory<_i4.ICountryService>(() => _i5.CountryService());
    gh.factory<_i6.IUserService>(() => _i7.UserService());
    gh.factory<_i8.IAuthService>(() => _i9.AuthService(gh<_i6.IUserService>()));
    return this;
  }
}

class _$FirebaseModule extends _i10.FirebaseModule {}
