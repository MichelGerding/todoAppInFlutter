import 'package:flutter/material.dart';
//? models
import '../models/todoModel.dart';
import 'buttons.dart';

import '../styles.dart';

//ignore: must_be_immutable
class Todo extends StatefulWidget {
  final TodoModel todo;
  final Function removeTodo;
  final Function undoTodo;
  final int index;

  final List<Widget> _checkbox = Checkboxes.primary;
  bool _checked = false;

  Todo({
    Key key,
    this.todo,
    @required this.removeTodo,
    @required this.undoTodo,
    @required this.index,
  }) : super(key: key);

  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  Widget _dismissedBackground;
  final Key _key = UniqueKey();

  @override
  void initState() {
    _dismissedBackground = Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      color: Colors.red[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ],
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
          direction: DismissDirection.horizontal,
          background: _dismissedBackground,
          onDismissed: (direction) {
            this.widget.removeTodo(this.widget.index);
            Scaffold.of(context).showSnackBar(
              //! Snackbar -------------------------------
              SnackBar(
                key: _key,
                backgroundColor: Colors.white,
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Removed todo",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Container(
                      key: UniqueKey(),
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: Gradients.buttonGradient,
                      ),
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text("undo",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat',
                            )),
                        onPressed: () {
                          this.widget.undoTodo(this.widget.index);
                          Scaffold.of(context).hideCurrentSnackBar();
                        },
                      ),
                    )
                  ],
                ),
              ),
              //! End Of Snackbar -------------------------------
            );
          },
          //? key: Key(this.widget.todo.postId.toString()),
          key: UniqueKey(),
          child: Card(
            color: Colors.transparent,
            elevation: 0,
            child: GestureDetector(
              child: ListTile(
                onLongPress: () {
                  showDialog(
                    //! DialogBox -----------------------------------------------------------
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        title: Text(
                          "Todo setting",
                          style: TextStyles.titleCustom(
                              textColor: Color(0xfa000000),
                              fontWeight: FontWeight.w600),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 26),
                        content: Text(
                          "Title: ${widget.todo.title}",
                          style: TextStyles.subTitleCustom(
                              textColor: Colors.black),
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
                  //! Endo Of DialogBox -----------------------------------------------------------
                },
                contentPadding:
                    EdgeInsets.symmetric(vertical: 17, horizontal: 5),
                leading: FloatingActionButton(
                  elevation: 0,
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
          ),
        ),
      ],
    );
  }

  String _daysRemaining(DateTime date) {
    DateTime now = DateTime.now();
    return date.difference(now).inDays.toString();
  }
}
