import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomad_flutter_2nd_final/firebase_options.dart';
import 'package:nomad_flutter_2nd_final/routers.dart';

// A Counter example implemented with riverpod

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

// Light and dark ColorSchemes made by FlexColorScheme v7.3.1.
// These ColorScheme objects require Flutter 3.7 or later.
const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff8b5000),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffffdcbe),
  onPrimaryContainer: Color(0xff141210),
  secondary: Color(0xffb6602f),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffffede6),
  onSecondaryContainer: Color(0xff141413),
  tertiary: Color(0xff466827),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffc6ef9f),
  onTertiaryContainer: Color(0xff11140e),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff141212),
  background: Color(0xfffbfaf8),
  onBackground: Color(0xff090909),
  surface: Color(0xfffbfaf8),
  onSurface: Color(0xff090909),
  surfaceVariant: Color(0xffe8e5e0),
  onSurfaceVariant: Color(0xff121111),
  outline: Color(0xff7c7c7c),
  outlineVariant: Color(0xffc8c8c8),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff141210),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xfff5cc95),
  surfaceTint: Color(0xff8b5000),
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffffb871),
  onPrimary: Color(0xff14120c),
  primaryContainer: Color(0xff6a3c00),
  onPrimaryContainer: Color(0xfff0e9df),
  secondary: Color(0xffffdbcb),
  onSecondary: Color(0xff141413),
  secondaryContainer: Color(0xff552000),
  onSecondaryContainer: Color(0xffede4df),
  tertiary: Color(0xffabd285),
  onTertiary: Color(0xff11140e),
  tertiaryContainer: Color(0xff2f4f11),
  onTertiaryContainer: Color(0xffe7ece2),
  error: Color(0xffffb4ab),
  onError: Color(0xff141211),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xfff6dfe1),
  background: Color(0xff1d1915),
  onBackground: Color(0xffedecec),
  surface: Color(0xff1d1915),
  onSurface: Color(0xffedecec),
  surfaceVariant: Color(0xff463f38),
  onSurfaceVariant: Color(0xffe1e0df),
  outline: Color(0xff7d7676),
  outlineVariant: Color(0xff2e2c2c),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfffffbf7),
  onInverseSurface: Color(0xff141313),
  inversePrimary: Color(0xff775d3f),
  surfaceTint: Color(0xffffb871),
);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      // theme: FlexThemeData.light(scheme: FlexScheme.sakura),
      // darkTheme: FlexThemeData.dark(scheme: FlexScheme.sakura),
      // Theme config for FlexColorScheme version 7.3.x. Make sure you use

      theme: FlexThemeData.light(
        scheme: FlexScheme.orangeM3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 7,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.orangeM3,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 13,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          useTextTheme: true,
          useM2StyleDividerInM3: true,
          alignedDropdown: true,
          useInputDecoratorThemeInDialogs: true,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        // To use the Playground font, add GoogleFonts package and uncomment
        // fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,

      routerConfig: ref.watch(routerProvider),
    );
  }
}
