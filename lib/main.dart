import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'config/app_router.dart';
import 'config/settings_storage.dart';
import 'config/theme.dart';
import 'firebase_options.dart';
import 'injectable.dart';
import 'l10n/l10n.dart';
import 'logic/bloc/settings_bloc/settings_bloc.dart';
import 'logic/cubit/post_loader_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:  DefaultFirebaseOptions.currentPlatform,
  );
  await SettingsStorage.init();

  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostLoaderCubit>(
          create: (context) => getIt.get<PostLoaderCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<SettingsBloc>(),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Reddit feed',
            theme: appThemeData[state.theme],
            initialRoute: '/',
            onGenerateRoute: AppRouter.onGenerateRoute,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate
            ],
          );
        },
      ),
    );
  }
}
