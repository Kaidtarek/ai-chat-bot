import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:testinfinity/message_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late DialogFlowtter dialogFlowtter ;
  final TextEditingController _controller = TextEditingController();
  List<Map<String,dynamic>> messages = [];
  @override
  void initState() {
    super.initState();
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.grey,
    appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14,vertical: 8),
        child: Column(
          children: [
            // NOTE :::: messages Screen
            Expanded(child: MessageScreen(messages: messages)),
            // NOTE :::: my send buttonsss idk 
            Container(
              color: Colors.deepPurple,
              child: Row(
                children: [ 
                  Expanded(child: TextField(controller: _controller,
                  style: const TextStyle(),
                  )),
                  IconButton(onPressed: (){
                    sendMessage(_controller.text);
                    _controller.clear();
                  }, icon: Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  sendMessage(String text) async {
    if (text.isEmpty) {
      print('NOTE:::: text is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])),true);
      });
      DetectIntentResponse response = await dialogFlowtter.detectIntent(queryInput: QueryInput(text: TextInput(text: text)));
    if (response.message == null) {
      return;
    } else {
      setState(() {
     addMessage(response.message!);

      });
    }
    }
    
  }
  addMessage(Message message ,[bool isUserMessage = false]){
    messages.add({'Message':message ,'isUserMessage':isUserMessage});
  }
}