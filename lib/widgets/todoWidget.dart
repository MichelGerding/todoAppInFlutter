import 'package:flutter/material.dart';
//? models
import '../models/todoModel.dart';

import '../styles.dart';

class Todo extends StatefulWidget {
  final TodoModel todo;
  Widget _subtitle;

  final List<Widget> _checkbox = Checkboxes.primary;
  bool _checked = false;

  Todo({Key key, this.todo}) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.background,
      child: GestureDetector(
        child: ListTile(
          onLongPress: () {
            showDialog(
              // position: RelativeRect.fromLTRB(100, 100, 100, 100),
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  title: Text(
                    "Todo setting",
                    style: TextStyles.titleCustom(
                        textColor: Color(0xfa000000),
                        fontWeight: FontWeight.w600),
                  ),
                  content: Text(
                    "Title: ${widget.todo.title}",
                    style: TextStyles.subTitleCustom(textColor: Colors.black),
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 13.0),
                            child: Buttons.popupButton(
                              child: Text(
                                "Remove",
                                style: TextStyles.subTitle,
                              ),
                              callback: () {},
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 13.0),
                            child: Buttons.popupButton(
                              child: Text(
                                "edit",
                                style: TextStyles.subTitle,
                              ),
                              callback: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
          contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 5),
          leading: FloatingActionButton(
            child: widget._checkbox[widget._checked ? 1 : 0],
            onPressed: () {
              setState(() {
                widget._checked = !widget._checked;
              });
            },
            backgroundColor: Colors.transparent,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.widget.todo.title,
                style: TextStyles.title,
              ),
              Text(
                "${this.widget.todo.date} - ${_daysRemaining(this.widget.todo.deadlineDate)} days left",
                style: TextStyles.subTitle,
              ),
            ],
          ),
          // title: Text(
          //   this.widget.todo.title,
          //   style: TextStyles.title,
          // ),
          // subtitle: this.widget._subtitle,
        ),
      ),
    );
  }

  String _daysRemaining(DateTime date) {
    DateTime now = DateTime.now();
    return date.difference(now).inDays.toString();
  }
}
