class Doing {
  final String name;
  late bool _isDone;
  final DateTime createAtTime;

  Doing(this.name, this._isDone,this.createAtTime);

  bool get isDone => _isDone;

  set isDone(bool value) {
    _isDone = value;
  }
}