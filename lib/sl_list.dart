import 'package:meta/meta.dart';

class _Record {
  int? value;                               // Значение записи.
  _Record? next;                            // Указатель на следующую ячейку.
  _Record(this.value);                      // Конструктор.
}

typedef bool BFuncOfInt(int? arg);      // Если вставить bool то где-то что-то ломается...

class SLList {
  /// По идее, эта переменная должна быть приватной внутри класса.
  /// Снаружи пользователи не должны видеть ее, тем более менять ее значение.
  ///
  /// Но если мы в тестах захотим проверить значение переменной, то ее
  /// придется оставить публичной.
  ///
  /// Мы оставляем тут эту аннотацию, чтобы пользователи класса знали, что это
  /// поле не для них, а для тестов. Анализатор будет показывать ошибки или
  /// предупреждения при попытке использовать такие поля и методы.
  @visibleForTesting
  _Record? root;

  /// Добавляет элемент.
  void addR(value){
    final newrecord = _Record(value);
    if(root == null){
      root = newrecord;
    }
    else{
      _Record? last = _lastR();
      last!.next = newrecord;
    }
  }

  /// Ищет последний элемент.
  _Record? _lastR(){
    _Record? rec = root;
    if(root == null){
      return null;
    }
    else{
      while(rec!.next != null){
      rec = rec.next;
      };
    };
    return rec;
  }

  /// Ищет длину списка.
  int getter(){
    int n = 0;
    _Record? rec = root;
    if(root == null){
      n = 0;
    }
    else{
      while(rec != null){
        rec = rec.next;
        n++;
      };
    };
    return n;
  }

  /// Ищет значение по индексу.
  int? valueAt(int a){
    int? n = 0;
    _Record? rec = root;
    if(a > getter()){
      return null;
    }
    else{
      for(var i = 0; (i < a); i++){
        n = rec!.value;
        rec = rec.next;
      };
      return n;
    };
  }

  /// Заменяет число по индексу на другое.
 void replaceAt(int a, int n){
    _Record? rec = root;
    if(a > getter()){
      return;
    }
    else{
      for(var i = 0; (i < a); i++){
        rec = rec!.next;
      };
      rec!.value = n;
    };
  }

  /// Удалить число по индексу.
  void deletAt(int a){
    int lng = getter();
    if((a < 0) || (a > (lng-1)) || (root == null)){ // Удалять нечего.
      return;
    };
    if(a == 0){                                     // Удалить корневой элемент.
      root = root!.next;
      return;
    };
    if((0 < a) && (a < lng)){                       // Остальные случаи.
      _Record? rec1 = root;
      _Record? rec2;
      for(var i = 0; (i < (a-1)); i++){
        rec1 = rec1!.next;
      };
      rec2 = rec1!.next;
      rec1.next = rec2!.next;
      return;
    };
  }

  /// Вставить число по индексу. a - индекс; n - value.
  void insertAt(int a, int n){
    int lng = getter();
    _Record? rec = root;
    final newrecord = _Record(n);
    if((a < 0) || (a > lng)){                      // Индекс не попадает в список.
      return;
    };
    if((root == null) && (a != 0)){                // Список не был создан, но добавляют не первый элемент.
      return;
    };
    if(a == (lng)){                                // В этом случае переменная добавляется в конец списка.
      addR(n);
      return;
    };
    if((0 < a) && (a < lng)){                      // Индекс между другими элементами.
      _Record? rec1 = root;
      _Record? rec2;
      final rec3 = _Record(n);
      for(var i = 0; (i < (a-1)); i++){
        rec1 = rec1!.next;
      };
      rec2 = rec1!.next;
      rec3.next = rec2;
      rec1.next = rec3;
      return;
    };
  }

  /// Проверяет на условие.
  int? firstWhere(BFuncOfInt test){
    int? n = 0;
    _Record? rec = root;
    int lng = getter();                             // Исправление.
    while(rec != null){
      if(test(rec.value)) return rec.value;
      rec = rec.next;
    }
    return null;
  }
  
  /// Переворачивает список.
  void reverse(){
    _Record? rec = root;
    _Record? rec1;
    _Record? rec2 = null;
    while(rec != null){
      rec1 = rec;
      rec = rec.next;                              // Я не понимаю, почему эту строку нельзя сдвинуть ниже...
      rec1.next = rec2;
      rec2 = rec1;
    }
  root = rec1;
  }
}