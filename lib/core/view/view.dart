import 'package:flutter/material.dart';
import 'package:reqres/core/model/model.dart';
import 'package:reqres/core/services/example_services.dart';
import 'package:reqres/core/view/example_two_page.dart';

class View extends StatefulWidget {
  
  View({Key? key}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  final ApiService apiService = ApiService();
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        title: const Text("Fetch API")
      ),
      body: FutureBuilder(
        future: apiService.getPosts(),
        builder: (BuildContext context,AsyncSnapshot<List<User>> snapshot){
          if (snapshot.hasData) {
            List<User>? user = snapshot.data;
            return ListView.builder(
              itemCount: user!.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return ExampleSecondPage(user: user[index]);}));
                  },
                  child: Card(
                    elevation: 2,
                    child: ListTile(
                      title: Text(user[index].title.toString()),
                      subtitle: Text(user[index].body.toString()),
                      trailing: ClipRRect( 
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network("https://picsum.photos/536/354")),
                    ),
                  ),
                ); 
              }
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }),
    );
  }
}