import 'package:flutter/material.dart';
import '../theme/app_text_styles.dart';

Text large(
  String text, {
  Color? color,
  TextAlign? textAlign,
  FontWeight? fontWeight,
  int? maxLines,
  TextOverflow? overflow,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    style: AppTextStyles.headlineLarge.copyWith(
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

Text medium(
  String text, {
  Color? color,
  TextAlign? textAlign,
  FontWeight? fontWeight,
  int? maxLines,
  TextOverflow? overflow,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    style: AppTextStyles.headlineMedium.copyWith(
      color: color,
      fontWeight: fontWeight,
    ),
  );
}

Text small(
  String text, {
  Color? color,
  TextAlign? textAlign,
  FontWeight? fontWeight,
  int? maxLines,
  TextOverflow? overflow,
}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    style: AppTextStyles.bodyMedium.copyWith(
      color: color,
      fontWeight: fontWeight,
    ),
  );
}
