import 'package:farmers_sago/LocationTracking.dart';
import 'package:farmers_sago/Town_Name.dart';
import 'package:farmers_sago/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:farmers_sago/GoodsPage.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:farmers_sago/OrganicForm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/fruit1.jpg'),
          AssetImage('images/fruit2.jpg'),
          AssetImage('images/fruit3.jpg'),
          AssetImage('images/fruit4.jpg'),
          AssetImage('images/vegetable1.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 5.0,
        indicatorBgPadding: 4.0,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: Colors.purple,
        title: Text("Farmers SAGO"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          new IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: [
            new UserAccountsDrawerHeader(
              accountName: Text("Chandeesh"),
              accountEmail: Text("chandeeshmr26@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.purple),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => new HomePage())),
              child: ListTile(
                title: Text("Home Page"),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Account"),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) => new App())),
              child: ListTile(
                title: Text("Location"),
                leading: Icon(Icons.map),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("My Orders"),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new Loginscrren())),
              child: ListTile(
                title: Text("Organic Farmers"),
                leading: Icon(Icons.login),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => new Goods())),
              child: ListTile(
                title: Text("Goods Upload Page"),
                leading: Icon(Icons.login),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Agri Support"),
                leading: Icon(Icons.phone),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("Settings"),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text("About Us"),
                leading: Icon(Icons.help),
              ),
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (context) => new SignInScreen())),
              child: ListTile(
                title: Text("Logout"),
                leading: Icon(Icons.logout),
              ),
            ),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          image_carousel,
          new Padding(
            padding: const EdgeInsets.all(40.0),
            child: new Text('Welcome to Farmers SAGO'),
          ),
          Container(
            height: 400.0,
            child: new Carousel(
              boxFit: BoxFit.cover,
              images: [
                AssetImage('images/cart.png'),
              ],
              autoplay: false,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
              dotSize: 0,
              indicatorBgPadding: 2.0,
            ),
          ),
          Container(
              padding:
                  const EdgeInsets.only(left: 75.0, top: 50.0, right: 75.0),
              child: new RaisedButton(
                  child: const Text('Get Products ==>'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GetingInfo()),
                    );
                  })),
          //  HorizontalList(),
        ],
      ),
    );
  }
}
