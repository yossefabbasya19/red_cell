import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/remote_storage/remote_storage.dart';
import 'package:red_cell/core/widgets/My_header.dart';
import 'package:red_cell/views/main_layout/tabs/home/widgets/blood_request_card.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyHeader(title: 'Order List'),
        SizedBox(height: 24),
        FutureBuilder(
          future: RemoteStorage().getDonationRequest(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return snapShot.data!.isEmpty
                  ? Center(
                    child: Text(
                      "No Feeds Now",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                  : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: RefreshIndicator(
                        color: ColorsManeger.red,
                        onRefresh: () {
                          return Future(() {
                            setState(() {});
                            print("refresh");
                          });
                        },
                        child: CustomScrollView(
                          physics: ScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics(
                              parent: BouncingScrollPhysics(),
                            ),
                          ),
                          slivers: [
                            SliverList.separated(
                              itemCount: snapShot.data!.length,
                              itemBuilder: (context, index) {
                                return BloodRequestCard(
                                  donationDetailsDm: snapShot.data![index],
                                  isMyPost:
                                      snapShot.data![index].uid.trim() ==
                                      FirebaseAuth.instance.currentUser!.uid
                                          .trim(),
                                );
                              },
                              separatorBuilder:
                                  (context, index) => SizedBox(height: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
            } else if (snapShot.hasError) {
              return Center(child: Text("error try again later"));
            } else {
              return Center(
                child: CircularProgressIndicator(color: ColorsManeger.red),
              );
            }
          },
        ),
      ],
    );
  }
}
