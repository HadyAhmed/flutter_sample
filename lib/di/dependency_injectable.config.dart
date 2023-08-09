// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i6;
import 'package:firebase_performance/firebase_performance.dart' as _i8;
import 'package:firebase_storage/firebase_storage.dart' as _i10;
import 'package:flutter_sample/config/router/app_router.dart' as _i3;
import 'package:flutter_sample/data/datasource/source/local/app_config_ds.dart'
    as _i24;
import 'package:flutter_sample/data/datasource/source/local/app_preferences_ds.dart'
    as _i16;
import 'package:flutter_sample/data/datasource/source/remote/authentication_ds.dart'
    as _i17;
import 'package:flutter_sample/data/datasource/source/remote/posts_ds.dart'
    as _i11;
import 'package:flutter_sample/data/datasource/source/remote/users_ds.dart'
    as _i14;
import 'package:flutter_sample/data/repository/app_preferences_repo.dart'
    as _i25;
import 'package:flutter_sample/data/repository/post_repo.dart' as _i19;
import 'package:flutter_sample/data/repository/user_repo.dart' as _i21;
import 'package:flutter_sample/di/app_module.dart' as _i38;
import 'package:flutter_sample/domain/datasource/remote/authentication_ds_impl.dart'
    as _i18;
import 'package:flutter_sample/domain/datasource/remote/posts_ds_impl.dart'
    as _i12;
import 'package:flutter_sample/domain/datasource/remote/users_ds_impl.dart'
    as _i15;
import 'package:flutter_sample/domain/repository/app_preferences_repo_impl.dart'
    as _i26;
import 'package:flutter_sample/domain/repository/posts_repo_impl.dart' as _i20;
import 'package:flutter_sample/domain/repository/user_repo_impl.dart' as _i22;
import 'package:flutter_sample/domain/usecase/app_preferences/get_dark_mode_pref_uc.dart'
    as _i29;
import 'package:flutter_sample/domain/usecase/app_preferences/set_dark_mode_pref_uc.dart'
    as _i36;
import 'package:flutter_sample/domain/usecase/posts/add_post_uc.dart' as _i23;
import 'package:flutter_sample/domain/usecase/posts/get_recently_posts_uc.dart'
    as _i30;
import 'package:flutter_sample/domain/usecase/user/create_account_uc.dart'
    as _i27;
import 'package:flutter_sample/domain/usecase/user/get_account_data_uc.dart'
    as _i28;
import 'package:flutter_sample/domain/usecase/user/get_user_data_uc.dart'
    as _i31;
import 'package:flutter_sample/domain/usecase/user/get_user_uc.dart' as _i32;
import 'package:flutter_sample/domain/usecase/user/login_uc.dart' as _i33;
import 'package:flutter_sample/domain/usecase/user/logout_uc.dart' as _i34;
import 'package:flutter_sample/domain/usecase/user/reset_password_uc.dart'
    as _i35;
import 'package:flutter_sample/domain/usecase/user/update_name_uc.dart' as _i37;
import 'package:flutter_sample/service/firebase_service.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

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
    final appModule = _$AppModule();
    gh.factory<_i3.AppRouter>(() => _i3.AppRouter());
    gh.factory<_i4.FirebaseAnalytics>(() => appModule.analytics);
    gh.factory<_i5.FirebaseAuth>(() => appModule.auth);
    gh.factory<_i6.FirebaseCrashlytics>(() => appModule.crashlytics);
    gh.factory<_i7.FirebaseFirestore>(() => appModule.store);
    gh.factory<_i8.FirebasePerformance>(() => appModule.performance);
    await gh.factoryAsync<_i9.FirebaseService>(
      () => appModule.fireService,
      preResolve: true,
    );
    gh.factory<_i10.FirebaseStorage>(() => appModule.storage);
    gh.factory<_i11.PostsDataSource>(() => _i12.PostsDataSourceImpl(
          gh<_i7.FirebaseFirestore>(),
          gh<_i5.FirebaseAuth>(),
          gh<_i10.FirebaseStorage>(),
        ));
    await gh.factoryAsync<_i13.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i14.UsersDataSource>(() => _i15.UsersDataSourceImpl(
          gh<_i7.FirebaseFirestore>(),
          gh<_i5.FirebaseAuth>(),
        ));
    gh.factory<_i16.AppPreferencesDataSource>(
        () => _i16.AppPreferencesDataSource(gh<_i13.SharedPreferences>()));
    gh.factory<_i17.AuthenticationDataSource>(
        () => _i18.AuthenticationDataSourceImpl(
              gh<_i5.FirebaseAuth>(),
              gh<_i7.FirebaseFirestore>(),
            ));
    gh.factory<_i19.PostRepository>(
        () => _i20.PostsRepositoryImpl(gh<_i11.PostsDataSource>()));
    gh.factory<_i21.UserRepo>(() => _i22.UserRepoImpl(
          gh<_i17.AuthenticationDataSource>(),
          gh<_i14.UsersDataSource>(),
        ));
    gh.factory<_i23.AddPostUseCase>(
        () => _i23.AddPostUseCase(gh<_i19.PostRepository>()));
    gh.factory<_i24.AppConfigurationsDataSource>(() =>
        _i24.AppConfigurationsDataSource(gh<_i16.AppPreferencesDataSource>()));
    gh.factory<_i25.AppPreferencesRepo>(() =>
        _i26.AppPreferencesRepoImpl(gh<_i24.AppConfigurationsDataSource>()));
    gh.factory<_i27.CreateAccountUseCase>(
        () => _i27.CreateAccountUseCase(gh<_i21.UserRepo>()));
    gh.factory<_i28.GetAccountDataUseCase>(
        () => _i28.GetAccountDataUseCase(gh<_i21.UserRepo>()));
    gh.factory<_i29.GetDarkModeUseCase>(
        () => _i29.GetDarkModeUseCase(gh<_i25.AppPreferencesRepo>()));
    gh.factory<_i30.GetRecentlyPostsUseCase>(
        () => _i30.GetRecentlyPostsUseCase(gh<_i19.PostRepository>()));
    gh.factory<_i31.GetUserDataUseCase>(
        () => _i31.GetUserDataUseCase(gh<_i21.UserRepo>()));
    gh.factory<_i32.GetUserUseCase>(
        () => _i32.GetUserUseCase(gh<_i21.UserRepo>()));
    gh.factory<_i33.LoginUseCase>(() => _i33.LoginUseCase(gh<_i21.UserRepo>()));
    gh.factory<_i34.LogoutUseCase>(
        () => _i34.LogoutUseCase(gh<_i21.UserRepo>()));
    gh.factory<_i35.ResetPasswordUseCase>(
        () => _i35.ResetPasswordUseCase(gh<_i21.UserRepo>()));
    gh.factory<_i36.SetDarkModeUseCase>(
        () => _i36.SetDarkModeUseCase(gh<_i25.AppPreferencesRepo>()));
    gh.factory<_i37.UpdateNameUseCase>(
        () => _i37.UpdateNameUseCase(gh<_i21.UserRepo>()));
    return this;
  }
}

class _$AppModule extends _i38.AppModule {}
