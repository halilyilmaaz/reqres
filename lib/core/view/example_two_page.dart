import 'package:flutter/material.dart';

import 'package:reqres/core/model/model.dart';

class ExampleSecondPage extends StatelessWidget {
  final User user;
  const ExampleSecondPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(user.title.toString(),style: TextStyle(color: Colors.black)), 
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(         
          height: MediaQuery.of(context).size.height * 0.5,
          child: Card(
            color: Colors.white,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            elevation: 3,
            child: Stack(
              children: [
                Positioned(child: Container(decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,image: NetworkImage("https://picsum.photos/536/354"))
                ),)),
                Positioned(bottom: 50,left: 50, right: 50, child: Text("${user.body}",overflow: TextOverflow.fade,style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white))),
              ],
            )
          )
        ),
      ),
    );
  }
}
