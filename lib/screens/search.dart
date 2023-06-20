import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/common_screen/comman_textField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_screen/comman_text.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  void search(String que) async {
    final result = await FirebaseFirestore.instance.collection("Product").where('product_name', arrayContains: que).get();

    searchResult = result.docs.map((e) => e.data()).toList();
    setState(() {});
  }

  List searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            CommonTextFiled(
              onChanged: (query) {
                search(query);
              },
              hintText: "Search",
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchResult.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: CommonText(
                      //fontFamily: "JV1",
                      text: searchResult[index]["product_name"],
                    ),
                    subtitle: CommonText(text: searchResult[index]["product_category"]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
