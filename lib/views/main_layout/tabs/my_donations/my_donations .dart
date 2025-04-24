import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/remote_storage/get_specific_post.dart';
import 'package:red_cell/core/remote_storage/get_specific_user.dart';
import 'package:red_cell/core/widgets/My_header.dart';
import 'package:red_cell/views/authentication/login/cubit/log_in/log_in_cubit.dart';
import 'package:red_cell/views/main_layout/tabs/home/widgets/blood_request_card.dart';

class MyDonations extends StatefulWidget {
  const MyDonations({super.key});

  @override
  State<MyDonations> createState() => _MyDonationsState();
}

class _MyDonationsState extends State<MyDonations> {
  @override
  void initState() {
    userID = BlocProvider.of<LogInCubit>(context).userInfoDm.docId;
    super.initState();
  }

  String? userID;

  @override
  Widget build(BuildContext context) {
    print(userID);
    return Scaffold(
      body: Column(
        children: [
          MyHeader(title: 'My donate'),
          SizedBox(height: 24),
          FutureBuilder(
            future: getSpecificUser(userID!),
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return Future(() {
                        setState(() {

                        });
                        print("refresh");
                      },);
                    },
                    child: ListView.separated(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder(
                          future: getSpecificPost(snapShot.data![index]),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return BloodRequestCard(
                                donationDetailsDm: snapshot.data!,
                                isMyPost: false,
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          },
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 8),
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
      ),
    );
  }
}
