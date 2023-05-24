import 'package:flutter/material.dart';
import 'package:todo_list/app/core/widget/todo_list_logo.dart';
// import 'package:provider/provider.dart';
// import 'package:todo_list/app/modules/auth/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider.of<LoginController>(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    TodoListLogo()
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
