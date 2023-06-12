import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/application/bloc/bloc_search_bloc.dart';
import 'package:netflix/application/bloc_download/downloads_bloc_bloc.dart';
import 'package:netflix/domain/core/di/injectable.dart';
import 'package:netflix/presentation/dashboard/widgets/dashboard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<DownloadsBlocBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<BlocSearchBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            scaffoldBackgroundColor: Colors.red,
            primarySwatch: Colors.blue,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            textTheme:
                const TextTheme(bodyLarge: TextStyle(color: Colors.white))),
        darkTheme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
            scaffoldBackgroundColor: Colors.black,
            textTheme:
                const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
        themeMode: ThemeMode.dark,
        home: Dashboard(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
