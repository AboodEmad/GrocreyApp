import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/api/controllers/oder_api_controller.dart';
import 'package:grocery_app/utils/app_colors.dart';

import '../../model/faq.dart';

class FaqsScreen extends StatelessWidget{
  const FaqsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQs'),
      ),
      body: FutureBuilder<List<Faq>>(
        future: OrderApiController().getFaqs(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }else{
            var faqs = snapshot.data!;
            return ListView(
              children: [
                StatefulBuilder(
                  builder: (context, setState) {
                    return ExpansionPanelList(
                      elevation: 2,
                      animationDuration: const Duration(seconds: 1),
                      expandedHeaderPadding: EdgeInsets.zero,
                      expansionCallback: (panelIndex, isExpanded) {
                        setState(() => faqs[panelIndex].isExpanded = !isExpanded);
                      },
                      children: faqs.map((e) {
                        return ExpansionPanel(
                          canTapOnHeader: true,
                          isExpanded: e.isExpanded,
                          headerBuilder: (context, isExpanded) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Center(
                                    child: Text(
                                      e.questionEn,
                                      style: GoogleFonts.nunitoSans(
                                        fontSize: 20.sp,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          body: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            height: 100.h,
                            alignment: AlignmentDirectional.topCenter,
                            child: Text(
                              e.answerEn,
                              textAlign: TextAlign.start,
                              style: GoogleFonts.nunitoSans(color: AppColors.grey),
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
