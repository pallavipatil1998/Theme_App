import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/app_theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => AppThemeProvider(),
    child: MyApp(),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(builder: (_,provider,__){
      return MaterialApp(
        title: 'Flutter Demo',
        // Theme brightness(Material Theme)
        darkTheme: ThemeData.dark(),
        themeMode: provider.isDark ?ThemeMode.dark:ThemeMode.light ,
        theme: ThemeData(
          //platform Britness
          brightness: Brightness.light,
          primarySwatch: Colors.pink,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:HomePage() ,
      );
    });
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bgColor=Colors.white;
  var secoundaryColor=Colors.black;
  var textColor=Colors.black;
  var textSecondaryColor=Colors.white;
  late  bool isDark ;
  var title;


  @override
  Widget build(BuildContext context) {
    var mqData=MediaQuery.of(context);
    print("Platform: ${mqData.platformBrightness}");
    var themeData=Theme.of(context);
    print("Theme: ${themeData.brightness}");
    isDark= themeData.brightness==Brightness.dark;
    getThemeColors();


    return Scaffold(
      //screen Background color
      backgroundColor: bgColor,
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hello",style:TextStyle(color: textColor) ,),
          Container(height:200,width:300,
            //themeMode: ThemeMode.light, => bg=white & box= black,blue
            //themeMode: ThemeMode.dark  => bg=black  & box= white,purple
            //container color
            color: secoundaryColor,
            //print hello Dark text
            child: Center(
              child: Text("Welcome ${isDark ?"Dark":"White"}",
                style: TextStyle(
                  //text color
                    color:textSecondaryColor,fontSize: 40),
              ),
            ),

          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Dark Mode"),
              Switch(value: isDark, onChanged: (value){
                context.read<AppThemeProvider>().updateTheme(value);
              }),
            ],
          ),


        ],
      )),
    );
  }



  void getThemeColors(){
    if(isDark){
      //dark
      bgColor=Colors.black;
      secoundaryColor=Colors.white;
      textColor=Colors.white;
      textSecondaryColor=Colors.black;
      title="Dark";
    }else{
      bgColor=Colors.white;
      secoundaryColor=Colors.black;
      textColor=Colors.black;
      textSecondaryColor=Colors.white;
      title="Dark";

    }
  }
}
