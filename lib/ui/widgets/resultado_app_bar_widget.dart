import "package:flutter/material.dart";

class ResultadoAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool venceu;
  final Function onReiniciar;

  ResultadoAppBarWidget({@required this.venceu,@required this.onReiniciar});

  Color _getColor() {
    if (venceu == null) {
      return Colors.yellow;
    } else if (venceu) {
      return Colors.green[300];
    } else {
      return Colors.red[300];
    }
  }

  IconData _getIcon() {
    if (venceu == null) {
      return Icons.sentiment_satisfied;
    } else if (venceu) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: _getColor(),
              child: IconButton(
                padding: EdgeInsets.all(0),
                icon: Icon(
                  _getIcon(),
                  color: Colors.black,
                  size: 35,
                ),
                onPressed: onReiniciar,
              ),
            ),
          ),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(120);
}
