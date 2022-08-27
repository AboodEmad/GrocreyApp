import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/auth_api_controller.dart';
import 'package:grocery_app/model/api_response.dart';
import 'package:grocery_app/model/city.dart';
import 'package:grocery_app/prefs/shared_pref_controller.dart';
import 'package:grocery_app/utils/context_extenssion.dart';

import '../../model/user.dart';
import '../../utils/app_colors.dart';
import '../../widget/app_button.dart';
import '../../widget/app_text_field.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  late TextEditingController _firstNameTextController;
  late TextEditingController _lastNameTextController;
  late TextEditingController _genderTextController;
  late TextEditingController _birthdayTextController;
  late TextEditingController _phoneNumberTextController;

  bool isDefault = false;

  String _gender = 'M';
  int _cityId = 1;

  @override
  void initState() {
    super.initState();
    _phoneNumberTextController = TextEditingController()..text = "12380993123";
    _firstNameTextController = TextEditingController()..text = "Albas";
    _lastNameTextController = TextEditingController()..text = "Joan";
    _genderTextController = TextEditingController()..text = "Male";
    _birthdayTextController = TextEditingController()..text = "05.09.1990";
  }

  @override
  void dispose() {
    _phoneNumberTextController.dispose();
    _firstNameTextController.dispose();
    _lastNameTextController.dispose();
    _genderTextController.dispose();
    _birthdayTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 60.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(21.r),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 26.h),
          children: [
            AppTextField(
              textFiledController: _firstNameTextController,
              labelText: "Frist Name",
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
              enable: false,
              textFiledController: _lastNameTextController,
              labelText: "Last Name",
              inputType: TextInputType.text,
            ),
            SizedBox(
              height: 20.h,
            ),
            AppTextField(
              textFiledController: _phoneNumberTextController,
              labelText: "Phone Number",
              inputType: const TextInputType.numberWithOptions(
                  decimal: false, signed: false,),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Gender',
              style: GoogleFonts.nunitoSans(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: AppColors.grey
              ),
            ),
            SizedBox(height: 9.h,),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grey,width: 1),
                color: AppColors.white,
                borderRadius: BorderRadius.circular(7.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      activeColor: AppColors.primary,
                      title: Text('Male', style: GoogleFonts.nunitoSans()),
                      value: 'M',
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() => _gender = value!);
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      activeColor: AppColors.primary,
                      title: Text('Female', style: GoogleFonts.nunitoSans()),
                      value: 'F',
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() => _gender = value!);
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.grey, width: 1),
              ),
              child: FutureBuilder<List<City>>(
                future: AuthApiController().getCities(),
                builder: (context, snapshot) {
                  var list = snapshot.data!;
                  return DropdownButton<int>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    hint: const Text('City'),
                    style: GoogleFonts.nunitoSans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.grey,
                    ),
                    onChanged: (int? value) {
                      setState(() => _cityId = value!);
                    },
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      print('Tapped');
                    },
                    dropdownColor: AppColors.lightGrey,
                    elevation: 1,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: AppColors.primary,
                    ),
                    value: _cityId,
                    items: list.map(
                          (city) {
                        return DropdownMenuItem<int>(
                          value: city.id,
                          child: Text(
                            city.nameAr,
                            style: GoogleFonts.nunitoSans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.black,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(height: 30.h,),
            AppButton(
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              content: "Save",
              onPressed: () => _performUpdate(),
            ),
          ],
        ),
      ),
    );
  }


  void _performUpdate() async {
    if (_checkData()) {
      _update();
    }
  }

  bool _checkData() {
    if (_firstNameTextController.text.isNotEmpty &&
        _phoneNumberTextController.text.isNotEmpty &&
        _gender != null &&
        _lastNameTextController.text.isNotEmpty) {
      return true;
    }
    context.showSnackBar(message: 'Enter required data', error: true);
    return false;
  }

  void _update() async {
    var res = await AuthApiController().updateProfile(user: user);
    if(res.status){
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
    // ignore: use_build_context_synchronously
    context.showSnackBar(
      message: res.message,
      error: !res.status,
    );
  }

  Map<String, dynamic> get user => User.update(
    name: "${_firstNameTextController.text} ${_lastNameTextController.text}",
    gender: _gender,
    cityId: _cityId.toString(),
  ).toUpdateJson();
}
