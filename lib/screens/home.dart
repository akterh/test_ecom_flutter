import 'package:flutter/material.dart';
import 'package:test_project/repositories/product_repository.dart';
import 'package:test_project/ui_elements/product_card.dart';

class Home extends StatefulWidget {
  Home({Key key});




  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _productScrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    //print(MediaQuery.of(context).viewPadding.top);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: buildAppBar(statusBarHeight, context),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16.0,
                    16.0,
                    8.0,
                    0.0,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          4.0,
                          16.0,
                          8.0,
                          0.0,
                        ),
                        child: buildHomeProducts(context),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ));
  }

  buildHomeProducts(context) {
    return FutureBuilder(
        future: ProductRepository().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            /*print("product error");
            print(snapshot.error.toString());*/
            return Container(
              child: Text("error happened"),
            );
          } else if (snapshot.hasData) {
            //snapshot.hasData
            var productResponse = snapshot.data;
            return GridView.builder(

              itemCount: productResponse.products.length,
              controller: _productScrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.618),
              padding: EdgeInsets.all(8),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // 3
                return ProductCard(
                    image:
                    productResponse.products[index].image,
                    name: productResponse.products[index].name,
                    price: productResponse.products[index]
                        .price,
                  id:productResponse.products[index].id,
                    desc: productResponse.products[index].desc,

                );
              },
            );

          }else{
            return Container(
            );
          }

        }

        );
  }


  AppBar buildAppBar(double statusBarHeight, BuildContext context) {
    return AppBar(
      title: Text("Test Project"),
      centerTitle: true,
    );

  }
}
