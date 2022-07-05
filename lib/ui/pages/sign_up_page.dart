import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';
import 'package:tsn_technical_hitnes/ui/pages/sign_in_page.dart';
import 'package:tsn_technical_hitnes/ui/widget/custom_button.dart';
import 'package:tsn_technical_hitnes/ui/widget/custom_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
        );
      }

      Widget emailInput() {
        return CustomTextFormField(
          hintText: 'Email',
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          hintText: 'Password',
        );
      }

      Widget noHpInput() {
        return CustomTextFormField(
          hintText: 'Nomor HP',
        );
      }

      Widget submitButton() {
        return CustomButton(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          title: 'Buat Aun',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignInPage(),
              ),
            );
          },
        );
      }

      Widget buatAkun() {
        return Container(
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
