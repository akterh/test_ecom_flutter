import 'package:test_project/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:test_project/screens/product_details.dart';

class ProductCard extends StatefulWidget {

  String image;
  String name;
  String price;
  String id;
  String desc;


  ProductCard({Key key, this.image, this.name, this.price,this.id,this.desc}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    print((MediaQuery.of(context).size.width - 48 ) / 2);

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetails(id: widget.id,name: widget.name,price: widget.price,image: widget.image,desc: widget.desc,);
        }));
      },
      child: Card(
         //clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          side: new BorderSide(color: MyTheme.light_grey, width: 1.0),
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0.0,
        child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  //height: 158,
                  height: (( MediaQuery.of(context).size.width - 28 ) / 2) + 2,
                  // height: (( MediaQuery.of(context).size.width - 28 ) / 2) + 2,
                  child: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16), bottom: Radius.zero),
                      child: Image.asset('assets/images/${widget.image}'),)),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: Text(
                        widget.name,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: MyTheme.font_grey,
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
                      child: Text(
                        "TK "+widget.price,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            color: MyTheme.accent_color,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
