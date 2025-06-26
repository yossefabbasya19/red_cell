import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/views/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:red_cell/views/chat/presentation/view_model/chat_cubit.dart';
import 'package:red_cell/views/chat/data/model/message_model.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<MessageModel> message = [];

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ChatCubit>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              if (state is ChatSuccess) {
                message = cubit.message;
              }
              if (state is ChatFailure) {
                showSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              return Expanded(
                child: ListView.builder(
                  controller: cubit.scrollController,
                  reverse: true,
                  itemCount: message.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Align(
                          alignment:
                              message[index].isSender
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            margin: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorsManeger.gray,
                                width: 0.5,
                              ),
                              color:
                                  message[index].isSender
                                      ? ColorsManeger.red
                                      : ColorsManeger.white,
                              borderRadius: BorderRadius.only(
                                topLeft:
                                    message[index].isSender
                                        ? Radius.circular(0)
                                        : Radius.circular(0),
                                topRight:
                                    message[index].isSender
                                        ? Radius.circular(0)
                                        : Radius.circular(0),
                                bottomRight:
                                    message[index].isSender
                                        ? Radius.circular(0)
                                        : Radius.circular(16),
                                bottomLeft:
                                    message[index].isSender
                                        ? Radius.circular(16)
                                        : Radius.circular(0),
                              ),
                            ),
                            child: Text(
                              message.reversed.toList()[index].message,
                              style: Theme.of(context).textTheme.labelMedium!
                                  .copyWith(color: ColorsManeger.black),
                            ),
                          ),
                        ),
                        state is ChatLoading
                            ? CircularProgressIndicator(
                              color: ColorsManeger.red,
                            )
                            : SizedBox(),
                      ],
                    );
                  },
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
            child: CustomTextFormField(
              controller: cubit.controller,
              hintText: "message",
              isPassword: false,
              onFieldSubmitted: (value) {
                cubit.sendMessage(context, value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
