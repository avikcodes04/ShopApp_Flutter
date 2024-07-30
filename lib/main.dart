import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
import 'package:shop_app_flutter/pages/home_page.dart';
//import 'package:shop_app_flutter/home_page.dart';
//import 'package:shop_app_flutter/product_details_page.dart';
//import 'package:shop_app_flutter/global_variable.dart';
//import 'package:shop_app_flutter/cart_page.dart';



void main()  {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        // Add other providers here if needed
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChangeNotifier() ,
      child: MaterialApp(
        
        debugShowCheckedModeBanner: false,
        title: 'Shopping App',
          
        theme: ThemeData(
          fontFamily: 'Lato',
      
          useMaterial3: true,
      
          colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1)
          ),
      
          appBarTheme: const AppBarTheme(
            titleTextStyle:  TextStyle(
              fontSize: 20,
              color: Colors.black
      
            )
          ),
      
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 138, 138, 138),
              
      
            ),
            
            prefixIconColor: Color.fromARGB(221, 144, 144, 144),
          ),
      
      
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
              
              ),
              bodySmall: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
      
          ),
              
      
        ),
         home:  const HomePage()
      ),
    );
  }
}

