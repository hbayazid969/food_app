import 'package:day23/data/data.dart';
import 'package:day23/models/food.dart';
import 'package:day23/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestarantDetails extends StatefulWidget {
  Restaurant? restaurant;

  RestarantDetails({this.restaurant});

  @override
  State<RestarantDetails> createState() => _RestarantDetailsState();
}

class _RestarantDetailsState extends State<RestarantDetails> {
  buildMenuItem(Food menuItem) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            '${menuItem.imageUrl}',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage('${widget.restaurant!.imageUrl}'),
                height: 210,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.deepOrangeAccent,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${widget.restaurant!.name}'),
                    Text('${widget.restaurant!.address}'),
                  ],
                ),
                Text('0.2 Miles'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(25.0)),
                  child: Center(child: Text('Review')),
                ),
                Container(
                  child: Center(child: Text('Contact')),
                  height: 40,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(25.0)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text('Menu'),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(widget.restaurant!.menu!.length, (index) {
                Food food = widget.restaurant!.menu![index];
                return buildMenuItem(food);
              }),
            ),
          )
        ],
      ),
    );
  }
}
