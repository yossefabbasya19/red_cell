import 'package:flutter/material.dart';
import 'package:red_cell/core/widgets/My_header.dart';
import 'package:red_cell/views/main_layout/tabs/home/widgets/blood_request_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyHeader(title: 'Order List'),
          SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CustomScrollView(
                physics: ScrollPhysics(parent: BouncingScrollPhysics()),
                slivers: [
                  SliverList.separated(
                    itemBuilder: (context, index) {
                      return BloodRequestCard();
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
