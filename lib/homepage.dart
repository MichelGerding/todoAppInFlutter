//? Packages
// import 'package:http/http.dart';
import 'package:flutter/material.dart';
//? models
import 'models/todoModel.dart';
//? widgets
import 'widgets/todoWidget.dart';
//? styles
import 'styles.dart';

class Homepage extends StatefulWidget {
  final List todos;
  Homepage({this.todos});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      "https://images.pexels.com/photos/169573/pexels-photo-169573.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Text(
                          "TODO",
                          style: TextStyles.header,
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 150),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: Gradients.buttonGradient,
                      ),
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Icon(
                          Icons.add,
                          size: 50,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print("");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 240,
              child: ListView.builder(
                itemCount: this.widget.todos.length,
                itemBuilder: _getPosts,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getPosts(BuildContext context, int index) {
    return Todo(todo: this.widget.todos[index]);
  }
}
