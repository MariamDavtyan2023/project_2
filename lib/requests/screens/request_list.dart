import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_2/generated/l10n.dart';
import 'package:project_2/login/screen/login_screen.dart';
import 'package:project_2/requests/models/request.dart';
import 'package:project_2/res/colors.dart';
import 'package:project_2/widgets/list_view_request.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/services.dart' show rootBundle;

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<StatefulWidget> createState() {
    return RequestsState();
  }
}

class RequestsState extends State<Requests> {
  String name = '';
  String _locale = language;
  List<Request> requests = [];

  Future<List<Request>> loadRequests({String locale = "armenian"}) async {
    final String response = await rootBundle.loadString(
        'assets/local/${locale == 'hy' ? 'armenian.json' : 'english.json'}');
    final List<dynamic> data = jsonDecode(response);
    return data.map((json) => Request.fromJson(json)).toList();
  }

  @override
  void initState() {
    initValues(locale: language);
    _locale = language;
    super.initState();
  }

  Future<void> initValues({String locale = 'hy'}) async {
    requests = await loadRequests(locale: locale);
    setState(() {
      _locale = locale;
      language = locale;
    });
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
      routes: { '/login_screen': (context) => const NumberAndPassword()},
      home: Builder(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.appBar,
            shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18)),
            ),
            toolbarHeight: 142,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 100),
                      child: IconButton(
                        icon: const Icon(
                          Icons.keyboard_arrow_left,
                          color: AppColors.appBarText,
                          size: 32,
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.pushReplacementNamed(context, '/login_screen');
                          });

                        },
                      ),
                    ),
                    Text(
                      S.of(context).requests,
                      style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.appBarText,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 344,
                  height: 36,
                  child: TextField(
                    cursorColor: AppColors.appBarText,
                    decoration: InputDecoration(
                      hintText: S.of(context).search,
                      hintStyle: const TextStyle(
                          fontSize: 16, color: AppColors.appBarText),
                      fillColor: AppColors.textFieldAppBar,
                      filled: true,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.appBarText,
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(15, 15),
                        ),
                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                  ),
                ),
              ],
            ),
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
                    ),
                  ),
                  DropdownMenuItem(
                      value: 'hy',
                      child: Text('hy', style: TextStyle(color: Colors.black)))
                ],
                onChanged: (String? newValue) async {
                  await initValues(locale: newValue!);
                },
              ),
            ],
          ),
          body: ListViewRequest(search(name)),
        ),
      ),
    );
  }

  List<Request> search(String name) {
    if (name.isEmpty) {
      return requests;
    }
    List<Request> list = [];
    for (var request in requests) {
      if (request.bankName.toLowerCase().contains(name.toLowerCase())) {
        list.add(request);
      }
    }
    return list;
  }
}
