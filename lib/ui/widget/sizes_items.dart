import 'package:flutter/material.dart';
import 'package:tsn_technical_hitnes/cubit/size_cubit.dart';
import 'package:tsn_technical_hitnes/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeItem extends StatelessWidget {
  final String name;
  final bool isAvailable;
  final String id;

  const SizeItem({
    Key? key,
    required this.name,
    this.isAvailable = true,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SizeCubit>().isSelected(id);

    kBackgroundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        return kPrimaryColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            name,
            style: whiteTextstyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
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

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SizeCubit>().selesctSize(id);
        }
      },
      child: Container(
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
      ),
    );
  }
}
