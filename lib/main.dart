import 'package:agdmm_design/injection.dart';
import 'package:agdmm_design/language_cubit.dart';
import 'package:agdmm_design/screens/my_home_page.dart';
import 'package:agdmm_design/translations/codegen_loader.g.dart';
import 'package:agdmm_design/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(), //path_provider
  );
  configureInjection(Environment.prod);
  HydratedBlocOverrides.runZoned(
    () => runApp(
      EasyLocalization(
          path: 'assests/translations',
          supportedLocales: const [
            Locale('en'),
            Locale('bn'),
          ],
          fallbackLocale: const Locale('en'),
          assetLoader: const CodegenLoader(),
          child: const MyApp()),
    ),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LanguageCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: LocaleKeys.title_text.tr(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: LocaleKeys.title_text.tr()),
      ),
    );
  }
}
