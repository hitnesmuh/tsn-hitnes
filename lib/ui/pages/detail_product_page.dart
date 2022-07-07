import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tsn_technical_hitnes/cubit/product_cubit.dart';
import 'package:tsn_technical_hitnes/cubit/size_cubit.dart';
import 'package:tsn_technical_hitnes/models/keranjang_model.dart';
import 'package:tsn_technical_hitnes/models/product_model.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';
import 'package:tsn_technical_hitnes/ui/pages/keranjang_page.dart';
import 'package:tsn_technical_hitnes/ui/widget/custom_button.dart';
import 'package:tsn_technical_hitnes/ui/widget/sizes_items.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailProductPage extends StatelessWidget {
  final ProductModel product;

  const DetailProductPage(this.product, {Key? key}) : super(key: key);

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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/shop');
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/shop');
                },
                child: Container(
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/keranjang');
              },
              child: Container(
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
                      image: NetworkImage(
                        product.imageUrl,
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
                    product.name,
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
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp. ',
                      decimalDigits: 0,
                    ).format(product.price),
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
                    id: 'S',
                    isAvailable: false,
                    name: 'S',
                  ),
                  SizeItem(
                    id: 'M',
                    name: 'M',
                  ),
                  SizeItem(
                    id: 'L',
                    name: 'L',
                  ),
                  SizeItem(
                    id: 'XL',
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
      return BlocBuilder<SizeCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            margin: EdgeInsets.only(
              left: defaultMargin,
              right: defaultMargin,
              top: 80,
              bottom: 30,
            ),
            title: 'Tambah Keranjang',
            onPressed: () {
              //int price = product.price = state.length;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => KeranjangPage(KeranjangModel(
                    product: product,
                    selectedSize: state.join(', '),
                    price: product.price,
                  )),
                ),
              );
            },
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
