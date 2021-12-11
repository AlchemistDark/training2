import "sl_list.dart";

/// Иногда работает. Наверное...
void main(){
  final list = SLList();
  list.add(1);
  list.add(2);
  list.add(3);
  list.add(100500);
  list.add(42);
  print(list.getter());
  int n = list.valueAt(3) ?? 111;
  print(n);
  list.replaceAt(3, 12345);
  list.deletAt(3);
  print(list.getter());
  list.insertAt(3, 717);
  print(list.getter());
  int susum() => 5 + 4;
  bool boobool(int? arg) => arg == 717;
  BFuncOfInt test = boobool;
  int? argo = list.firstWhere(test);
  int intArgo = argo ?? 14;
  print("FirstWhere: $intArgo");
  list.add(6);
  list.add(7);
  list.reverse();
  print("sdfs");
}  
