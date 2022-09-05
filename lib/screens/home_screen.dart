import 'package:day23/data/data.dart';
import 'package:day23/models/restaurant.dart';
import 'package:day23/widgets/recent_orders.dart';
import 'package:day23/widgets/restaurant_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildRestaurant() {
    List<Widget> restaurantList = [];

    restaurants.forEach(
      (Restaurant restaurant) {
        restaurantList.add(
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestarantDetails(
                      restaurant: restaurant,
                    ),
                  ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0)),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Image(
                      image: AssetImage('${restaurant.imageUrl}'),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${restaurant.name}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text('${restaurant.address}'),
                      Text('0.2 Miles'),
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      },
    );
    return Column(
      children: restaurantList,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food Delivery'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                '(${currentUser.cart!.length})',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.close)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Recent Orders'),
          ),
          RecentOrders(),
          Column(
            children: [
              Text('Near by Restaurant'),
              buildRestaurant(),
            ],
          )
        ],
      ),
    );
  }
}
