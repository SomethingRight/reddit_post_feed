// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes, comment_references
import 'package:flutter_test_app_reddit_get_posts/config/settings_storage.dart'
    as _i7;
import 'package:flutter_test_app_reddit_get_posts/domain/api/post_details_api.dart'
    as _i3;
import 'package:flutter_test_app_reddit_get_posts/domain/api/posts_api.dart'
    as _i5;
import 'package:flutter_test_app_reddit_get_posts/logic/bloc/post_details_bloc/post_details_bloc.dart'
    as _i4;
import 'package:flutter_test_app_reddit_get_posts/logic/bloc/settings_bloc/settings_bloc.dart'
    as _i6;
import 'package:flutter_test_app_reddit_get_posts/logic/cubit/post_loader_cubit.dart'
    as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

/// ignore_for_file: unnecessary_lambdas
/// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of main-scope dependencies inside of [GetIt]
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.PostDetailsApi>(() => _i3.PostDetailsApi());
    gh.factory<_i4.PostDetailsBloc>(
        () => _i4.PostDetailsBloc(repository: gh<_i3.PostDetailsApi>()));
    gh.factory<_i5.PostsApi>(() => _i5.PostsApi());
    gh.factory<_i6.SettingsBloc>(() => _i6.SettingsBloc());
    gh.factory<_i7.SettingsStorage>(() => _i7.SettingsStorage());
    gh.factory<_i8.PostLoaderCubit>(
        () => _i8.PostLoaderCubit(gh<_i5.PostsApi>()));
    return this;
  }
}
