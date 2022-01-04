import 'package:flutter/material.dart';
import 'package:frontend_shamo/providers/cart_provider.dart';
import 'package:frontend_shamo/providers/transaction_provider.dart';
import 'package:frontend_shamo/providers/wishlist_provider.dart';
import 'package:provider/provider.dart';
import 'package:frontend_shamo/pages/cart_page.dart';
import 'package:frontend_shamo/pages/checkout_page.dart';
import 'package:frontend_shamo/pages/checkout_success_page.dart';
import 'package:frontend_shamo/pages/detail_chat_page.dart';
import 'package:frontend_shamo/pages/edit_profile_page.dart';
import 'package:frontend_shamo/pages/home/main_page.dart';
import 'package:frontend_shamo/pages/product_page.dart';
import 'package:frontend_shamo/pages/sign_in_page.dart';
import 'package:frontend_shamo/pages/sign_up_page.dart';
import 'package:frontend_shamo/pages/splash_page.dart';
import 'package:frontend_shamo/providers/auth_provider.dart';
import 'package:frontend_shamo/providers/product_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => TransactionProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChatPage(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
        // home: SplashPage(),
      ),
    );
  }
}
