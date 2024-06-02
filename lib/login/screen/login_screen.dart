import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_2/res/colors.dart';
import '../../generated/l10n.dart';
import '../../requests/screens/request_list.dart';


String language = 'hy';


class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const <LocalizationsDelegate>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [Locale(language)].reversed,
      routes: {
        '/request_list': (context) => const Requests(),
      },
      home: const NumberAndPassword(),
    );
  }
}

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
  String dropdownValue = 'Arm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          DropdownButton<String>(
            value: dropdownValue,
            icon: const Icon(Icons.language, color: AppColors.appBarText,),
            style: const TextStyle(color: AppColors.appBarText),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
                if(dropdownValue == 'Eng') {
                  language = 'en';
                } else {
                  language = 'hy';
                }
              });
            },
            items: const [
              DropdownMenuItem(value: 'Eng', child: Text('Eng', style: TextStyle(color: Colors.black),)),
              DropdownMenuItem(value: 'Arm', child: Text('Arm', style: TextStyle(color: Colors.black)))
            ],
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
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  helperText: _validPhone ? '' : S.of(context).minimal_number,
                  helperStyle: const TextStyle(
                      fontSize: 12, color: AppColors.errorBorderSideColor),
                  fillColor: _validPhone
                      ? AppColors.textField
                      : AppColors.errorTextField,
                  filled: true,
                  hintText: '+374 .. ... ...',
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
                  enabledBorder: _validPhone
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(style: BorderStyle.none))
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              style: BorderStyle.solid,
                              color: AppColors.errorBorderSideColor)),
                ),
                onChanged: (val) {
                  setState(() {
                    phone = val;
                    if ((phone.isNotEmpty && phone.length <= 8)) {
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
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    S.of(context).forgot_password,
                    style: const TextStyle(fontSize: 12, color: AppColors.appBar),
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
                  helperText: _validPassword ? '' : S.of(context).minimum_character,
                  helperStyle: const TextStyle(
                      fontSize: 12, color: AppColors.errorBorderSideColor),
                  hintText: S.of(context).enter_password,
                  hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
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
                  enabledBorder: _validPassword
                      ? OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(style: BorderStyle.none))
                      : OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                              style: BorderStyle.solid,
                              color: AppColors.errorBorderSideColor)),
                ),
                onChanged: (val) {

                  setState(() {
                    password = val;
                    if ((password.isNotEmpty && password.length <= 8)) {
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
                        Navigator.pushNamed(context, '/request_list');
                      }
                    : null,
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(344, 58)),
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
                    style: const TextStyle(fontSize: 14, color: AppColors.appBar),
                  )
                ],
              )
            ],
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
}
