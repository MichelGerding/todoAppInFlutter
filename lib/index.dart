//? Packages
// import 'package:http/http.dart';
import 'package:first_app/httpHandeler.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
//? widgets
import 'widgets/todoWidget.dart';
//? styles
import 'styles.dart';
//? models
import 'models/todoModel.dart';

//? pages
import 'newTodo_screen.dart';

//ignore: must_be_immutable
class Homepage extends StatefulWidget {
  List<TodoModel> todos = [];
  int uid = 0;

  Homepage({this.uid, List<TodoModel> todos = null}) {
    if (todos != null) {
      this.todos = todos;
    }
  }

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    if (this.widget.todos.length <= 0) {
      _getData(this.widget.uid);
    }
    print(this.widget.todos.length);
  }

  void _getData(int uid) {
    Future<String> jsonStrF = HttpHandler.fetchPost(uid);
    jsonStrF.then((String jsonStr) {
      List<dynamic> jsonO = json.decode(jsonStr);

      List<TodoModel> todos = [];
      for (var obj in jsonO) {
        todos.add(TodoModel.fromJson(obj));
      }
      setState(() {
        if (todos != null) {
          this.widget.todos = todos;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundPrimairy,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.transparent,
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
                      color: Colors.transparent,
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
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => NewTodoScreen(),
                        //   ),
                        // );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: CustomColors.backgroundSecundairy,
              ),
              height: MediaQuery.of(context).size.height,
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    child: ListView.builder(
                      itemCount: this.widget.todos.length,
                      itemBuilder: _getPosts,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getPosts(BuildContext context, int index) {
    // return Text("this is a fake todo");
    return Todo(todo: this.widget.todos[index]);
  }

  Future<Null> _onRefresh() async {
    _getData(this.widget.uid);
    print("refresh");

    return null;
  }
}
