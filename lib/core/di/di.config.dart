// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../views/account_managment/presentation/view_model/edit_profile_cubit.dart'
    as _i389;
import '../../views/account_managment/repo/edit_profile_repo.dart' as _i882;
import '../../views/account_managment/repo/edit_profile_repo_imple.dart'
    as _i55;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i882.EditProfileRepo>(() => _i55.EditProfileRepoImple());
    gh.factory<_i389.EditProfileCubit>(
      () => _i389.EditProfileCubit(gh<_i882.EditProfileRepo>()),
    );
    return this;
  }
}
