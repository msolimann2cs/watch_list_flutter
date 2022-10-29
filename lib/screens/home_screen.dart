import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_list_flutter/controller/show_card_controller.dart';
import 'package:watch_list_flutter/screens/add_show_screen.dart';
import 'package:watch_list_flutter/componants/show_card.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//   static String id = 'home_screen';
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'home_screen';
  // final test_card = Show_Card(
  //     show_name: "Code Geass", current_episode: '4', total_episodes: '25');
  //

  @override
  Widget build(BuildContext context) {
    return Consumer<ShowCardController>(
      builder: (context, showData, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            child: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddShow(
                        // addShowCallback:
                        //     (show_name, current_episode, total_episodes) {
                        //   showData.AddShow(
                        //       show_name, current_episode, total_episodes);
                        // },
                        ),
                  ),
                ),
              );
            },
          ),
          // ------------------------ APP BAR --------------------------
          appBar: AppBar(
            title: const Center(
              child: Text(
                "Watch List",
              ),
            ),
          ),
          // ------------------------ BODY ------------------------------
          body: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return showData.show_cards[index]; //show_cards[index];
              },
              itemCount: showData.show_cards.length,
            ),
          ),
        );
      },
    );
  }
}

// class Test {
//   String t1 = '2';
// }
