import 'package:flutter/foundation.dart';

class Todos {
  final String id;
  DateTime createDate = new DateTime.now();
  String title;
  bool done = false;
  bool cancel = false;

  Todos({@required this.id, @required this.title});
}

class TodoListMap {
  final _listMap = new Map<String, List<Todos>>();

  Map<String, List<Todos>> get listMap {
    return _listMap;
  }

  Map<String, List<Todos>> get() {
    return _listMap;
  }
  
  Map<String, dynamic> findItem({String id, String title}) {
    int idx;
    String dateKey;
    Todos item;
    for (final key in this._listMap.keys) {
      idx = this._listMap[key].indexWhere((ele) => ele.id == id);
      if (idx != null) {
        dateKey = key;
        item = this._listMap[key][idx];
        break;
      }
    }
    return {'found': idx != null, 'index': idx, 'date': dateKey, 'item': item};
  }
  
  add(String date) {
    if (this._listMap.containsKey(date)) return;
    this._listMap[date] = [];
  }
    
  removeItem(String id) {
    final item = this.findItem(id: id);
    if (item['found'] == false) return;
    final date = item['date'];
    final index = item['index'] as int;
    this._listMap[date].removeAt(index);
  }
}

class UnFinishedTodoListMap extends TodoListMap {
    bool moveTaskToOtherDate({String id, String date}) {
      final item = this.findItem(id: id);
      final prevDate = item['dateKey'] as String;
      if (item['found'] == false) return false;
      this.add(date);
      this._listMap[date].add(item['item'] as Todos);
      this._listMap[prevDate].removeAt(item['index'] as int);
      return true;
  }
}

class FinishedTodoListMap extends TodoListMap {
  archive({String id}) async {
    //todo
    final saveResult = await saveArchiveData();
    print(saveResult);
  }
  Future<bool> saveArchiveData() async {
    //todo
    return await Future.delayed(Duration(seconds: 2), () => true).catchError((e) => false);
  }
}

class CanceledTodoListMap extends TodoListMap {

}
