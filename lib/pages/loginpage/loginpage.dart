import 'package:flutter/material.dart';
import 'package:healtether/constants/themes.dart';
import 'package:healtether/pages/verification_page/verification_page.dart';
import 'package:healtether/providers/login_providers.dart';
import 'package:healtether/utilities/navigators.dart';
import 'package:healtether/utilities/validators.dart';
import 'package:healtether/widgets/formfield_widget.dart';
import 'package:healtether/widgets/rounded_button_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _phoneController;
  late final FocusNode _phoneNode;
  late final FormValidators validators;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
    _phoneNode = FocusNode();
    validators = FormValidators();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneController.dispose();
    _phoneNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            height: size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enter your\nphone number',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.h1TextStyle(
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'We will send you confirmation code',
                          style: AppTextStyle.h4TextStyle(
                              color: AppTextTheme.appTextThemeLight),
                        ),
                        const SizedBox(height: 32.0),
                        // Container(
                        //   width: size.width,
                        //   height: 46.0,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(16.0),
                        //     border:
                        //         Border.all(color: Colors.black12, width: 1.0),
                        //   ),
                        //   alignment: Alignment.center,
                        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        //   child: Consumer<LoginProvider>(
                        //       builder: (context, provider, _) {
                        //     return DropdownButton<String>(
                        //       borderRadius: BorderRadius.circular(16.0),
                        //       elevation: 2,
                        //       isDense: true,
                        //       isExpanded: true,
                        //       iconSize: 20.0,
                        //       iconEnabledColor: AppIconTheme.appIconThemeLight,
                        //       underline: Container(),
                        //       padding: EdgeInsets.zero,
                        //       icon:
                        //           const Icon(Icons.keyboard_arrow_down_rounded),
                        //       value: provider.selectedCountry,
                        //       items: <String>[
                        //         "+1",
                        //         "+44",
                        //         "+61",
                        //         "+49",
                        //         "+33",
                        //         "+91",
                        //         "+86",
                        //         "+81",
                        //         "+55",
                        //       ].map((item) {
                        //         return DropdownMenuItem(
                        //             value: item,
                        //             child: Text(
                        //               item,
                        //               style: AppTextStyle.h4TextStyle(
                        //                   size: 15.0,
                        //                   fontWeight: FontWeight.w500),
                        //             ));
                        //       }).toList(),
                        //       hint: Row(
                        //         children: [
                        //           const Icon(
                        //             Icons.public_rounded,
                        //             size: 18.0,
                        //             color: AppIconTheme.appIconThemeLight,
                        //           ),
                        //           const SizedBox(width: 10.0),
                        //           Text(
                        //             'Country/Region',
                        //             style: AppTextStyle.h4TextStyle(
                        //                 color: AppTextTheme.appTextThemeLight),
                        //           ),
                        //         ],
                        //       ),
                        //       onChanged: (value) {
                        //         provider.selectCountry(value!);
                        //       },
                        //     );
                        //   }),
                        // ),
                        // const SizedBox(height: 10.0),
                        FormFieldWidget(
                          controller: _phoneController,
                          node: _phoneNode,
                          hintText: 'Phone Number',
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          autofillHints: const [AutofillHints.telephoneNumber],
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          prefixIcon: const Icon(Icons.call_rounded,
                              color: AppIconTheme.appIconThemeLight),
                          validator: (value) =>
                              validators.validatePhone(value!),
                        ),
                        const SizedBox(height: 16.0),
                        RoundedButton(
                          size: size,
                          label: 'Login',
                          onTap: () {
                            final provider = context.read<LoginProvider>();
                            if (_formKey.currentState!.validate()) {
                              provider
                                  .addPhoneNumber(_phoneController.text.trim());
                              navigatorPush(context, const VerificationPage());
                            } else {
                              //error
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      style: AppTextStyle.h5TextStyle(
                          color: AppTextTheme.appTextThemeLight),
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: 'By continuing, you agree with our '),
                          TextSpan(
                              text: 'Terms and Conditions',
                              style: AppTextStyle.h5TextStyle(
                                  color: AppTheme.appThemeColor)),
                          const TextSpan(text: ' and '),
                          TextSpan(
                              text: 'Privacy Policy',
                              style: AppTextStyle.h5TextStyle(
                                  color: AppTheme.appThemeColor)),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
