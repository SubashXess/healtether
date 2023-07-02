import 'package:flutter/material.dart';
import 'package:healtether/pages/dashboard.dart';
import 'package:healtether/pages/verification_page/components/resend_code.dart';
import 'package:healtether/providers/login_providers.dart';
import 'package:healtether/utilities/navigators.dart';
import 'package:healtether/widgets/rounded_button_widget.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../constants/themes.dart';
import '../../database/shared_preference.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _otpController;
  late FocusNode _otpNode;

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
    _otpNode = FocusNode();
  }

  @override
  void dispose() {
    _otpController.dispose();
    _otpNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const focusedBorderColor = AppTheme.appThemeColor;
    const fillColor = AppDefaultTheme.appDefaultTheme;
    const borderColor = AppTheme.appThemeColor;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 50,
      textStyle: AppTextStyle.h2TextStyle(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: borderColor),
      ),
    );
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text('Verification', style: AppTextStyle.h1TextStyle()),
                      const SizedBox(height: 10.0),
                      Text('Please enter the 6 digit code sent to',
                          style: AppTextStyle.h4TextStyle()),
                      const SizedBox(height: 4.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Consumer<LoginProvider>(
                              builder: (context, provider, _) {
                            return Text(provider.phoneNumber!,
                                style: AppTextStyle.h4TextStyle(
                                    fontWeight: FontWeight.w500));
                          }),
                          const SizedBox(width: 10.0),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.edit_rounded,
                              size: 16.0,
                              color: AppTheme.appThemeColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32.0),
                      Pinput(
                        controller: _otpController,
                        focusNode: _otpNode,
                        androidSmsAutofillMethod:
                            AndroidSmsAutofillMethod.smsUserConsentApi,
                        listenForMultipleSmsOnAndroid: true,
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        length: 6,
                        onCompleted: (pin) {},
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: fillColor,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(color: focusedBorderColor),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border:
                              Border.all(color: AppTextTheme.appTextThemeError),
                        ),
                        errorTextStyle: AppTextStyle.h4TextStyle(
                            color: AppTextTheme.appTextThemeError),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Required OTP';
                          } else if (value.length < 6) {
                            return 'Please enter 6 digit OTP';
                          } else {
                            return null;
                          }
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(bottom: 9),
                              width: 22,
                              height: 2.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: AppTheme.appThemeColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      RoundedButton(
                        size: size,
                        label: 'Verify',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            final provider = context.read<LoginProvider>();
                            // success
                            provider.setLogin().then((value) {
                              UserPreferences().setStringValue(
                                  'phone', provider.phoneNumber!);
                              navigatorPushRemove(context, const Dashboard());
                            });
                          } else {
                            // error
                          }
                        },
                      ),
                      const SizedBox(height: 32.0),
                      Container(
                        width: size.width,
                        alignment: Alignment.center,
                        child: Consumer<LoginProvider>(
                          builder: (context, provider, child) {
                            return ResendCodeCheck(
                                resend: provider.isResendAgain,
                                onTap: () {
                                  if (provider.isResendAgain) return;
                                  provider.resendOTP();
                                },
                                timer: provider.start.toString());
                          },
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
    );
  }
}
