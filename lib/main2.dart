import "sl_list.dart";

/// Иногда работает. Наверное...
void main(){
  final list = SLList();
  list.addR(1);
  list.addR(2);
  list.addR(3);
  list.addR(100500);
  list.addR(42);
  list.printR();
  print(list.getter());
  int n = valueAt(3) ?? 111;
  print(n);
  list.replaceAt(3, 12345);
  printR();
  list.deletAt(3);
  list.printR();
  print(list.getter());
  list.insertAt(3, 717);
  list.printR();
  print(list.getter());
  int susum() => 5 + 4;
  bool boobool(int? arg) => arg == 717;
  BFuncOfInt test = boobool;
  int? argo = list.firstWhere(test);
  int intArgo = argo ?? 14;
  print("FirstWhere: $intArgo");
  list.addR(6);
  list.addR(7);
  list.printR();
  list.reverse();
  print("sdfs");
  list.printR();
}
