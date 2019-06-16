import 'package:scoped_model/scoped_model.dart';
class ScopeDonate extends Model{
  int _count  = 0;
  bool _donateClicked = false;

  int get count => _count;

  set count(int value) {
    _count = value;
  }

  bool get donateClicked => _donateClicked;

  set donateClicked(bool donate) {
    if(_donateClicked == null){
      throw new ArgumentError();
    }
    _donateClicked = donate;
    notifyListeners();
  }

  void increment(){
    _count++;
    notifyListeners();
  }
  void decrement(){
    if(_count>0){
      _count--;
      notifyListeners();
    }

  }

}