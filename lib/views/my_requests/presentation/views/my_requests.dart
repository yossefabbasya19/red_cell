import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/remote_storage/remote_storage.dart';
import 'package:red_cell/core/widgets/My_header.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';import 'package:red_cell/views/my_requests/presentation/views/views/requests_card.dart';

class MyRequests extends StatefulWidget {
  const MyRequests({super.key});

  @override
  State<MyRequests> createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      Column(children: [
        MyHeader(title: AppLocalizations.of(context)!.my_requests),
        SizedBox(height: 24),
        FutureBuilder(
          future: RemoteStorage().getDonationRequest(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return snapShot.data!.isEmpty
                  ? Center(
                child: Text(
                  AppLocalizations.of(context)!.no_feeds_now,
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
                            return RequestsCard(
                              donationDetailsDm: snapShot.data![index],
                              isMyPost:
                              !(snapShot.data![index].uid.trim() ==
                                  FirebaseAuth.instance.currentUser!.uid
                                      .trim()),
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
      ],),);
  }
}
