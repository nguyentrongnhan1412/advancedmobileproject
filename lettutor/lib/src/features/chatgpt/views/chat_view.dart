import 'package:flutter/material.dart';
import '../widgets/chat_row.dart';
import 'package:lettutor/src/models/message/message_type.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:lettutor/src/constants/chat_gpt_api_key.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);
  @override
  State<ChatView> createState() => _ChatViewState();
}


class _ChatViewState extends State<ChatView> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final List<Message> _messages = [];
  late bool isLoading;
  TextEditingController messageTextController = TextEditingController();
  late OpenAI openAI;

  @override
  void initState() {
    openAI = OpenAI.instance.build(
        token: apikey,
        baseOption: HttpSetup(
            receiveTimeout: const Duration(seconds: 20),
            connectTimeout: const Duration(seconds: 20)));
    super.initState();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 70,
        title:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Text("Chat With OpenAI"),
        ),
        backgroundColor: Colors.pink,
      ),

      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children:
          [

            Expanded(
              child: _buildList(),
            ),

            Visibility(
              visible: isLoading,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children:
                [
                  _buildInput(),
                  _buildSubmit(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubmit() {
    return Visibility(
      visible: !isLoading,
      child: IconButton(
        color: Colors.pink,
        icon: const Icon(Icons.send_rounded,),
        onPressed: () async {
          setState(() {
              _messages.add(
                Message(text: _textController.text, messageType: MessageType.user),
              );
              isLoading = true;
            },
          );

          var input = _textController.text;
          _textController.clear();

          Future.delayed(const Duration(milliseconds: 50))
              .then((_) => _scrollDown());

          generateResponse(input).then((value) {
            setState(() {
              isLoading = false;
              _messages.add(
                Message(
                  text: value,
                  messageType: MessageType.bot,
                ),
              );
            });
          });
          _textController.clear();
          Future.delayed(const Duration(milliseconds: 50))
              .then((_) => _scrollDown());
        },
      ),
    );
  }

  Expanded _buildInput() {
    return Expanded(
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(color: Colors.pink),
        controller: _textController,
        decoration: const InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            hintText: 'Write something here . . .'),
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        var message = _messages[index];
        return ChatRow(
          text: message.text ?? "",
          messageType: message.messageType,
        );
      },
    );
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<String?> generateResponse(String payload) async {
    final request = ChatCompleteText(
        model: ChatModel.gptTurbo, maxToken: 2000, messages:
    [
      Map.of({"role": "user", "content": payload})
    ]);
    final response = await openAI.onChatCompletion(request: request);
    if (response != null && response.choices != null && response.choices[0].message != null){
      return response.choices[0].message?.content;
    }
    return "";
  }


}