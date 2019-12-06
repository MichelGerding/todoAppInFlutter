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

//ignore: must_be_immutable
class Homepage extends StatefulWidget {
  Color _backgroundColor = CustomColors.backgroundPrimairy;
  List<TodoModel> todos = [];
  int uid = 0;
//ignore: avoid_init_to_null
  Homepage({this.uid, List<TodoModel> todos = null}) {
    if (todos != null) {
      this.todos = todos;
    }
  }

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  BorderRadius _borderRadius = BorderRadius.only(
      topLeft: Radius.circular(50), topRight: Radius.circular(50));

  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
    _getData(this.widget.uid);
    if (this.widget.todos.length > 0) {}
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
        this.widget._backgroundColor = CustomColors.backgroundSecundairy;
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
                  child: Image.asset(
                    "assets/images/home/header.jpeg",
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
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
                color: this.widget._backgroundColor,
              ),
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: ClipRRect(
                  borderRadius: _borderRadius,
                  child: MediaQuery.removePadding(
                    context: context,
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          color: Colors.white70,
                          height: 0,
                          thickness: 2,
                          indent: 15,
                          endIndent: 15,
                        );
                      },
                      controller: _controller,
                      padding: EdgeInsets.zero,
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

  _scrollListener() {
    setState(() {
      if (_controller.offset >= _controller.position.maxScrollExtent &&
          !_controller.position.outOfRange) {
        _borderRadius = BorderRadius.all(Radius.circular(50));
        print("bottom");
      } else {
        _borderRadius = BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50));
        print("top");
      }
    });
  }

  Widget _getPosts(BuildContext context, int index) {
    // return Text("this is a fake todo");
    return Todo(
      index: index,
      todo: this.widget.todos[index],
      removeTodo: (int index) {
        // HttpHandler.deletePost(
        //     userId: this.widget.uid, postId: this.widget.todos[index].postId);
        // _onRefresh();
        print(this.widget.todos[index].postId);
      },
      undoTodo: (int index) {
        HttpHandler.addPost(
            userId: this.widget.uid, data: this.widget.todos[index].toJson());
        _onRefresh();
        print(index);
      },
    );
  }

  Future<Null> _onRefresh() async {
    _getData(this.widget.uid);
    print("refresh");

    return null;
  }
}
