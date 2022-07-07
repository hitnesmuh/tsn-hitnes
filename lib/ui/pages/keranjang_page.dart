import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/cubit/product_cubit.dart';
import 'package:tsn_technical_hitnes/models/keranjang_model.dart';
import 'package:tsn_technical_hitnes/models/product_model.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';
import 'package:tsn_technical_hitnes/ui/widget/product_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KeranjangPage extends StatelessWidget {
  final KeranjangModel keranjang;

  const KeranjangPage(this.keranjang, {Key? key}) : super(key: key);

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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Keranjang',
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

    Widget productBasket(List<ProductModel> products) {
      return Container(
        child: Column(
          children: products.map((ProductModel product) {
            return ProductTile(keranjang);
          }).toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: kRedColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProductSuccess) {
            return ListView(
              children: [
                header(),
                productBasket(state.products),
              ],
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
