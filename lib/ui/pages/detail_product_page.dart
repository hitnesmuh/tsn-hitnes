import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';
import 'package:tsn_technical_hitnes/ui/pages/keranjang_page.dart';
import 'package:tsn_technical_hitnes/ui/widget/custom_button.dart';
import 'package:tsn_technical_hitnes/ui/widget/sizes_items.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 20,
          bottom: 16,
        ),
        child: Row(
          children: [
            Container(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Detail Produk',
                    style: blackTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_basket.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget detailProduct() {
      return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: 390,
                  height: 334,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/image_blue_clothes.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: defaultMargin),
                  child: Text(
                    'Kaos Biru Polos',
                    style: blackTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: defaultMargin,
                    top: 10,
                  ),
                  child: Text(
                    'Rp. 100.000',
                    style: blackTextstyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget radioGander() {
      int _value = 1;
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: defaultMargin,
                    bottom: 10,
                  ),
                  child: Text(
                    'Pilih Jenis Kelamin',
                    style: blackTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: _value,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Pria',
                    style: blackTextstyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: defaultMargin,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Radio(
                    value: 0,
                    groupValue: _value,
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Wanita',
                    style: blackTextstyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget selectSize() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: defaultMargin,
                    bottom: 10,
                  ),
                  child: Text(
                    'Pilih Ukuran',
                    style: blackTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizeItem(
                    status: 0,
                    name: 'S',
                  ),
                  SizeItem(
                    status: 1,
                    name: 'M',
                  ),
                  SizeItem(
                    status: 2,
                    name: 'L',
                  ),
                  SizeItem(
                    status: 2,
                    name: 'XL',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget button() {
      return CustomButton(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          top: 80,
          bottom: 30,
        ),
        title: 'Tambah Keranjang',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => KeranjangPage(),
            ),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          header(),
          detailProduct(),
          radioGander(),
          selectSize(),
          button(),
        ],
      ),
    );
  }
}
