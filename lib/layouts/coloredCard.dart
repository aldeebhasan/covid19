import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class ColoredCard extends StatefulWidget {
  bool loading  = true;
  String title = "";
  String subtitle = "";
  Color color = Colors.white;
  String icon_path="assets/images/logo.png";

  ColoredCard(this.loading,this.title,this.subtitle,this.color,icon_path);

  @override
  _ColoredCardState createState() => _ColoredCardState();
}

class _ColoredCardState extends State<ColoredCard> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        color: widget.color,
        elevation: 5,
        child:
        Column(
          children: <Widget>[
            Visibility(
              visible: widget.loading,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SpinKitRipple(
                    color: Colors.white,
                    size: 25.0,
                  ),
                ),
              )
            ),
            Visibility(
              visible: !widget.loading,
              child: ListTile(
                title: Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'stc',fontSize: 18),),
                subtitle: Text(widget.subtitle,style: TextStyle(fontFamily: 'stc',fontSize: 20),),
                leading: CircleAvatar(
                  backgroundColor: widget.color,
                  backgroundImage: AssetImage(widget.icon_path),
                  radius: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
