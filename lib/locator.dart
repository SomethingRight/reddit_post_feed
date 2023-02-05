import 'package:get_it/get_it.dart';

import 'config/settings_storage.dart';
import 'domain/api/post_details_api.dart';
import 'domain/api/posts_api.dart';
import 'logic/bloc/post_details_bloc/post_details_bloc.dart';
import 'logic/bloc/settings_bloc/settings_bloc.dart';
import 'logic/cubit/post_loader_cubit.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // inside locator registered only classes
  locator
    //settings
    ..registerSingleton<SettingsStorage>(SettingsStorage())
    ..registerFactory<SettingsBloc>(SettingsBloc.new)
    // main screen load data
    ..registerLazySingleton<PostsApi>(PostsApi.new)
    ..registerFactory<PostLoaderCubit>(
        () => PostLoaderCubit(locator.get<PostsApi>()))
    //post details load data
    ..registerLazySingleton<PostDetailsApi>(PostDetailsApi.new)
    ..registerFactory<PostDetailsBloc>(() => PostDetailsBloc(repository: locator.get<PostDetailsApi>()));
   

    
    
   

  // TODO add getIt injectable package
  // add localization flutter_ntl rus eng
  // SOLID
}
