import 'package:flutter/material.dart';
import 'package:watch_list_flutter/controller/show_card_controller.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class AddShow extends StatelessWidget {
  const AddShow({Key? key}) : super(key: key);
  //final Function addShowCallback;
  //AddShow(this.addShowCallback);
  @override
  Widget build(BuildContext context) {
    String show_name = '';
    String current_episode = '';
    String total_episodes = '';
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Show Name',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                show_name = value;
              },
            ),
            const Text(
              'Current Episode',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                current_episode = value;
              },
            ),
            const Text(
              'Total Episodes',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                total_episodes = value;
              },
            ),
            ElevatedButton(
              onPressed: () {
                //addShowCallback(show_name, current_episode, total_episodes);
                //print("pressed");
                final _random = new Random();
                int random_number = _random.nextInt(4000);
                NetworkImage image = NetworkImage(
                    "https://loremflickr.com/100/100/$random_number");
                Provider.of<ShowCardController>(context, listen: false)
                    .AddShow(show_name, current_episode, total_episodes, image);
                //print("pressed2");
                //Provider.of<ShowCardController>(context, listen: false).ChangeImage(current_show)
                Navigator.pop(context);
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
