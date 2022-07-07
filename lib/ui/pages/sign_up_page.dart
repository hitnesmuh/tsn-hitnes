import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/cubit/auth_cubit.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';
import 'package:tsn_technical_hitnes/ui/widget/custom_button.dart';
import 'package:tsn_technical_hitnes/ui/widget/custom_text_form_field.dart';
import 'package:bloc/bloc.dart';
import 'package:tsn_technical_hitnes/models/user_model.dart';
import 'package:tsn_technical_hitnes/services/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController noHpController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 40,
              ),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_arrow.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget inputSelection() {
      Widget nameInput() {
        return CustomTextFormField(
          hintText: 'Nama Lengkap',
          controller: nameController,
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          hintText: 'Email',
          controller: emailController,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          hintText: 'Password',
          obsecureText: true,
          controller: passwordController,
        );
      }

      Widget noHpInput() {
        return CustomTextFormField(
          hintText: 'Nomor HP',
          controller: noHpController,
        );
      }

      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/shop', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: kRedColor,
                  content: Text(state.toString()),
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomButton(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              title: 'Buat Aun',
              onPressed: () {
                context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    noHp: noHpController.text);
              },
            );
          },
        );
      }

      Widget buatAkun() {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 28,
              bottom: 20,
            ),
            child: Text(
              'Sudah Punya Akun?',
              style: blackTextstyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        );
      }

      return Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 60),
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 50,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultRadius),
              topRight: Radius.circular(defaultRadius),
            ),
          ),
          child: Column(
            children: [
              nameInput(),
              emailInput(),
              passwordInput(),
              noHpInput(),
              submitButton(),
              buatAkun(),
            ],
          ),
        ),
      );
    }

    Widget title() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        margin: EdgeInsets.only(top: 40),
        child: Text(
          'Form Register',
          style: blueTextstyle.copyWith(
            fontSize: 30,
            fontWeight: bold,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            header(),
            title(),
            inputSelection(),
          ],
        ),
      ),
    );
  }
}
