import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/widget/address_radio_button.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/app_text_field.dart';
import 'package:grocery_app/widget/home_section.dart';
import 'package:grocery_app/widget/payment_radio_button.dart';

import '../model/payment_card.dart';
import '../utils/app_colors.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late TextEditingController _cardNameTextController,
      _cardNumberTextController,
      _expireDateTextController,
      _cvvTextController;

  int _addressRadioValue = 1;
  int _paymentRadioValue = 0;

  bool _notifications = false;

  List<PaymentCard> payments = [
    PaymentCard(text: "Master Card", img: "visa"),
    PaymentCard(text: "PayPal", img: "paypal"),
    PaymentCard(text: "Cash On Delivery", img: "cash"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cardNameTextController = TextEditingController();
    _cardNumberTextController = TextEditingController();
    _cvvTextController = TextEditingController();
    _expireDateTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _cardNameTextController.dispose();
    _cardNumberTextController.dispose();
    _cvvTextController.dispose();
    _expireDateTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Checkout"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 20.h,
        ),
        children: [
          HomeSection(
            leading: "Select delivery address",
            leadingTextSize: 16,
            trilling: "Add new",
            onPressed: () {},
          ),
          SizedBox(
            height: 18.h,
          ),
          AddressRadioButton(
            value: 1,
            groupValue: _addressRadioValue,
            onChange: (int? value) {
              setState(() => _addressRadioValue = value!);
            },
          ),
          AddressRadioButton(
            value: 2,
            groupValue: _addressRadioValue,
            marginBottom: 15.0,
            onChange: (int? value) {
              setState(() => _addressRadioValue = value!);
            },
          ),
          Text(
            "Select payment system",
            style: GoogleFonts.nunitoSans(
              fontSize: 16.sp,
              color: AppColors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 75.h,
              maxWidth: 135.w,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20.w,
                childAspectRatio: 75.h / 135.w,
              ),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return PaymentRadioButton(
                  text: payments.elementAt(index).text,
                  img: payments.elementAt(index).img,
                  value: index,
                  groupValue: _paymentRadioValue,
                  onChange: (int? value) {
                    setState(() => _paymentRadioValue = value!);
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          AppTextField(
            textFiledController: _cardNameTextController,
            labelText: "Card Name",
          ),
          SizedBox(
            height: 10.h,
          ),
          AppTextField(
            textFiledController: _cardNumberTextController,
            labelText: "Card Number",
            inputType: TextInputType.number,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: AppTextField(
                  textFiledController: _expireDateTextController,
                  labelText: "Expiration Date",
                  inputType: TextInputType.datetime,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: AppTextField(
                  textFiledController: _cvvTextController,
                  inputType: TextInputType.number,
                  labelText: "CVV",
                ),
              ),
            ],
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            activeColor: AppColors.white,
            activeTrackColor: AppColors.primary,
            //************
            inactiveTrackColor: AppColors.grey,
            inactiveThumbColor: AppColors.primary,
            title: Text(
              'Remeber My Card Details',
              style: GoogleFonts.nunitoSans(
                fontSize: 16.sp,
                height: 0,
                color: AppColors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
            value: _notifications,
            onChanged: (bool value) {
              setState(() => _notifications = value);
            },
          ),
          AppButton(
            backgroundColor: AppColors.primary,
            textColor: AppColors.white,
            content: "Pay Now",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
