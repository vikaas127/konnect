import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:konnect/theme/mycolors.dart';
import 'package:konnect/theme/theme.dart';

class Header extends StatelessWidget {
  final String label;

  const Header(
    this.label, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.centerLeft,
      color: MyColors.iconc,
      child: Text(
        label,
        style:theme().title14w
      ),
    );
  }
}

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final TextStyle? style;
  final String label;
  final String? icon;

  const Button(
    this.label, {
    Key? key,
    this.icon,
    this.style,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          SizedBox(height: 6),
          if (label.isNotEmpty) ...[
            Container(
              child: Container(
                decoration: BoxDecoration(


                color:Colors.white,
                border: Border.all(color:Color(0xFFD6D6D6),
                    width: 2.0
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(30.0) //                 <--- border radius here
                ),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: CircleAvatar(
                    radius: 19,
                    backgroundColor: Color(0xFFE0E0E0),
                    child: Padding(
                      padding: const EdgeInsets.all(6.5),
                      child: Image.asset(
                          icon ?? 'assets/icons/kmb.png',
                        color: MyColors.primary,),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12)
          ],
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style ??
                TextStyle(color: MyColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
class Tablerow extends StatelessWidget {

  final TextStyle? style;
  final String label;
  final String? icon;

  const Tablerow(
      this.label, {
        Key? key,
        this.icon,
        this.style,

      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 6),
          if (label.isNotEmpty) ...[
            Container(
              child: Container(
                decoration: BoxDecoration(


                  color: Colors.grey,
                  border: Border.all(
                      width: 2.0
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0) //                 <--- border radius here
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Color(0xFFEEEEEE),
                    child: Image.asset(
                      icon ?? 'assets/icons/kmb.png',
                      color: MyColors.primary,),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12)
          ],
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style ??
                TextStyle(color: MyColors.primary,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 6),
        ],
      ),
    );
  }
}
class SearchListView extends StatelessWidget {
  final TextEditingController? controller;
  final List<Widget> children;

  SearchListView({
    Key? key,
    this.controller,
    this.children = const <Widget>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tvController = controller ?? TextEditingController();
    return Column(
      children: [
     /*   Container(
          margin: EdgeInsets.all(12),
          child: TextFormField(
            cursorColor: Colors.white,
            controller: tvController,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: tvController.text.length > 0
                  ? IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                      onPressed: () => tvController.clear(),
                    )
                  : Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),*/
        Expanded(
          child: tvController.text.isNotEmpty && children.isEmpty
              ? Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: tvController.text,
                      children: [
                        TextSpan(
                          text: '\nNot found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        )
                      ],
                      style: TextStyle(
                        fontSize: 24,
                        color: MyColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : ListView(
                  padding: EdgeInsets.all(12),
                  children: children,
                ),
        ),
      ],
    );
  }
}

showSnackBar(
  BuildContext context, {
  String? message,
}) {
  var content = Container(
    alignment: Alignment.center,
    height: 60,
    child: Text(
      message ?? 'No found',
      style: TextStyle(
        fontSize: 18,
      ),
    ),
  );
  var snackBar = SnackBar(content: content);
  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
}

Widget? snapshotView(AsyncSnapshot snapshot) {
  var _style = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  switch (snapshot.connectionState) {
    case ConnectionState.none:
    case ConnectionState.active:
    case ConnectionState.waiting:
      return Center(child: CircularProgressIndicator());
    case ConnectionState.done:
      if (snapshot.hasError) {
        print('error => ${snapshot.error}');
        return Center(
          child: Text(
            'Something went wrong',
            style: _style,
          ),
        );
      }
      var isEmpty = (snapshot.data ?? []).isEmpty;
      if (snapshot.hasData && isEmpty) {
        print('data empty => $isEmpty');
        return Center(
          child: Text(
            'Empty',
            style: _style,
          ),
        );
      }
  }
  return null;
}
