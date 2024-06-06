import 'package:flutter/material.dart';
import 'package:project_2/generated/l10n.dart';
import 'package:project_2/requests/models/request.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_2/res/colors.dart';

class RequestItem extends StatelessWidget {
  Request request;

  RequestItem(this.request);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15),
      shadowColor: Colors.black,
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  request.bankImage,
                  width: 32,
                  height: 32,
                ),
                Text(
                  request.bankName,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
             Text(
              S.of(context).type,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              request.type,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              S.of(context).purpose,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              request.purpose,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              S.of(context).date,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            Text(
              '${request.date.day}.${request.date.month}.${request.date.year}',
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              S.of(context).effect,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  request.effectIcon,
                  width: 32,
                  height: 32,
                ),
                Text(
                  request.effect,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
