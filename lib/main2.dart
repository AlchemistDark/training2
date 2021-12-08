import "sl_list.dart";

/// Иногда работает. Наверное...
void main(){
  //_lastR();
  final list = SLList();
  list.addR(1);
  list.addR(2);
  list.addR(3);
  list.addR(100500);
  list.addR(42);
  list.printR();
  print(list.lenghtR());
  //int m = valueR(7) ?? 111;
  //print(m);
  //int n = valueAt(3) ?? 111;
  //print(n);
  //replaceAt(3, 12345);
  //printR();
  list.deletAt2(3);
  list.printR();
  print(list.lenghtR());
  list.insertAt2(3, 717);
  list.printR();
  print(list.lenghtR());
  int susum() => 5 + 4;
  bool boobool(int? arg) => arg == 717;
  BFuncOfInt test = boobool;
  int? argo = list.firstWhere2(test);
  int intArgo = argo ?? 14;
  print("FirstWhere: $intArgo");
  list.addR(6);
  list.addR(7);
  list.printR();
  list.reverse2();
  print("sdfs");
  list.printR();
}
