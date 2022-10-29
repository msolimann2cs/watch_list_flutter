import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watch_list_flutter/controller/show_card_controller.dart';

class Show_Card extends StatelessWidget {
  Show_Card({
    Key? key,
    required this.show_name,
    required this.current_episode,
    required this.total_episodes,
    required this.image,
  }) : super(key: key);
  String show_name;
  String current_episode;
  String total_episodes;

  NetworkImage image; //= NetworkImage('https://picsum.photos/100/100');

  bool name_changer = true;
  bool current_episode_changer = true;
  bool total_episodes_changer = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ShowCardController>(builder: (context, showData, child) {
      return GestureDetector(
        onTap: () {
          showData.ChangeImage(this);
        },
        child: Container(
          //color: Colors.green,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xff757575),
              ),
            ),
            //borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                  child: Image(
                    image: image,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: GestureDetector(
                        onTap: () {
                          name_changer = !name_changer;
                          showData.UpdateWidget();
                        },
                        child: name_changer
                            ? Text(
                                show_name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.lightBlueAccent,
                                ),
                              )
                            : Container(
                                width: 200,
                                child: TextField(
                                  autofocus: true,
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 20,
                                  ),
                                  controller:
                                      TextEditingController(text: show_name),
                                  //textAlign: TextAlign.center,
                                  onChanged: (value) {
                                    show_name = value;
                                  },
                                  onEditingComplete: () {
                                    name_changer = !name_changer;
                                    showData.UpdateWidget();
                                  },
                                ),
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            current_episode_changer = !current_episode_changer;
                            showData.UpdateWidget();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 39, 3, 10),
                            child: current_episode_changer
                                ? Text(
                                    '$current_episode',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.lightBlueAccent,
                                    ),
                                  )
                                : Container(
                                    width: 30,
                                    child: TextField(
                                      autofocus: true,
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 20,
                                      ),
                                      controller: TextEditingController(
                                          text: current_episode),
                                      //textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        current_episode = value;
                                      },
                                      onEditingComplete: () {
                                        current_episode_changer =
                                            !current_episode_changer;
                                        showData.UpdateWidget();
                                      },
                                    ),
                                  ),
                          ),
                        ),
                        // / $total_episodes
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 39, 3, 10),
                          child: Text(
                            '/',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            total_episodes_changer = !total_episodes_changer;
                            showData.UpdateWidget();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 39, 10, 10),
                            child: total_episodes_changer
                                ? Text(
                                    '$total_episodes',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.lightBlueAccent,
                                    ),
                                  )
                                : Container(
                                    width: 30,
                                    child: TextField(
                                      autofocus: true,
                                      style: TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 20,
                                      ),
                                      controller: TextEditingController(
                                          text: total_episodes),
                                      //textAlign: TextAlign.center,
                                      onChanged: (value) {
                                        total_episodes = value;
                                      },
                                      onEditingComplete: () {
                                        total_episodes_changer =
                                            !total_episodes_changer;
                                        showData.UpdateWidget();
                                      },
                                    ),
                                  ),
                          ),
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showData.DeleteShow(this);
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.lightBlueAccent,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showData.IncreaseCurrentEpisode(this);
                              },
                              child: Icon(
                                Icons.add_box_outlined,
                                color: Colors.lightBlueAccent,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
