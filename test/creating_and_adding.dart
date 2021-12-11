import 'package:one_way_list/sl_list.dart';
import 'package:test/test.dart';

main () {
  test("Create empty", () {
    final list = SLList();

    // Проверим, что root нулевой (это мы внутренности копаем)
    expect(list.root, isNull);

    // Проверим, что длина нулевая
    expect(list.length, equals(0));
  });

  test("Adding makes length bigger", () {

  });
}