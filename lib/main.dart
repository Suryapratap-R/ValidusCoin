import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:validus_coin/viewmodels/store_user_details_viewmodel.dart';

import './views/pages/profile.dart';
import './views/pages/watchlist.dart';
import 'models/userdetail_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Enforcing Portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await UserDetailsSharedPreference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        cardColor: const Color(0xFF1E1E3D),
        scaffoldBackgroundColor: const Color(0xFF171734),
        backgroundColor: const Color(0xFF171734),
        bottomNavigationBarTheme:
            Theme.of(context).bottomNavigationBarTheme.copyWith(
                  backgroundColor: const Color(0xFF171734),
                  unselectedItemColor: const Color(0xFFD2D2D2),
                ),
        colorScheme: const ColorScheme.dark().copyWith(
            secondary: const Color(0xFFFFC700),
            primary: const Color(0xFFA1A1A1)),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(
                displayLarge: GoogleFonts.inter(
                    fontSize: 36.0, fontWeight: FontWeight.w700, height: 1.3),
                displayMedium: GoogleFonts.inter(fontSize: 18, height: 1.3),
                displaySmall: GoogleFonts.workSans(fontSize: 20.0, height: 1.5),
                bodyMedium: GoogleFonts.workSans(fontSize: 18, height: 1.44),
                bodySmall: GoogleFonts.workSans(fontSize: 14, height: 1.18),
                labelMedium: GoogleFonts.workSans(
                    fontSize: 18, height: 1.44, color: const Color(0xFFD2D2D2)))
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _tabIndex = 0;

  final _tabs = [
    const Watchlist(),
    ChangeNotifierProvider<UserDetails>(
        create: (_) => UserDetails(), child: const Profile())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stocks'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Profile')
        ],
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
