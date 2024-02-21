import 'package:flutter/material.dart';
import 'package:user_api/utility/utility.dart';

class styleClass extends StatelessWidget {
  const styleClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
              "User Api  👤 ️",
              style: TextStyle(
                color: Colors.brown,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              )
          ),
        ),
      ),
      body: ListView.builder(itemBuilder: (context, index){
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  AppUtility.listResponse[index]['id'].toString(),
                  style: TextStyle(color: Colors.brown, fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                elevation: 8,
                margin: EdgeInsets.all(14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Adds rounded corners to the card
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                          AppUtility.listResponse[index]['avatar'],
                          height: 200, // Adjust the height of the image
                          fit: BoxFit.cover
                      ),
                    ),
                    SizedBox(height: 8.0), // Adds space between the image and the text
                    Row(
                      children: [
                        Text(
                          AppUtility.listResponse[index]['first_name'].toString(),
                          style: TextStyle(color: Colors.brown, fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 6.0),
                        Text(
                          AppUtility.listResponse[index]['last_name'].toString(),
                          style: TextStyle(color: Colors.brown, fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        AppUtility.listResponse[index]['email'].toString(),
                        style: const TextStyle(
                          color: Colors.brown,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
        itemCount: AppUtility.listResponse == null ? 0: AppUtility.listResponse.length,
      ),
    );
  }
}
