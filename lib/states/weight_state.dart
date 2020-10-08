import 'package:flutter/cupertino.dart';
import 'package:flutter_provide_pack/models/weight.dart';

class WeightState with ChangeNotifier {
  List<Weight> _weight = [
    Weight(
      value: 65,
      dateTime: DateTime.utc(2020, 10, 8),
      diet: 8
    ),
    Weight(
      value: 67,
      dateTime: DateTime.utc(2020, 10, 8),
      diet: 5
    ),
    Weight(
      value: 68,
      dateTime: DateTime.utc(2020, 10, 8),
      diet: 6
    ),
  ];

  List<Weight> get weights => _weight;

  add(Weight weight){
    _weight.insert(0, weight);
    notifyListeners();
  }

  delete(Weight weight){
    _weight.remove(weight);
    notifyListeners();
  }

}
