import 'package:flutter/material.dart';
import 'package:reqres/core/model/model.dart';
import 'package:reqres/core/services/example_services.dart';
import 'package:reqres/core/view/example_two_page.dart';

class ExampleView extends StatefulWidget {
  ExampleView({Key? key}) : super(key: key);

  @override
  _ExampleViewState createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  final ApiService apiService = ApiService();
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: apiService.getPosts(),
        builder: (BuildContext context,AsyncSnapshot<List<User>> snapshot){
          if (snapshot.hasData) {
            List<User>? posts = snapshot.data;
            return ListView(
              children: posts!
                  .map(
                    (User user) => Card(
                      elevation: 2,
                      child: ListTile(
                        title: Text(user.title.toString()),
                        subtitle: Text("${user.id}"),
                        
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExampleSecondPage(user:user)));
                        },
                      ),
                    ),
                  )
                  .toList(),
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }),
    );
  }
}