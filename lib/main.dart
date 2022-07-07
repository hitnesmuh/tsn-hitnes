import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/cubit/auth_cubit.dart';
import 'package:tsn_technical_hitnes/cubit/keranjang_cubit.dart';
import 'package:tsn_technical_hitnes/cubit/page_cubit.dart';
import 'package:tsn_technical_hitnes/cubit/product_cubit.dart';
import 'package:tsn_technical_hitnes/cubit/size_cubit.dart';
import 'package:tsn_technical_hitnes/models/keranjang_model.dart';
import 'package:tsn_technical_hitnes/ui/pages/detail_product_page.dart';
import 'package:tsn_technical_hitnes/ui/pages/keranjang_page.dart';
import 'package:tsn_technical_hitnes/ui/pages/shop_page.dart';
import 'package:tsn_technical_hitnes/ui/pages/sign_in_page.dart';
import 'package:tsn_technical_hitnes/ui/pages/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
        BlocProvider(
          create: (context) => SizeCubit(),
        ),
        BlocProvider(
          create: (context) => KeranjangCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/shop': (context) => ShopPage(),
          //'/keranjang': (context) => KeranjangPage(),
        },
      ),
    );
  }
}
