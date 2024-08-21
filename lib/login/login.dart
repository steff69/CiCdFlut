import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudly/Models/LoginModel.dart';
import 'package:fudly/Register/RegisterPage.dart';
import 'package:fudly/common/EmailTextField.dart';
import 'package:fudly/common/back_ground_container.dart';
import 'package:fudly/common/shimmers/PasswordTextField.dart';
import 'package:fudly/common/shimmers/cutomButtomn.dart';
import 'package:fudly/constants/constants.dart';
import 'package:fudly/controller/LoginController.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  final FocusNode _passwordCFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordCFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var c = Get.find<LoginController>();

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
                    PasswordTextField(
                      controller: _passwordController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => RegisterPage());
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(() => c.loading.value
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.blue,
                            strokeAlign: 1,
                          ))
                        : CustomButton(
                            onTap: () {
                              LoginModel model = LoginModel(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              String data = loginModelToJson(model);
                              c.loginFunction(data);
                            },
                            text: "L O G I N",
                            btnheigh: 35.h,
                          )),
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
