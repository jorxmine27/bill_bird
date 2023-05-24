import '/flutter_flow/chat/index.dart';
import 'package:supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatBotWidget extends StatefulWidget {
  const ChatBotWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  _ChatBotWidgetState createState() => _ChatBotWidgetState();
}

class _ChatBotWidgetState extends State<ChatBotWidget> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _messages = [];
  int? _lastMessageId = 0;

  final supabaseClient = SupabaseClient(
      'https://ynojtnvbhcizklalzkqp.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlub2p0bnZiaGNpemtsYWx6a3FwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU4ODE1NTgsImV4cCI6MTk5MTQ1NzU1OH0.kykT0vQFlIlr9zbE2MQ_Vs486Pz9L-I48wJqxkcVrsY');

  _ChatBotWidgetState() {
    _messages.add({
      'text':
          'Hi I am BillBird, If you want to know things about my aplicaction please, write "Hello" to start conversation.',
      'sender': 'bot',
      'timestamp': DateTime.now(),
    });
  }

  void _sendMessage(String text) {
    if (text.toLowerCase() == 'clear') {
      setState(() {
        _messages.clear();
        _lastMessageId = 0;
      });
    } else {
      setState(() {
        _messages.add({
          'text': text,
          'sender': 'user',
          'timestamp': DateTime.now(),
        });

        _sendReply(text);
      });
    }
  }

  Future<void> _sendReply(String userMessage) async {
    String reply = await _generateReply(userMessage, _lastMessageId);
    setState(() {
      _messages.add({
        'text': reply,
        'sender': 'bot',
        'timestamp': DateTime.now(),
      });
    });
  }

  Future<String> _generateReply(String userMessage, int? lastMessageId) async {
    try {
      var query = supabaseClient
          .from('INFOCHAT')
          .select('id_message, respuesta')
          .or('mensaje1.eq.${userMessage},mensaje2.eq.${userMessage}');

      if (lastMessageId != null) {
        query = query.eq('id_last_message', lastMessageId);
      }

      final response = await query.execute();

      if (response.data != null && response.data.length > 0) {
        final result = response.data[0];
        _lastMessageId = result['id_message'];
        return result['respuesta'].toString();
      } else {
        return 'No entiendo tu pregunta. Por favor, intenta reformularla.';
      }
    } catch (e) {
      print('Error al generar respuesta: $e');
      return 'Ocurrió un error. Por favor, intenta de nuevo.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 4),
                    blurRadius: 2,
                    blurStyle: BlurStyle.normal
                )
              ],
              color: Color(0xFFFFBF00),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, top: 16),
                child: FloatingActionButton(
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
              )
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = _messages[index];
                final isCurrentUser = message['sender'] == 'user';
                return Align(
                  alignment: isCurrentUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    padding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: isCurrentUser ? Colors.white : Color(0xFFA8C6FA),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      message['text'],
                      style: GoogleFonts.getFont(
                        'DM Sans',
                        color: isCurrentUser
                            ? Color.fromARGB(255, 41, 41, 30)
                            : Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje...',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      fillColor: Color(0xFFF2F4F8),
                      filled: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      _sendMessage(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
