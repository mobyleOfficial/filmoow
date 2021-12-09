import 'package:filmoow/generated/l10n.dart';
import 'package:filmoow/infrastructure/routes/route_name_builder.dart';
import 'package:filmoow/presentation/common/filmoow_general_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  Provider.debugCheckInvalidValueType = null;

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    FilmoowGeneralProvider(
      (_) => const ChallengeApp(),
    ),
  );
}

class ChallengeApp extends StatelessWidget {
  const ChallengeApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        // theme: ThemeData(
        //   primarySwatch: MaterialColor(),
        // ),
        onGenerateTitle: (context) => S.of(context).applicationName,
        initialRoute: RouteNameBuilder.getInitialRoute(),
        onGenerateRoute: Provider.of<RouteFactory>(
          context,
          listen: false,
        ),
      );
}
