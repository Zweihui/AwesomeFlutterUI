import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonScaffold extends Scaffold {
  final String title;
  final double appBarHeight;
  final bool showBackArrow;
  final BuildContext context;

  CommonScaffold({
    Key key,
    Widget body,
    Widget bottomNavigationBar,
    Widget bottomSheet,
    this.context,
    this.title,
    this.appBarHeight = 44.0,
    this.showBackArrow = true,
  }) : super(
          key: key,
          appBar: PreferredSize(
            child: Container(
              child: new AppBar(
                automaticallyImplyLeading: showBackArrow,
                leading: showBackArrow
                    ? IconButton(
                        onPressed: () {
                          if (context == null) {
                            return;
                          }
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            SystemNavigator.pop();
                          }
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Color(0xFF56565F),
                        ),
                      )
                    : null,
                title: Text(
                  title ?? "",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.black87,
                  ),
                ),
                brightness: Brightness.light,
                elevation: 0.0,
                backgroundColor:
                Colors.white, // or use Brightness.dark
              ),
            ),
            preferredSize: Size.fromHeight(appBarHeight),
          ),
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
        );
}
