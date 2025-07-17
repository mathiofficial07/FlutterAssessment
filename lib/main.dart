// // import 'package:flutter/material.dart';
// // import 'package:lottie/lottie.dart';
// //
// // void main() {
// //   runApp(MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Lottie Example',
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(primarySwatch: Colors.blue),
// //       home: LottieExample(),
// //     );
// //   }
// // }
// //
// // class LottieExample extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Loading')),
// //       body: Center(
// //         child: Lottie.asset(
// //           'assets/lottieanimation.json', // Make sure this path is correct
// //           width: 200,
// //           height: 200,
// //           fit: BoxFit.contain,
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// //pageroutebuilder
// // import 'package:flutter/material.dart';
// //
// // void main() => runApp(MyApp());
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Slide Transition with Delay',
// //       home: FirstPage(),
// //       debugShowCheckedModeBanner: false,
// //     );
// //   }
// // }
// //
// // class FirstPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("First Page")),
// //       body: Center(
// //         child: ElevatedButton(
// //           child: Text("Go to Second Page"),
// //           onPressed: () {
// //             Navigator.of(context).push(_createSlideRouteWithDelay());
// //           },
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Route _createSlideRouteWithDelay() {
// //     return PageRouteBuilder(
// //       pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
// //       transitionDuration: Duration(milliseconds: 1000), // total time
// //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
// //         final curvedAnimation = CurvedAnimation(
// //           parent: animation,
// //           curve: Interval(
// //             0.3, 1.0, // start after 300ms
// //             curve: Curves.ease,
// //           ),
// //         );
// //
// //         final offsetTween = Tween<Offset>(
// //           begin: Offset(1.0, 0.0), // slide from right
// //           end: Offset.zero,
// //         );
// //
// //         return SlideTransition(
// //           position: curvedAnimation.drive(offsetTween),
// //           child: child,
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // class SecondPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Second Page")),
// //       body: Center(
// //         child: Text(
// //           "🎉 This is the Second Page!",
// //           style: TextStyle(fontSize: 24),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// // import 'package:flutter/material.dart';
// //
// // void main() => runApp(AnimatedButtonApp());
// //
// // class AnimatedButtonApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Curved Button Animation',
// //       debugShowCheckedModeBanner: false,
// //       home: CurvedButtonPage(),
// //     );
// //   }
// // }
// //
// // class CurvedButtonPage extends StatefulWidget {
// //   @override
// //   _CurvedButtonPageState createState() => _CurvedButtonPageState();
// // }
// //
// // class _CurvedButtonPageState extends State<CurvedButtonPage>
// //     with SingleTickerProviderStateMixin {
// //   late AnimationController _controller;
// //   late Animation<double> _scaleAnimation;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //
// //     // Animation Controller
// //     _controller = AnimationController(
// //       duration: Duration(milliseconds: 1000),
// //       vsync: this,
// //     );
// //
// //     // Curved Animation (you can try Curves.bounceOut, easeInOut, etc.)
// //     _scaleAnimation = CurvedAnimation(
// //       parent: _controller,
// //       curve: Curves.elasticOut,
// //     );
// //
// //     // Start the animation
// //     _controller.forward();
// //   }
// //
// //   @override
// //   void dispose() {
// //     _controller.dispose();
// //     super.dispose();
// //   }
// //
// //   // UI
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text('Curved Animation')),
// //       body: Center(
// //         child: ScaleTransition(
// //           scale: _scaleAnimation,
// //           child: ElevatedButton(
// //             onPressed: () {
// //               ScaffoldMessenger.of(context).showSnackBar(
// //                 SnackBar(content: Text("Hello Ghoster")),
// //               );
// //             },
// //             child: Text("Animated Button"),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'crud_firestore_page.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Firestore CRUD',
//       debugShowCheckedModeBanner: false,
//       home: CrudFirestorePage(),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'product_page.dart';

void main() {
  runApp(GetMaterialApp(
    home: ProductPage(),
    debugShowCheckedModeBanner: false,
  ));
}

