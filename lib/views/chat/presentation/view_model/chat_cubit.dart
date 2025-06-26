import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:meta/meta.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/views/chat/data/model/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  ScrollController scrollController = ScrollController();
  late TextEditingController controller = TextEditingController();
  List<MessageModel> message = [];

  Future<void> sendMessage(BuildContext context, String senderMessage) async {
    emit(ChatLoading());
    try {
      scrollController.jumpTo(0);
      message.add(MessageModel(senderMessage, true));
      emit(ChatSuccess());
      emit(ChatLoading());
      controller.clear();
      await chatWithAI(context, senderMessage);
      emit(ChatSuccess());
    } on Exception catch (e) {
      emit(ChatFailure(e.toString()));
    }
  }

  Future<void> chatWithAI(BuildContext context, String prompt) async {
    await Gemini.instance
        .prompt(parts: [Part.text(prompt)])
        .then((value) {
          message.add(MessageModel(value?.output ?? '', false));
        })
        .catchError((e) {
          showSnackBar(context, e.toString());
        });
  }
}
