import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/cubit/auth_cubit.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';
import 'package:tsn_technical_hitnes/ui/widget/custom_button.dart';
import 'package:tsn_technical_hitnes/ui/widget/custom_text_form_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

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
                  content: Text(state.error),
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
              title: 'Masuk',
              onPressed: () {
                context.read<AuthCubit>().signIn(
                    email: emailController.text,
                    password: passwordController.text);
              },
            );
          },
        );
      }

      Widget buatAkun() {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/sign-up');
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              top: 28,
              bottom: 20,
            ),
            child: Text(
              'Buat Akun',
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
          margin: EdgeInsets.only(top: 170),
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
              emailInput(),
              passwordInput(),
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
        margin: EdgeInsets.only(top: 52),
        child: Text(
          'Form Login',
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
