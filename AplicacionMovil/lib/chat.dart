import 'dart:convert';

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'Messages.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    super.initState();
    _initDialogFlowtter();
  }

  _initDialogFlowtter() async {
    try {
      String content = await rootBundle.loadString('assets/dialog_flow_auth.json');
      print(content);  // Print the content of the file for debugging
      final Map<String, dynamic> configMap = json.decode(content);
      dialogFlowtter = DialogFlowtter.fromJson(configMap);
    } catch (e) {
      print('Error initializing DialogFlowtter: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Ayuda'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Color(0xFF621518),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    icon: Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
String getLugar(String text) {
  // Split the text into words
  List<String> words = text.split(' ');

  // Retrieve the last word
  if (words.isNotEmpty) {
    if (words.first == 'OficinaLugar') {
      String lugar = words.last;
      switch (lugar) {
        case 'UNAYOE':
          return 'La UNAYOE se encuentra en el Tercer Piso. ';
        case 'Matricula':
          return 'La Oficina de Matrícula se encuentra en el Tercer Piso. ';
        default:
          return 'No sé dónde está eso.';
      }
    } else {
      return ''; // No need to handle this case separately, as the string is already empty.
    }
  } else {
    // Handle the case where the string is empty
    return '';
  }
}

sendMessage(String text) async {
  if (text.isEmpty) {
    // ignore: avoid_print
    print('Message is empty');
  } else {
    setState(() async {
      // Create a Message object with the user's input
      Message userMessage = Message(text: DialogText(text: [text]));

      // Add the user's message to the list
      addMessage(userMessage, true);

      // Send the user's message to DialogFlowtter
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
        queryInput: QueryInput(text: TextInput(text: text)),
      );

      // Check if the response has a message
      if (response.message != null) {
        // Extract the location information from the response
        String locationInfo = getLugar(response.message!.text!.text!.first);

        // Check if the location information is not empty
        if (locationInfo.isNotEmpty) {
          // Create a new message with the location information
          Message locationMessage = Message(text: DialogText(text: [locationInfo]));

          // Add the location message to the list
          addMessage(locationMessage, false);
        } else {
          // If locationInfo is empty, add the original DialogFlow response
          addMessage(response.message!,false);
        }
      }
    });
  }
}

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
