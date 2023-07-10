// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/login_controller.dart';
import '../../../utilities/color.dart';
import '../../../utilities/imageassets.dart';
import '../../widgets/auth_widgets.dart';
import '../../widgets/custom_text_field.dart';
import '../minor_screens/forgot_password.dart';

class CustomerLogin extends StatelessWidget {
  const CustomerLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    // double w = MediaQuery.of(context).size.width;
    return GetBuilder<LoginControllerImplement>(
      init: LoginControllerImplement(),
      builder: (controller) {
        return ScaffoldMessenger(
          key: controller.scaffoldKey,
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  reverse: true,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: controller.formKey,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // const AuthHeaderLabel(headerLabel: 'Log In'),
                            // const SizedBox(
                            //   height: 50,
                            // ),
                            logo(h*.2),
                            SizedBox(
                              height: h * .019,
                            ),
                             const Text(
                              'login as a Customer',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColor.grey,
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  // const Text(
                                  //   'Login to continue',
                                  //   style: TextStyle(
                                  //     fontSize: 16,
                                  //     fontWeight: FontWeight.w500,
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: h * .0142,
                                  ),
                                  CustomTextField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your email ';
                                      } else if (value.isValidEmail() == false) {
                                        return 'invalid email';
                                      } else if (value.isValidEmail() == true) {
                                        return null;
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      controller.email = value;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    hintText: 'Email',
                                    obscureText: false,
                                    prefixIcon: const Icon(Icons.email_outlined),
                                  ),
                                  const SizedBox(
                                    height: 18,
                                  ),
                                  CustomTextField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please enter your password';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                  controller.    password = value;
                                    },
                                    hintText: 'Password',
                                    obscureText:controller.passwordVisible,
                                    prefixIcon: const Icon(Icons.lock_outline),
                                    suffixIcon: IconButton(
                                        onPressed: () {

                                         controller.showPasswordVisible();

                                        },
                                        icon: Icon(
                                          controller.passwordVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: AppColor.primaryColor,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgotPassword()));
                                    },
                                    child: const Text(
                                      'Forget password ? ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: AppColor.grey,
                                      ),
                                    ),
                                  ),
                                  HaveAccount(
                                    haveAccount: 'Don\'t Have Account? ',
                                    actionLabel: 'Sign Up',
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, '/customer_signup');
                                    },
                                  ),
                                  controller. processing == true
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                              color: AppColor.primaryColor))
                                      : AuthMainButton(
                                          mainButtonLabel: 'Login',
                                          onPressed: () {
                                            controller. logIn();
                                          },
                                        ),
                                  SizedBox(
                                    height: h * .054,
                                  ),
                                  const Text(
                                    'or with',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: h * .023,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          controller. signInWithGoogle();
                                        },
                                          child: Image.asset(
                                              AppImageAsset.googleImage)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 80,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Text(
            '  Or  ',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            width: 80,
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}

// Padding(
//   padding: const EdgeInsets.symmetric(vertical: 10),
//   child: Material(
//     shadowColor: Colors.grey.withOpacity(.3),
//     elevation: 10,
//     child: SizedBox(
//       height: 43,
//       width: 314,
//       child: TextFormField(
//
//         validator: (value) {
//           if (value!.isEmpty) {
//             return 'please enter your email ';
//           } else if (value.isValidEmail() == false) {
//             return 'invalid email';
//           } else if (value.isValidEmail() == true) {
//             return null;
//           }
//           return null;
//         },
//         onChanged: (value) {
//           email = value;
//         },
//
//         keyboardType: TextInputType.emailAddress,
//         decoration: textFormDecoration.copyWith(
//           hintText: 'Enter your email',
//
//         ),
//       ),
//     ),
//   ),
// ),
// Padding(
//   padding: const EdgeInsets.symmetric(vertical: 10),
//   child: Material(
//     shadowColor: Colors.grey.withOpacity(.3),
//     elevation: 10,
//     child: TextFormField(
//       validator: (value) {
//         if (value!.isEmpty) {
//           return 'please enter your password';
//         }
//         return null;
//       },
//       onChanged: (value) {
//         password = value;
//       },
//       obscureText: passwordVisible,
//       decoration: textFormDecoration.copyWith(
//         suffixIcon: IconButton(
//             onPressed: () {
//               setState(() {
//                 passwordVisible = !passwordVisible;
//               });
//             },
//             icon: Icon(
//               passwordVisible
//                   ? Icons.visibility
//                   : Icons.visibility_off,
//               color: AppColor1.primaryColor,
//             )),
//         labelText: 'Password',
//         hintText: 'Enter your password',
//       ),
//     ),
//   ),
// ),
