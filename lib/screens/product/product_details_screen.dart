import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/get/cart_getx_controller.dart';
import 'package:grocery_app/get/products_getx_controller.dart';
import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/model/product.dart';
import 'package:grocery_app/screens/payment/checkout_screen.dart';
import 'package:grocery_app/utils/app_screens.dart';
import 'package:grocery_app/utils/context_extenssion.dart';
import 'package:grocery_app/widget/dialog/rate_dialog.dart';
import '../../api/controllers/products_api_controller.dart';
import '../../model/cart.dart';
import '../../model/create_order.dart';
import '../../utils/app_colors.dart';
import '../../widget/app_button.dart';
import '../../widget/page_view_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  Product product;

  ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late PageController _pageController;
  int _currentPage = 0;
  bool isAddedToCart = false;

  @override
  void initState() {
    super.initState();
    Get.put<CartGetxController>(CartGetxController());
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _rateDialog(double rate, String productId) {
    showDialog(
      context: context,
      builder: (context) {
        return RateDialog(
          rate: rate,
          productId: productId,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      backgroundColor: AppColors.white,
      body: FutureBuilder<Product>(
        future: ProductsGetController.to
            .getProductDetails(widget.product.id.toString()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else {
            if (snapshot.data != null) {
              var product = snapshot.data!;
              int quantity = int.parse(product.quantity);
              double price = double.parse(product.price);
              List<CartObj> cartList = [
                CartObj(productId: product.id, quantity: 1)
              ];
              return ListView(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
                children: [
                  Container(
                    height: 320.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(22.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 20.h),
                      child: StatefulBuilder(
                        builder: (context, setState) {
                          return Stack(
                            children: [
                              Center(
                                child: PageView(
                                  onPageChanged: (index) {
                                    setState(() => _currentPage = index);
                                  },
                                  controller: _pageController,
                                  children: product.images
                                      .map((e) => Image.network(e))
                                      .toList(),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: Container(
                                  height: 48.h,
                                  width: 48.w,
                                  decoration: const BoxDecoration(
                                    color: AppColors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() => product.isFavorite =
                                          !product.isFavorite);
                                      ProductsGetController.to
                                          .addToFavorite(product);
                                    },
                                    icon: Icon(
                                      Icons.favorite,
                                      color: product.isFavorite
                                          ? AppColors.red
                                          : AppColors.grey,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PageViewIndicator(
                                      isCurrentPage: _currentPage == 0,
                                      marginEnd: 10.w,
                                    ),
                                    PageViewIndicator(
                                      isCurrentPage: _currentPage == 1,
                                      marginEnd: 10.w,
                                    ),
                                    PageViewIndicator(
                                      isCurrentPage: _currentPage == 2,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    product.nameEn,
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.black,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    product.infoEn,
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Row(
                        children: [
                          Text(
                            "\$ ${price.toString()}",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 18.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            "\$ ${price * quantity}",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 28.sp,
                              color: AppColors.primary,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Spacer(),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.grey, width: 1),
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.white,
                              ),
                              child: IconButton(
                                onPressed: () => setState(() => quantity += 1),
                                alignment: Alignment.topCenter,
                                icon: SvgPicture.asset("imags/plus.svg"),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Text(
                            quantity.toString(),
                            style: GoogleFonts.nunitoSans(
                              fontSize: 20.sp,
                              color: AppColors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          ConstrainedBox(
                            constraints:
                                BoxConstraints(maxHeight: 34.h, maxWidth: 34.w),
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.grey, width: 1),
                                borderRadius: BorderRadius.circular(8.r),
                                color: AppColors.white,
                              ),
                              child: IconButton(
                                onPressed: () => setState(() => quantity -= 1),
                                alignment: Alignment.topCenter,
                                icon: SvgPicture.asset("imags/minus.svg"),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    "Product Details",
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text(
                    "Duis aute veniam veniam qui aliquip irure duis sint magna occaecat dolore nisi culpa do. Est nisi incididunt aliquip  commodo aliqua tempor.",
                    style: GoogleFonts.nunitoSans(
                      color: AppColors.grey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Divider(
                    thickness: 2,
                    color: AppColors.lightGrey,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _rateDialog(
                            double.parse(product.overalRate),
                            product.id.toString()),
                        child: Text(
                          "Rate",
                          style: GoogleFonts.nunitoSans(
                            color: AppColors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const Spacer(),
                      IgnorePointer(
                        child: RatingBar.builder(
                          initialRating: double.parse(product.overalRate),
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: 20,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  const Divider(
                    thickness: 2,
                    color: AppColors.lightGrey,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) {
                      return Row(
                        children: [
                          Container(
                            width: 60.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              color: isAddedToCart
                                  ? AppColors.gradientBlue
                                  : AppColors.white,
                              border: Border.all(
                                color: isAddedToCart
                                    ? AppColors.gradientBlue
                                    : AppColors.borderGrey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: () {
                                setState(() => isAddedToCart = !isAddedToCart);
                                CartGetxController.to.create(getCart(product));
                              },
                              icon: Icon(
                                Icons.shopping_cart_outlined,
                                color: isAddedToCart
                                    ? AppColors.white
                                    : AppColors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: AppButton(
                              backgroundColor: AppColors.primary,
                              textColor: AppColors.white,
                              content: "Buy Now",
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CheckoutScreen(cart: cartList),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      );
                    },
                  )
                ],
              );
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: GoogleFonts.nunitoSans(
                      fontSize: 24.sp, color: AppColors.black),
                ),
              );
            }
          }
        },
      ),
    );
  }

  Cart getCart(Product product) {
    return Cart.fromProductJson(product.toJson());
    // return Cart(
    //   productId: product.id.toString(),
    //   info: product.infoEn,
    //   name: product.nameEn,
    //   img: product.imageUrl,
    //   price: double.parse(product.price),
    //   quantity: 1,
    // );
  }
}
