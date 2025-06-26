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

import '../../views/account_managment/data/repo/edit_profile_repo.dart'
    as _i533;
import '../../views/account_managment/data/repo/edit_profile_repo_imple.dart'
    as _i865;
import '../../views/account_managment/presentation/view_model/edit_profile_cubit.dart'
    as _i389;
import '../../views/donation_details/data/repo/donation_details_repo.dart'
    as _i335;
import '../../views/donation_details/data/repo/donation_details_repo_imple.dart'
    as _i80;
import '../../views/donation_details/presentation/view_model/dontation_details_cubit.dart'
    as _i935;
import '../../views/forget_password/data/repo/forget_password_repo.dart'
    as _i542;
import '../../views/forget_password/data/repo/forget_password_repo_imple.dart'
    as _i827;
import '../../views/forget_password/presentation/view_model/forget_password_cubit.dart'
    as _i446;
import '../../views/my_requests/data/repo/my_request_repo.dart' as _i658;
import '../../views/my_requests/data/repo/my_request_repo_imple.dart' as _i818;
import '../../views/my_requests/presentation/view_model/my_request_cubit.dart'
    as _i643;
import '../../views/request_details/data/repo/request_details_repo.dart'
    as _i133;
import '../../views/request_details/data/repo/request_details_repo_imple.dart'
    as _i763;
import '../../views/request_details/presentation/view_model/add_donation_cubit.dart'
    as _i631;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i533.EditProfileRepo>(() => _i865.EditProfileRepoImple());
    gh.factory<_i335.DonationDetailsRepo>(
      () => _i80.DonationDetailsRepoImple(),
    );
    gh.factory<_i133.RequestDetailsRepo>(() => _i763.RequestDetailsRepoImple());
    gh.factory<_i542.ForgetPasswordRepo>(() => _i827.ForgetPasswordRepoImple());
    gh.factory<_i631.AddDonationCubit>(
      () => _i631.AddDonationCubit(gh<_i133.RequestDetailsRepo>()),
    );
    gh.factory<_i389.EditProfileCubit>(
      () => _i389.EditProfileCubit(gh<_i533.EditProfileRepo>()),
    );
    gh.factory<_i658.MyRequestRepo>(() => _i818.MyRequestRepoImple());
    gh.factory<_i446.ForgetPasswordCubit>(
      () => _i446.ForgetPasswordCubit(gh<_i542.ForgetPasswordRepo>()),
    );
    gh.factory<_i643.MyRequestCubit>(
      () => _i643.MyRequestCubit(gh<_i658.MyRequestRepo>()),
    );
    gh.factory<_i935.DonationDetailsCubit>(
      () => _i935.DonationDetailsCubit(gh<_i335.DonationDetailsRepo>()),
    );
    return this;
  }
}
