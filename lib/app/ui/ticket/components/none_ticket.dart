import 'package:enft/app/ui/ticket/components/ticket.dart';
import 'package:flutter/material.dart';

class NoneTicket extends StatelessWidget {
  const NoneTicket({
    Key? key,
    required this.index,
    required this.description,
  }) : super(key: key);

  final int index;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Ticket(
        index: index,
        detail: Center(
            child: Text(description,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4.0))));
  }
}
