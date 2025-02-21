import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_app/app_theme_provider.dart';
import 'package:theme_app/ui_helper.dart';

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
        themeMode: provider.isDark ?ThemeMode.dark:ThemeMode.light ,
        darkTheme: MyAppTheme.darkTheme(),
        theme: MyAppTheme.lightTheme(),
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
  var title="Light";


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
          Text("Hey i'm Above This...",style:themeData.textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold)),
          Container(height:200,width:300,
            //themeMode: ThemeMode.light, => bg=white & box= black,blue
            //themeMode: ThemeMode.dark  => bg=black  & box= white,purple
            //container color
            color: secoundaryColor,
            //print hello Dark text
            child: Center(
              child: Text("Hey this is $title",
                style: themeData.textTheme.bodyMedium!.copyWith(color: textSecondaryColor,fontWeight: FontWeight.bold)
              ),
            ),
          ),

          Container(width: 200,margin: EdgeInsets.all(11),
              child: ElevatedButton(onPressed: (){
              },
                  style: themeData.elevatedButtonTheme.style,
                  child: Text("Login",style: themeData.textTheme.labelMedium!.copyWith(color: textSecondaryColor),)
              )),


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
      title="Light";

    }
  }
}
