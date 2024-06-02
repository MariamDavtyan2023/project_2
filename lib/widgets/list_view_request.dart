import 'package:flutter/material.dart';
import 'package:project_2/requests/models/request.dart';
import 'package:project_2/widgets/request_item.dart';

class ListViewRequest extends StatelessWidget {

  List<Request> listRequest;

  ListViewRequest(this.listRequest);

  @override
  Widget build(BuildContext context) {
      return ListView.builder(
          itemCount: listRequest.length,
          itemBuilder: (context, index) {
            return RequestItem(listRequest[index]);
          });
    }
  }