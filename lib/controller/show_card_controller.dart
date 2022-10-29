import 'package:flutter/cupertino.dart';
import 'dart:math';
import '../componants/show_card.dart';

class ShowCardController extends ChangeNotifier {
  List<Show_Card> show_cards = [
    Show_Card(
      show_name: 'Code Geass',
      current_episode: '2',
      total_episodes: '22',
      image: NetworkImage('https://picsum.photos/100/100'),
    ),
  ];

  void AddShow(String show_name, String current_episode, String total_episodes,
      NetworkImage image) {
    final show_card = Show_Card(
      show_name: show_name,
      current_episode: current_episode,
      total_episodes: total_episodes,
      image: image,
    );
    show_cards.add(show_card);
    notifyListeners();
  }

  void IncreaseCurrentEpisode(Show_Card current_show) {
    var temp = int.parse(current_show.current_episode);
    temp++;
    current_show.current_episode = temp.toString();
    notifyListeners();
  }

  void DeleteShow(Show_Card current_show) {
    show_cards.remove(current_show);
    notifyListeners();
  }

  void UpdateWidget() {
    notifyListeners();
  }

  void ChangeImage(Show_Card current_show) {
    final _random = new Random();
    int random_number = _random.nextInt(4000);
    current_show.image =
        NetworkImage("https://loremflickr.com/100/100/$random_number");
    notifyListeners();
  }
}
