import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cache/constants/colors.dart' show AppColors;
import 'package:home_cache/constants/app_typo_graphy.dart';
import 'package:home_cache/view/home/account/widgets/credit_card_widget.dart';
import 'package:home_cache/view/widget/appbar_back_widget.dart';
import 'package:home_cache/view/widget/text_button_widget.dart';
import 'package:home_cache/view/widget/text_field_widget.dart';

class CardInfoScreen extends StatefulWidget {
  const CardInfoScreen({super.key});

  @override
  State<CardInfoScreen> createState() => _CardInfoScreenState();
}

class _CardInfoScreenState extends State<CardInfoScreen> {
  bool isChecked = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  String cardNumber = '**** **** **** ****';
  String expiryDate = 'MM/YY';
  String cardHolderName = 'CARD HOLDER';
  String cvvCode = '***';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBack(),
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Credit Card',
                style: AppTypoGraphy.bold.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 12.h),
              CreditCardViewCustom(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
              ),
              SizedBox(height: 24.h),
              Text(
                'Cardholder name',
                style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(controller: nameController),
              SizedBox(height: 16.h),
              Text(
                'Card number',
                style: AppTypoGraphy.semiBold.copyWith(color: AppColors.black),
              ),
              SizedBox(height: 6.h),
              TextFieldWidget(
                controller: numberController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expires',
                          style: AppTypoGraphy.semiBold
                              .copyWith(color: AppColors.black),
                        ),
                        SizedBox(height: 6.h),
                        TextFieldWidget(
                          controller: expiryController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV',
                          style: AppTypoGraphy.semiBold
                              .copyWith(color: AppColors.black),
                        ),
                        SizedBox(height: 6.h),
                        TextFieldWidget(
                          controller: cvvController,
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 16.h),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    activeColor: AppColors.primary,
                  ),
                  Text(
                    'Save Card details for next time.',
                    style: AppTypoGraphy.regular.copyWith(color: AppColors.black),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.w),
                child: Column(
                  children: [
                    TextWidgetButton(
                      text: 'Add Card',
                      onPressed: () {
                        setState(() {
                          cardHolderName = nameController.text.isEmpty
                              ? 'CARD HOLDER'
                              : nameController.text;
                          cardNumber = numberController.text.isEmpty
                              ? '**** **** **** ****'
                              : numberController.text;
                          expiryDate = expiryController.text.isEmpty
                              ? 'MM/YY'
                              : expiryController.text;
                          cvvCode = cvvController.text.isEmpty
                              ? '***'
                              : cvvController.text;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
