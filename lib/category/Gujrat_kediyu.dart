import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../common_screen/comman_text.dart';
import '../common_screen/common_container.dart';
import '../global/variable.dart';

class GujaratKediyu extends StatefulWidget {
  const GujaratKediyu({Key? key}) : super(key: key);

  @override
  State<GujaratKediyu> createState() => _GujaratKediyuState();
}

class _GujaratKediyuState extends State<GujaratKediyu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        name: "Category",
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Product').where("product_catagory", isEqualTo: "Gujrat_kediyu").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            return snapshot.data!.docs.isNotEmpty
                ? GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 1, crossAxisSpacing: 1, crossAxisCount: 2, mainAxisExtent: 320),
                    itemBuilder: (context, index) {
                      final product = snapshot.data!.docs[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              margin: EdgeInsets.only(top: 10.sp),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 10,
                              color: grey,
                              child: CommonContainer(
                                borderRadius: BorderRadius.circular(5),
                                height: 155.sp,
                                width: double.infinity,
                                color: white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(product!['image'].toString()),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8.sp,
                            ),
                            CommonText(
                              maxLines: 1,
                              text: product["product_name"],
                              fontWeight: FontWeight.w500,
                              fontSize: 15.sp,
                            ),
                            SizedBox(
                              height: 6.sp,
                            ),
                            Row(
                              children: [
                                CommonText(
                                  text: "₹",
                                  fontSize: 14.sp,
                                  color: black54,
                                ),
                                SizedBox(
                                  width: 2.sp,
                                ),
                                CommonText(
                                  text: product['product_price'],
                                  fontSize: 17.sp,
                                  color: red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonText(
                          text: "No Image Added!",
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          //fontFamily: "JB1",
                        ),
                        CommonText(
                          text: "Once you have added, come back:)",
                          fontSize: 19,
                          color: black54,
                          //fontFamily: "JB1",
                        ),
                      ],
                    ),
                  );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
