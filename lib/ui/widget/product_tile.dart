import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tsn_technical_hitnes/models/keranjang_model.dart';
import 'package:tsn_technical_hitnes/models/product_model.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';

class ProductTile extends StatelessWidget {
  final KeranjangModel keranjang;

  const ProductTile(
    this.keranjang, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(
          top: 20,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
          border: Border.all(
            color: kBlackColor,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    keranjang.product.imageUrl,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    keranjang.product.name,
                    style: blackTextstyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    keranjang.selectedSize,
                    style: blackTextstyle.copyWith(fontWeight: light),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rp. ',
                      decimalDigits: 0,
                    ).format(keranjang.price),
                    style: blackTextstyle.copyWith(fontWeight: light),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
