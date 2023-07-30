import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/app/core/auth/auth_provider.dart';
import 'package:todo_list/app/core/ui/theme_extensions.dart';
import 'package:todo_list/app/core/ui/todo_list_icons.dart';
import 'package:todo_list/app/modules/home/widget/home_drawer.dart';
import 'package:todo_list/app/modules/home/widget/home_filters.dart';
import 'package:todo_list/app/modules/home/widget/home_header.dart';
import 'package:todo_list/app/modules/home/widget/home_taskes.dart';
import 'package:todo_list/app/modules/home/widget/home_week_filter.dart';
import 'package:todo_list/app/modules/tasks/task_create_page.dart';
import 'package:todo_list/app/modules/tasks/tasks_module.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void goToCreateTask(BuildContext context) {
    // navegação e trasição
    // Navigator.of(context).pushNamed('/task/create');
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(microseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          animation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInQuad,
          );
          return ScaleTransition(
            scale: animation,
            alignment: Alignment.bottomRight,
            child: child,
          );
        },
        pageBuilder: (context, animation, secondaryAnimation) {
          return TasksModule().getPage('/task/create', context);
        },
      ),
      // MaterialPageRoute(
      //   builder: (_) => TasksModule().getPage('/task/create', context),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.primaryColor),
        backgroundColor: Color(0XFFFAFBFE),
        elevation: 0,
        actions: [
          PopupMenuButton(
            icon: Icon(TodoListIcons.filter),
            itemBuilder: (_) => [
              PopupMenuItem<bool>(child: Text('Mostrar tarefas concluídas'))
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: context.primaryColor,
        onPressed: () => goToCreateTask(context),
        child: Icon(Icons.add),
      ),
      backgroundColor: Color(0XFFFAFBFE),
      drawer: HomeDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeHeader(),
                      HomeFilters(),
                      HomeWeekFilter(),
                      HomeTaskes(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
