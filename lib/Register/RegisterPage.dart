import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/Models/RegisterModel.dart';
import 'package:fudly/common/EmailTextField.dart';
import 'package:fudly/common/back_ground_container.dart';
import 'package:fudly/common/shimmers/PasswordTextField.dart';
import 'package:fudly/common/shimmers/cutomButtomn.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/RegisterController.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _nameController = TextEditingController();

  final FocusNode _passwordCFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordCFocusNode.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = Get.put(RegisterController());

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        title: Padding(
            padding: EdgeInsets.only(left: 65),
            child: Text(
              'Foodly Family',
              style: TextStyle(
                  color: kLightwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: BackGroundContainer(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Lottie.asset('assets/anime/delivery.json'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EmailTextField(
                      hintText: "Enter Email",
                      prefixIcon: Icon(
                        CupertinoIcons.mail,
                        size: 20,
                        color: kGrayLight,
                      ),
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    EmailTextField(
                      hintText: " UserName",
                      prefixIcon: Icon(
                        CupertinoIcons.person,
                        size: 20,
                        color: kGrayLight,
                      ),
                      controller: _nameController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    PasswordTextField(
                      controller: _passwordController,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(
                      () => c.loading.value
                          ? Center(
                              child: CircularProgressIndicator(
                              color: Colors.blue,
                              strokeAlign: 1,
                            ))
                          : CustomButton(
                              onTap: () {
                                RegisterModel model = RegisterModel(
                                    username: _nameController.text,
                                    email: _emailController.text,
                                    password: _passwordController.text);
                                String data = RegisterModelToJson(model);
                                c.registerFunction(data);
                              },
                              text: "R E G I S T E R",
                              btnheigh: 35.h,
                            ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        color: kOffwhite,
      ),
    );
  }
}
