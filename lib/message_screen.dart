import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
   List messages = [];
   MessageScreen({super.key, required this.messages});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: ((context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: widget.messages[index]['isUserMessage'] ?MainAxisAlignment.end  : MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: widget.messages[index]['isUserMessage']? Radius.circular(0) : Radius.circular(20),
                    topRight: widget.messages[index]['isUserMessage']? Radius.circular(20) : Radius.circular(0),
                    ),
                  color: widget.messages[index]['isUserMessage']? Colors.green[600] : Colors.green[400],
                  
                ),
                child: Text(widget.messages[index]['Message'].text.text[0],style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        );
      }),
     separatorBuilder: (context,indext)=> Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length);
  }
}