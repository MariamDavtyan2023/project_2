import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_2/res/colors.dart';
import '../../generated/l10n.dart';
import '../../requests/screens/request_list.dart';

String language = 'hy';

class NumberAndPassword extends StatefulWidget {
  const NumberAndPassword({super.key});

  @override
  State<StatefulWidget> createState() {
    return NumberAndPasswordState();
  }
}

class NumberAndPasswordState extends State<NumberAndPassword> {
  bool _hidePassword = true;
  bool _validPhoneAndPassword = false;
  bool _validPhone = true;
  bool _validPassword = true;
  String phone = '';
  String password = '';
  String _locale = language;

  @override
  void initState() {
    _locale = language;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(language),
      localizationsDelegates: const <LocalizationsDelegate>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [Locale(_locale)],
      routes: {
        '/request_list': (context) => const Requests(),
      },
      home: Builder(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            actions: [
              DropdownButton<String>(
                value: language,
                icon: const Icon(
                  Icons.language,
                  color: AppColors.appBarText,
                ),
                style: const TextStyle(color: AppColors.appBarText),
                items: const [
                  DropdownMenuItem(
                      value: 'en',
                      child: Text(
                        'en',
                        style: TextStyle(color: Colors.black),
                      )),
                  DropdownMenuItem(
                      value: 'hy',
                      child: Text('hy', style: TextStyle(color: Colors.black)))
                ],
                onChanged: (String? newValue)  {
                  setState(() {
                    language = newValue!;
                    _locale = newValue!;
                  });
                },
              ),
            ],
            toolbarHeight: 88,
            centerTitle: true,
            backgroundColor: AppColors.appBar,
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
              ),
            ),
            title: Text(
              S.of(context).entry,
              style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.appBarText,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    'assets/images/login_image.png',
                    width: 150,
                    height: 150,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    S.of(context).phone_number,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      helperText:
                          _validPhone ? '' : S.of(context).minimal_number,
                      helperStyle: const TextStyle(
                          fontSize: 12, color: AppColors.errorBorderSideColor),
                      fillColor: _validPhone
                          ? AppColors.textField
                          : AppColors.errorTextField,
                      filled: true,
                      hintText: '+374 .. ... ...',
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.grey),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              style: BorderStyle.solid,
                              color: AppColors.appBar)),
                      enabledBorder: _validPhone
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(style: BorderStyle.none))
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  style: BorderStyle.solid,
                                  color: AppColors.errorBorderSideColor)),
                    ),
                    onChanged: (val) {
                      setState(() {
                        phone = val;
                        if ((phone.isNotEmpty && phone.length < 8)) {
                          _validPhone = false;
                        } else {
                          _validPhone = true;
                        }
                        _isValidPhoneAndPassword();
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.of(context).password,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        S.of(context).forgot_password,
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.appBar),
                      ),
                    ],
                  ),
                  TextField(
                    obscureText: _hidePassword,
                    decoration: InputDecoration(
                      fillColor: _validPassword
                          ? AppColors.textField
                          : AppColors.errorTextField,
                      filled: true,
                      helperText:
                          _validPassword ? '' : S.of(context).minimum_character,
                      helperStyle: const TextStyle(
                          fontSize: 12, color: AppColors.errorBorderSideColor),
                      hintText: S.of(context).enter_password,
                      hintStyle:
                          const TextStyle(fontSize: 16, color: Colors.grey),
                      suffixIcon: IconButton(
                        icon: _hidePassword
                            ? Image.asset('assets/icons/vector.png',
                                width: 20.13,
                                height: 18,
                                color: AppColors.iconVisibility)
                            : Image.asset('assets/icons/frame.png',
                                width: 24,
                                height: 24,
                                color: AppColors.iconVisibility),
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                          });
                        },
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              style: BorderStyle.solid,
                              color: AppColors.appBar)),
                      enabledBorder: _validPassword
                          ? OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(style: BorderStyle.none))
                          : OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  style: BorderStyle.solid,
                                  color: AppColors.errorBorderSideColor)),
                    ),
                    onChanged: (val) {
                      setState(() {
                        password = val;
                        if ((password.isNotEmpty && password.length < 8)) {
                          _validPassword = false;
                        } else {
                          _validPassword = true;
                        }
                        _isValidPhoneAndPassword();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: _validPhoneAndPassword
                        ? () {
                            if ((phone == '123456789') &&
                                (password == 'mariam123')) {
                              Navigator.pushReplacementNamed(context, '/request_list');
                            } else {
                              if (phone.length > 20 || password.length > 20) {
                                warningAlertDialog();
                              } else {
                                incorrectInputData();
                              }
                            }
                          }
                        : null,
                    style: ButtonStyle(
                      minimumSize:
                          MaterialStateProperty.all(const Size(344, 58)),
                      backgroundColor: MaterialStateProperty.all(
                          _validPhoneAndPassword
                              ? AppColors.appBar
                              : AppColors.disableButton),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    child: Text(
                      S.of(context).entry,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.appBarText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).have_not_registered,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        S.of(context).register,
                        style: const TextStyle(
                            fontSize: 14, color: AppColors.appBar),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _isValidPhoneAndPassword() {
    if ((phone.isNotEmpty && phone.length >= 8) &&
        (password.isNotEmpty && password.length >= 8)) {
      _validPhoneAndPassword = true;
    } else {
      _validPhoneAndPassword = false;
    }
  }

  void warningAlertDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(children: [
              Image.asset(
                'assets/icons/warning.png',
                width: 48,
                height: 48,
              ),
              const Text(
                textAlign: TextAlign.center,
                'Ուշադրություն',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ]),
            content: const SizedBox(
              width: 238,
              height: 49,
              child: Text(
                'Ձեր տվյալները մուտք են արվել թույլատրելի քանակից շատ։',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            actions: const [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                  onPressed: null,
                  child: Text(
                    'Վերականգնել գաղտնաբառը',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.appBar, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ],
          );
        });
  }

  void incorrectInputData() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text(
              textAlign: TextAlign.center,
              'Սխալ մուտքային տվյալներ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              width: 238,
              height: 49,
              child: Text(
                'Մուտքային տվյալները սխալ են լրացված',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            actions: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                TextButton(
                  onPressed: null,
                  child: Text(
                    'Փորձել կրկին',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColors.appBar, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ],
          );
        });
  }
}

// class LanguageProvider extends ChangeNotifier {
//   void changeLanguage(String lang) {
//     language = lang;
//   }
// }
