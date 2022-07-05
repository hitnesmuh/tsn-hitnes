import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/cubit/page_cubit.dart';
import 'package:tsn_technical_hitnes/ui/pages/detail_product_page.dart';
import 'package:tsn_technical_hitnes/ui/pages/keranjang_page.dart';
import 'package:tsn_technical_hitnes/ui/pages/shop_page.dart';
import 'package:tsn_technical_hitnes/ui/pages/sign_in_page.dart';
import 'package:tsn_technical_hitnes/ui/pages/sign_up_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignUpPage(),
      ),
    );
  }
}
