import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationRow extends StatelessWidget {
  final Map conversation;
  ConversationRow(this.conversation);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            conversation['name'].toString(),
            style: GoogleFonts.nunito(
                color: Colors.grey[500],
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
