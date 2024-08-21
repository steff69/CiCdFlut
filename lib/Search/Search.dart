import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:fudly/Search/laoding_widget.dart';
import 'package:fudly/Search/search_resulat.dart';
import 'package:fudly/common/custom_container.dart';
import 'package:fudly/common/shimmers/custome_text.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/searchController.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    SerchController c = Get.put(SerchController());

    return Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          toolbarHeight: 74.h,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: CustomTextWidget(
              onChanged: (v) {
                c.getSearchData(searchdata: searchController.text);
              },
              controller: searchController,
              keyboardType: TextInputType.text,
              hintText: 'Search for Foods',
              suffixIcon: GestureDetector(
                  onTap: () {
                    searchController.clear();
                    c.dataSearch.clear();
                  },
                  child: Obx(
                    () => Icon(
                        c.dataSearch.length > 0
                            ? Ionicons.close_circle
                            : Icons.search_rounded,
                        color: KGray),
                  )),
            ),
          ),
        ),
        body: SafeArea(
            child: Obx(() => c.dataSearch.length > 0
                ? SearchResults(data: c.dataSearch)
                : CustomContainer(
                    containerConrent: LaodingWidget(), color: Colors.white))));
  }
}
