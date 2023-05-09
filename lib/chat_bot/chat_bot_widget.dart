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

  final supabaseClient = SupabaseClient('https://ynojtnvbhcizklalzkqp.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inlub2p0bnZiaGNpemtsYWx6a3FwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU4ODE1NTgsImV4cCI6MTk5MTQ1NzU1OH0.kykT0vQFlIlr9zbE2MQ_Vs486Pz9L-I48wJqxkcVrsY');

  void _sendMessage(String text) {
    setState(() {
      _messages.add({
        'text': text,
        'sender': 'user',
        'timestamp': DateTime.now(),
      });

      _sendReply(text);
    });
  }

  Future<void> _sendReply(String userMessage) async {
    String reply = await _generateReply(userMessage);
    setState(() {
      _messages.add({
        'text': reply,
        'sender': 'bot',
        'timestamp': DateTime.now(),
      });
    });
  }

Future<String> _generateReply(String userMessage) async {
  
  final response = await supabaseClient
      .from('INFOCHAT')
      .select('respuesta')
      .or('mensaje1.eq.${userMessage},mensaje2.eq.${userMessage}')
    .execute();
  
  if (response.data != null && response.data.length > 0) {
    final result = response.data[0];
    return result['respuesta'].toString();
  } else {
    return 'No entiendo tu pregunta. Por favor, intenta reformularla.';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFA8C6FA),
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryBtnText,
            size: 24.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(-1.0, 0.0),
              child: Text(
                'Chat',
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                    ),
              ),
            ),
          ],
        ),
        actions: [],
        centerTitle: false,
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
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
                          color:
                              isCurrentUser ? Color(0xFF1E2429) : Colors.white,
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
      ),
    );
  }
}
