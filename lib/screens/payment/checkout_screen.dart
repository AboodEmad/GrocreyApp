import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/oder_api_controller.dart';
import 'package:grocery_app/get/address_getx_controller.dart';
import 'package:grocery_app/get/payment_getx_controller.dart';
import 'package:grocery_app/model/address.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/utils/context_extenssion.dart';
import 'package:grocery_app/widget/address_radio_button.dart';
import 'package:grocery_app/widget/app_button.dart';
import 'package:grocery_app/widget/app_text_field.dart';
import 'package:grocery_app/widget/home_section.dart';
import 'package:grocery_app/widget/payment_radio_button.dart';

import '../../model/create_order.dart';
import '../../model/payment_card.dart';
import '../../utils/app_colors.dart';

class CheckoutScreen extends StatefulWidget {
  CheckoutScreen({Key? key, required this.cart}) : super(key: key);

  List<CartObj> cart;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  late TextEditingController _cardNameTextController,
      _cardNumberTextController,
      _expireDateTextController,
      _cvvTextController;

  String _paymentRadioValue = "Visa Card";

  bool _rememberCard = true;

  String addressId = "";

  List<PaymentCard> payments = [
    PaymentCard(text: "Master Card", img: "visa"),
    PaymentCard(text: "Visa Card", img: "visa"),
    PaymentCard(text: "Cash", img: "cash"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put<PaymentGetController>(PaymentGetController());
    var payment = PaymentGetController.to.defaultPayment;
    _cardNameTextController = TextEditingController()..text = payment != null ? payment.holderName : "";
    _cardNumberTextController = TextEditingController()..text = payment != null ? payment.cardNumber : "";
    _cvvTextController = TextEditingController()..text = payment != null ? payment.cvv : "";
    _expireDateTextController = TextEditingController()..text = payment != null ? payment.expDate : "";
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
            leading: "Delivery Address",
            leadingTextSize: 16,
            onPressed: () =>
                Navigator.pushNamed(context, AppScreens.deliveryAddressScreen),
          ),
          SizedBox(
            height: 10.h,
          ),
          GetBuilder<AddressGetController>(builder: (controller) {
            var address = controller.defaultAddress!;
            addressId = address.id.toString();
            return Container(
              constraints: BoxConstraints(
                maxHeight: 92.h,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 11.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                border: Border.all(
                  color: AppColors.primary,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 16.h,
                      maxWidth: 16.w,
                    ),
                    margin: EdgeInsets.only(top: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      border: Border.all(
                        color: AppColors.primary,
                        width: 2.w,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address.name,
                        style: GoogleFonts.nunitoSans(
                          height: 0,
                          fontSize: 14.sp,
                          color: AppColors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        address.contactNumber,
                        style: GoogleFonts.nunitoSans(
                          height: 0,
                          fontSize: 14.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        address.info,
                        style: GoogleFonts.nunitoSans(
                          height: 0,
                          fontSize: 14.sp,
                          color: AppColors.grey,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            );
          },),
          SizedBox(
            height: 18.h,
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
              maxHeight: 85.h,
              maxWidth: 135.w,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 20.w,
                childAspectRatio: 85.h / 135.w,
              ),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return PaymentRadioButton(
                  text: payments.elementAt(index).text,
                  img: payments.elementAt(index).img,
                  value: payments[index].text,
                  groupValue: _paymentRadioValue,
                  onChange: (String value) {
                    setState(() => _paymentRadioValue = value);
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 26.h,
          ),
          Visibility(
            visible: _paymentRadioValue != "Cash",
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                  value: _rememberCard,
                  onChanged: (bool value) {
                    setState(() => _rememberCard = value);
                  },
                ),
              ],
            ),
          ),
          AppButton(
            backgroundColor: AppColors.primary,
            textColor: AppColors.white,
            content: "Pay Now",
            onPressed: () => _createOrder(),
          ),
        ],
      ),
    );
  }

  void _createOrder() async {
    var response = await OrderApiController().createOrder(
      order: CreateOrder(
        paymentType: "Cash",
        addressId: AddressGetController.to.defaultAddress!.id.toString(),
        cart: widget.cart,
      ),
    );
    // ignore: use_build_context_synchronously
    context.showSnackBar(message: response.message, error: !response.status);
  }
}
