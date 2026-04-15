import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final firestore = FirebaseFirestore.instance;

loadingWidget(BuildContext context) {
  return showDialog(context: context, builder: (_) => AlertDialog(
    content: Container(
      height: 100,
      width: 100,
      child: Center(
        child: Container(
            height: 50,
            width: 50,
            child: CircularProgressIndicator()),
      ),
    )
  ));
}

snackbarWidget(BuildContext context, String content) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}