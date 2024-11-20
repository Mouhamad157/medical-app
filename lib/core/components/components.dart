
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/core/colors/colors.dart';
import '../texts/words.dart';
import '../utils/app_fonts.dart';
import '../utils/dimensions.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({
    required this.title,
    this.borderRadius,
     this.width,
     this.height,
    super.key,
  });
  final double? width ;
  final double? height ;
  final BorderRadiusGeometry? borderRadius ;
  final String title ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??ScreenDimensions.widthPercentage(context, 10),
      height: height??ScreenDimensions.heightPercentage(context, 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: borderRadius,),
      child: Text(
        title,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: TextStyle(
          fontSize: AppFonts.smallTitleFont(context),
          fontWeight: FontWeight.bold,
          color: AppColors.white
        ),
      ),
    );
  }
}

class MedicalHistoryCard extends StatelessWidget {
  const MedicalHistoryCard({
    super.key,
    required this.title,
    required this.imagePath,
    this.onTap,
  });
  final String title;
  final String imagePath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ScreenDimensions.widthPercentage(
            context, 15),
        height: ScreenDimensions.heightPercentage(
            context, 5),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(
                ScreenDimensions.radius(context, 0.5)),
            border: Border.all(color: Colors.grey[500]!)
        ),
        padding: EdgeInsets.symmetric(vertical: ScreenDimensions.heightPercentage(context, 0.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                title,style: TextStyle(
                fontSize: AppFonts.smallTitleFont(context))),
            CircleAvatar(
              radius: ScreenDimensions.radius(context, 3),
              child: Image.asset(
                imagePath,
                width: ScreenDimensions.widthPercentage(context, 10),
                height: ScreenDimensions.heightPercentage(context, 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          subtitle,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFonts.smallTitleFont(context)),
        ),
        Text(
          ' : ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFonts.smallTitleFont(context)),
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: AppFonts.smallTitleFont(context)),
        ),
      ],
    ).paddingSymmetric(
        horizontal: ScreenDimensions.widthPercentage(context, 2));
  }
}

class AppText extends StatelessWidget {
  AppText.smallBold({
    super.key,
    required this.text,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow
  }){
    small = true;
    fontWeight = FontWeight.bold;
  }

  AppText.subtitleBold({
    super.key,
    required this.text,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow
  }){
    fontWeight = FontWeight.bold;
    small = false;
  }

  AppText.subtitle({
    super.key,
    required this.text,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow
  }){
    fontWeight =null;
    small = false;
  }

  AppText.small({
    super.key,
    required this.text,
    this.textAlign,
    this.color,
    this.maxLines,
    this.overflow,
  }){
    small = true;
    fontWeight = null;
  }

  final String  text ;
  FontWeight? fontWeight ;
  final int? maxLines ;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final Color? color;
  bool? small;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
          fontWeight: fontWeight,
          color: color,
          fontSize: small!?AppFonts.smallTitleFont(context):AppFonts.subTitleFont(context)),
    );
  }
}

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.width,
    this.controller,
    this.textAlign,
    this.validator,
    this.onChanged,
    this.obscureText,
    this.enabled,
    this.maxLines,
    this.keyboardType,
    this.hintText,
    this.labelText,
  });


  final double? width;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool? obscureText;
  final bool? enabled;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width??ScreenDimensions.widthPercentage(context, 60),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: controller,
            textAlign: textAlign??TextAlign.center,
            validator: validator,
            obscureText: obscureText??false,
            maxLines: maxLines,
            onChanged: onChanged,
            keyboardType: keyboardType,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.primaryColor)),
              focusColor: AppColors.primaryColor,
              enabled: enabled??true,
              hintText: hintText,
              labelText: labelText,
              hintStyle: TextStyle(fontSize: AppFonts.smallTitleFont(context),fontWeight: FontWeight.bold),
              labelStyle: TextStyle(fontSize: AppFonts.smallTitleFont(context),fontWeight: FontWeight.bold),
            ),
          ),
        ),);
  }
}

class AppDropDownMenu extends StatelessWidget {
  const   AppDropDownMenu({
    super.key,
    this.width,
    this.height,
    this.alignment,
    required this.content,
    required this.items,
  });
final double? width;
final double? height;
final AlignmentGeometry? alignment;
final String content;
final List<PopupMenuEntry> items;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return items;
      },
      constraints: BoxConstraints.expand(
          width: width??ScreenDimensions.widthPercentage(context, 20),
        height: height??ScreenDimensions.widthPercentage(context, 6),),
      elevation: 1,
      child: Container(
        width: width ?? ScreenDimensions.widthPercentage(context, 20),
        height: height??ScreenDimensions.widthPercentage(context, 6),
        decoration: BoxDecoration(
            color: AppColors.white,
          border: Border.all(color: AppColors.primaryColor,),
            borderRadius: BorderRadius.circular(ScreenDimensions.radius(context, 1)),

        ),
        padding: EdgeInsets.symmetric(
          horizontal:width!=null? width!/10 : ScreenDimensions.widthPercentage(context, 1)
        ),
        alignment: alignment??Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.keyboard_arrow_down_rounded,color: AppColors.primaryColor,
                size:ScreenDimensions.widthPercentage(context, 3)),
            AppText.smallBold(text: content,textAlign: TextAlign.center,color: Colors.black),
          ],
        ),
      ),
    );
  }
}

class DrawerLisTile extends StatelessWidget {
  const DrawerLisTile({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        title: AppText.smallBold(
          text: title,
          color: AppColors.white,
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenDimensions.widthPercentage(context, 1)),
          child: Icon(
            icon,
            color: AppColors.white,
            size: ScreenDimensions.widthPercentage(context, 2),
          ),
        ),
        selected: true,
        splashColor: AppColors.red,
        selectedColor: Colors.red,
        hoverColor: AppColors.red,
        selectedTileColor: Colors.red,
        onTap: onTap,
        focusColor: Colors.red,
        tileColor: Colors.red,
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.onTap,required this.buttonName,
    this.width,this.height
  });
  final String buttonName;
  final double? width;
  final double? height;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? ScreenDimensions.widthPercentage(context, 40),
        height: height ?? ScreenDimensions.heightPercentage(context, 8),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(ScreenDimensions.radius(context, 1))
        ),
        alignment: Alignment.center,
        child: AppText.smallBold(text: buttonName,color: AppColors.white,),
      ),
    );
  }
}