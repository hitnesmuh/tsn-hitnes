import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';

class SizeItem extends StatelessWidget {
  final int status;
  final String name;

  const SizeItem({
    Key? key,
    required this.status,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    kBackgroundColor() {
      switch (status) {
        case 0:
          return kWhiteColor;
        case 1:
          return kAvailableColor;
        case 2:
          return kUnavailableColor;
        default:
          return kGreyColor;
      }
    }

    borderColor() {
      switch (status) {
        case 0:
          return kBlackColor;
        case 1:
          return kPrimaryColor;
        case 2:
          return kAvailableColor;
        default:
          return kBlackColor;
      }
    }

    child() {
      switch (status) {
        case 0:
          return Center(
            child: Text(
              name,
              style: blackTextstyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          );
        case 1:
          return Center(
            child: Text(
              name,
              style: blueTextstyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          );
        case 2:
          return Center(
            child: Text(
              name,
              style: blackTextstyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          );
        default:
          return Center(
            child: Text(
              name,
              style: blackTextstyle.copyWith(
                fontWeight: semiBold,
              ),
            ),
          );
      }
    }

    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: kBackgroundColor(),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: borderColor(),
          width: 2,
        ),
      ),
      child: child(),
    );
  }
}
