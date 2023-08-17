import 'package:core/CORE/API/my_dio.dart';
import 'package:core/CORE/cubits/internet/internet_cubit.dart';
import 'package:core/CORE/cubits/language/language_cubit.dart';
import 'package:core/CORE/features/Login_Screen/View/login_screen.dart';
import 'package:core/CORE/features/Register_Screen/View/register_screen.dart';
import 'package:core/CORE/features/Splash_Screen/splash_screen.dart';
import 'package:core/CORE/shared_preferences/my_shared.dart';
import 'package:core/CORE/styles/theme_provider.dart';
import 'package:core/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyShared.init();
  await MyDio.init();
  runApp(ChangeNotifierProvider<ThemeProvider>(
      create: (_) =>
      ThemeProvider()
        ..initialize(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      InternetCubit()
        ..checkConnection(),
      child: BlocProvider(
        create: (context) => LanguageCubit(),
        child: BlocBuilder<LanguageCubit, LanguageState>(
          builder: (context, state) {
            return ResponsiveSizer(
              builder: (context, orientation, screenType) {
                return Consumer<ThemeProvider>(
                  builder: (context, provider, child) {
                    return MaterialApp(
                      key: ValueKey(MyShared.getCurrentLanguage()),
                      debugShowCheckedModeBanner: false,
                      locale: Locale(MyShared.getCurrentLanguage()),
                      supportedLocales: S.delegate.supportedLocales,
                      localizationsDelegates:  const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                      ],
                      theme: ThemeData(fontFamily: 'poppins',
                                     appBarTheme: AppBarTheme(
                        systemOverlayStyle: SystemUiOverlayStyle.light,
                      ),
                          ) ,
                      darkTheme: ThemeData.dark(),
                      themeMode: provider.themeMode,
                      home: const SplashScreen(),
                      builder: EasyLoading.init(),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}