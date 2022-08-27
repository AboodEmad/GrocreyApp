import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/payment_api_controller.dart';
import 'package:grocery_app/get/payment_getx_controller.dart';
import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/model/payment.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/context_extenssion.dart';

import '../../model/payment_card.dart';
import '../../utils/custom_paint/payment_custom_paint.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text_field.dart';
import '../../widget/payment_radio_button.dart';

class AddNewPaymentOptionScreen extends StatefulWidget {
  AddNewPaymentOptionScreen({Key? key, this.payment}) : super(key: key);

  Payment? payment;

  @override
  State<AddNewPaymentOptionScreen> createState() =>
      _AddNewPaymentOptionScreenState();
}

class _AddNewPaymentOptionScreenState extends State<AddNewPaymentOptionScreen> {
  late TextEditingController _cardNameTextController,
      _cardNumberTextController,
      _expireDateTextController,
      _cvvTextController;

  bool _default = false;

  String? _selectedType;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cardNameTextController = TextEditingController()
      ..text = widget.payment != null ? widget.payment!.holderName : "";
    _cardNumberTextController = TextEditingController()
      ..text = widget.payment != null ? widget.payment!.cardNumber : "";
    _cvvTextController = TextEditingController()
      ..text = widget.payment != null ? widget.payment!.cvv : "";
    _expireDateTextController = TextEditingController()
      ..text = widget.payment != null ? widget.payment!.expDate : "";
    _selectedType = widget.payment != null ? widget.payment!.type : null;
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
        title: const Text("Add Card"),
        actions: [
          IconButton(
            onPressed: () => _deleteCard(payment: widget.payment!),
            icon: const Icon(
              Icons.delete,
              color: AppColors.red,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.lightGrey,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 26.h),
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 217.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xff294566),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: CustomPaint(
              painter: PaymentCustomPaint(),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
                children: [
                  Text(
                    "John Smith",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 24.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 76.h,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "4756 ",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 24.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          const TextSpan(text: "  "),
                          TextSpan(
                            text: "*********",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 18.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: "  "),
                          TextSpan(
                            text: "9018",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 18.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "\$3.469.52",
                    style: GoogleFonts.nunitoSans(
                        fontSize: 24.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: AppColors.white,
            ),
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 26.h,
              ),
              children: [
                AppTextField(
                  textFiledController: _cardNameTextController,
                  labelText: "Holder Name",
                ),
                SizedBox(
                  height: 10.h,
                ),
                AppTextField(
                  textFiledController: _cardNumberTextController,
                  inputType: const TextInputType.numberWithOptions(
                    signed: false,
                    decimal: false,
                  ),
                  labelText: "Card Number",
                  formats: [
                    LengthLimitingTextInputFormatter(16),
                    FilteringTextInputFormatter.digitsOnly
                  ],
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
                        inputType: const TextInputType.numberWithOptions(
                          signed: false,
                          decimal: false,
                        ),
                        labelText: "CVV",
                        formats: [
                          LengthLimitingTextInputFormatter(3),
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.grey, width: 1),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                    child: DropdownButton<String>(
                      underline: const SizedBox(),
                      isExpanded: true,
                      isDense: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColors.grey,
                      ),
                      elevation: 1,
                      alignment: AlignmentDirectional.centerStart,
                      borderRadius: BorderRadius.circular(5.r),
                      enableFeedback: true,
                      autofocus: true,
                      hint: Text(
                        "Choose Cart Type",
                        style: GoogleFonts.nunitoSans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                      items: [
                        DropdownMenuItem<String>(
                          value: "Visa",
                          child: Text(
                            "Visa",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        DropdownMenuItem<String>(
                          value: "MasterCard",
                          child: Text(
                            "MasterCard",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                      onChanged: (String? id) {
                        setState(() => _selectedType = id);
                      },
                      value: _selectedType,
                    ),
                  ),
                ),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  activeColor: AppColors.white,
                  activeTrackColor: AppColors.primary,
                  //************
                  inactiveTrackColor: AppColors.lightGrey,
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
                  value: _default,
                  onChanged: (bool value) {
                    setState(() => _default = value);
                  },
                ),
                AppButton(
                  backgroundColor: AppColors.primary,
                  textColor: AppColors.white,
                  content: "Add Card",
                  onPressed: () {
                    _performCreateCard();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _performCreateCard() {
    if (_checkData()) {
      _createCard();
    }
  }

  bool _checkData() {
    if (_cvvTextController.text.isNotEmpty &&
        _cardNumberTextController.text.isNotEmpty &&
        _cardNameTextController.text.isNotEmpty &&
        _selectedType != null &&
        _expireDateTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data', error: true);
    return false;
  }

  Payment get payment {
    return Payment(
      id: widget.payment != null ? widget.payment!.id : null,
      holderName: _cardNameTextController.text,
      cardNumber: _cardNumberTextController.text,
      expDate: _expireDateTextController.text,
      cvv: _cvvTextController.text,
      type: _selectedType!,
    );
  }

    void _createCard() async {
      ApiResponse res;
      if (widget.payment == null) {
        res = await PaymentGetController.to.createNewPayment(payment);
      } else {
        payment.id = widget.payment!.id;
        res = await PaymentGetController.to.updatePayment(payment);
      }
      if(_default){
        Payment p = res.model as Payment;
        PaymentGetController.to.setDefaultPayment(p);
      }
      // ignore: use_build_context_synchronously
      context.showSnackBar(
        message: res.message,
        error: !res.status,
      );
      if (res.status) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
    }

    void _deleteCard({required Payment payment}) async {
      var res = await PaymentGetController.to.deletePayment(payment);
      // ignore: use_build_context_synchronously
      context.showSnackBar(message: res.message, error: !res.status);
      if (res.status) {
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      }
    }
  }
