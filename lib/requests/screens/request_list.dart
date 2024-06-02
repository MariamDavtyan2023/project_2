import 'package:flutter/material.dart';
import 'package:project_2/generated/l10n.dart';
import 'package:project_2/login/screen/login_screen.dart';
import 'package:project_2/requests/models/request.dart';
import 'package:project_2/res/colors.dart';
import 'package:project_2/widgets/list_view_request.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



class Requests extends StatelessWidget {

   const Requests({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const <LocalizationsDelegate>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [Locale(language)],
      home: const SearchRequest(),
    );
  }

}

class SearchRequest extends StatefulWidget {

  const SearchRequest({super.key});

  @override
  State<StatefulWidget> createState() {
    return SearchRequestState();
  }
}

class SearchRequestState extends State<SearchRequest> {

  String name = '';

   List<Request> requests = [
    Request(
        bankImage: 'assets/images/evokabank.png',
        bankName: 'Էվոկա բանկ',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Ազդում է',
        effectIcon: 'assets/icons/low_price.png'),
    Request(
        bankImage: 'assets/images/id_bank.png',
        bankName: 'Այ Դի բանկ',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Չի ազդում',
        effectIcon: 'assets/icons/hand.png'),
    Request(
        bankImage: 'assets/images/default_logo.png',
        bankName: 'Բանկային կազմակերպություն',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Ազդում է',
        effectIcon: 'assets/icons/low_price.png'),
    Request(
        bankImage: 'assets/images/evokabank.png',
        bankName: 'Էվոկա բանկ',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Ազդում է',
        effectIcon: 'assets/icons/low_price.png'),
    Request(
        bankImage: 'assets/images/id_bank.png',
        bankName: 'Այ Դի բանկ',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Չի ազդում',
        effectIcon: 'assets/icons/hand.png'),
    Request(
        bankImage: 'assets/images/default_logo.png',
        bankName: 'Բանկային կազմակերպություն',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Ազդում է',
        effectIcon: 'assets/icons/low_price.png'),
    Request(
        bankImage: 'assets/images/evokabank.png',
        bankName: 'Էվոկա բանկ',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Ազդում է',
        effectIcon: 'assets/icons/low_price.png'),
    Request(
        bankImage: 'assets/images/id_bank.png',
        bankName: 'Այ Դի բանկ',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Չի ազդում',
        effectIcon: 'assets/icons/hand.png'),
    Request(
        bankImage: 'assets/images/default_logo.png',
        bankName: 'Բանկային կազմակերպություն',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Ազդում է',
        effectIcon: 'assets/icons/low_price.png'),
    Request(
        bankImage: 'assets/images/evokabank.png',
        bankName: 'Էվոկա բանկ',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Ազդում է',
        effectIcon: 'assets/icons/low_price.png'),
    Request(
        bankImage: 'assets/images/id_bank.png',
        bankName: 'Այ Դի բանկ',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Չի ազդում',
        effectIcon: 'assets/icons/hand.png'),
    Request(
        bankImage: 'assets/images/default_logo.png',
        bankName: 'Բանկային կազմակերպություն',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Ազդում է',
        effectIcon: 'assets/icons/low_price.png'),
    Request(
        bankImage: 'assets/images/evokabank.png',
        bankName: 'Էվոկա բանկ',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Ազդում է',
        effectIcon: 'assets/icons/low_price.png'),
    Request(
        bankImage: 'assets/images/id_bank.png',
        bankName: 'Այ Դի բանկ',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Չի ազդում',
        effectIcon: 'assets/icons/hand.png'),
    Request(
        bankImage: 'assets/images/default_logo.png',
        bankName: 'Բանկային կազմակերպություն',
        type: 'ՖԱՅԿՈ Սքոր զեկույց',
        purpose: 'Նոր վարկի դիմում',
        date: DateTime.now(),
        effect: 'Ազդում է',
        effectIcon: 'assets/icons/low_price.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18))),
        toolbarHeight: 142,
        leading: const Icon(
          Icons.keyboard_arrow_left,
          color: AppColors.appBarText,
          size: 32,
        ),
        title:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             Text(
              S.of(context).requests,
              style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.appBarText,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              cursorColor: AppColors.appBarText,
              decoration:  InputDecoration(
                hintText: S.of(context).search,
                fillColor: AppColors.textFieldAppBar,
                filled: true,
                prefixIcon: const Icon(Icons.search, color: AppColors.appBarText,),
                border: const OutlineInputBorder(
                  borderRadius:  BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              onChanged: (val){
                setState(() {
                  name = val;
                });
              },
            ),
          ],
        ),
        backgroundColor: AppColors.appBar,
        centerTitle: true,
      ),
      body: ListViewRequest(search(name)),
    );
  }

  List<Request> search(String name) {
    if(name.isEmpty) {
      return requests;
    }
    List<Request> list = [];
    for(var request in requests) {
      if(request.bankName.toLowerCase().contains(name.toLowerCase())) {
        list.add(request);
      }
    }
    return list;
  }
}
