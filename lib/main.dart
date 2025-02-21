import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //Theme brightness(Material Theme)
      darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.light,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        //platform Britness
        brightness: Brightness.light,
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:HomePage() ,
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var mqData=MediaQuery.of(context);
    print("Platform: ${mqData.platformBrightness}");
    var themeData=Theme.of(context);
    print("Theme: ${themeData.brightness}");
    var isDark= themeData.brightness==Brightness.dark;


    return Scaffold(
      //screen Background color
      backgroundColor: isDark ? Colors.black : Colors.white,
      body: Center(child: Container(height:200,width:300,
        //themeMode: ThemeMode.light, => bg=white & box= black,blue
        //themeMode: ThemeMode.dark  => bg=black  & box= white,purple
        //container color
        color: isDark ? Colors.purple : Colors.blue,
        //print hello Dark text
        child: Text("HELLO ${isDark ?"Dark":"White"}",
          style: TextStyle(
            //text color
              color: isDark ? Colors.red : Colors.yellow,fontSize: 40),
        ),
      )),
    );
  }
}
