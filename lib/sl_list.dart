
class _Record {
  int? value;                               // Значение записи.
  _Record? next;                            // Указатель на следующую ячейку.
  _Record(this.value);                      // Конструктор.
}

typedef bool BFuncOfInt(int? arg);      // Если вставить bool то где-то что-то ломается...

class SLList {
  _Record? root;

  /// Печатает список.
  ///
  /// Сложность O(n) так как тут цикл.
  /// Тут перебор элементов списка, поэтому я не зна как от цикла избавиться.
  void printR(){
    _Record? rec = root;
    while(rec != null){
      print(rec.value);
      rec = rec.next;
    }  
  }

  /// Добавляет элемент.
  ///
  /// Сложность O(n), так как 1 раз вызывается функцция с циклом.
  /// Функция специаально для этого и написана, так что...
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
  ///
  /// Сложность O(n) так как тут цикл.
  /// Тут опять перебор, так что...
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
  ///
  /// Сложность O(n) так как тут цикл.
  /// Тут перебор элементов тоже неизежен...
  int lenghtR(){
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
  ///
  /// Сложность O(n) так как тут цикл.
  /// Аналогично функциям выше.
  int? valueR(int a){
    int? n = 0;
    _Record? rec = root;
    for(var i = 0; (i < a); i++){
      if(rec == null){
        n = null;
        return n;
      }
      else{
        n = rec.value;
        print(n);
        rec = rec.next;
      };
    };
    return n;
  }

  /// Тоже ищет значение по индексу.
  ///
  /// Сложность O(2n) так как тут цикл.
  /// Однако эта функция будет эффективнее предыдущей, если a больше длины списка.
  int? valueAt(int a){
    int? n = 0;
    _Record? rec = root;
    if(a > lenghtR()){
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
  ///
  /// Сложность O(2n) так как тут отдельно вызывается функцция с циклом и отдельно цикл.
 void replaceAt(int a, int n){
    _Record? rec = root;
    if(a > lenghtR()){
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
  ///
  /// Тут отдельно вызывается функцция с циклом (два раза) и отдельно цикл.
  /// Функции и циклы друг в друга не вложены, поэтому сложность O(3n).
  /// Ниже понизил до O(2n).
  void deletAt(int a){
    if((a < 0) || (a > (lenghtR()-1)) || (root == null)){ // Удалять нечего.
      return;
    };
    if(a == 0){                                           // Удалить корневой элемент.
      root = root!.next;
      return;
    };
    if((0 < a) && (a < lenghtR())){                   // Остальные случаи.
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

  /// Тоже удалить число по индексу.
  ///
  /// Тут отдельно вызывается функцция с циклом и отдельно цикл.
  /// Сложность O(2n).
  void deletAt2(int a){
    int lng = lenghtR();
    if((a < 0) || (a > (lng-1)) || (root == null)){ // Удалять нечего.
      return;
    };
    if(a == 0){                                           // Удалить корневой элемент.
      root = root!.next;
      return;
    };
    if((0 < a) && (a < lng)){                   // Остальные случаи.
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
  ///
  /// Тут отдельно вызывается функцция с циклом (3 раза) и отдельно цикл.
  /// Функции и циклы друг в друга не вложены, поэтому сложность O(4n).
  /// Ниже понизил до O(2n).
  void insertAt(int a, int n){
    _Record? rec = root;
    final newrecord = _Record(n);
    if((a < 0) || (a > lenghtR())){         // Индекс не попадает в список.
      return;
    };
    if((root == null) && (a != 0)){         // Список не был создан, но добавляют не первый элемент.
      return;
    };
    if(a == (lenghtR())){                   // В этом случае переменная добавляется в конец списка.
      addR(n);
      return;
    };
    if((0 < a) && (a < lenghtR())){         // Индекс между другими элементами.
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
  /// Тоже вставить число по индексу. a - индекс; n - value.
  ///
  /// Тут отдельно вызывается функцция с циклом и отдельно цикл.
  /// Сложность O(2n).
  void insertAt2(int a, int n){
    int lng = lenghtR();
    _Record? rec = root;
    final newrecord = _Record(n);
    if((a < 0) || (a > lng)){         // Индекс не попадает в список.
      return;
    };
    if((root == null) && (a != 0)){         // Список не был создан, но добавляют не первый элемент.
      return;
    };
    if(a == (lng)){                   // В этом случае переменная добавляется в конец списка.
      addR(n);
      return;
    };
    if((0 < a) && (a < lng)){         // Индекс между другими элементами.
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
  ///
  /// Название взял у похожей функцции list.where(bool test(E element)).
  /// Тут функцция с циклом вложена в другой цикл, поэтому сложность O(n^2).
  /// Ниже исправленная версия.
  int? firstWhere(Function test){
    if (test is BFuncOfInt) {
      int? n = 0;
      _Record? rec = root;
      for(var i = 0; ((!test(rec!.value)) && (i < lenghtR())); i++){
        rec = rec.next;
      };
      if(test(rec.value)) return rec.value;
      else return null;
    }
    else{
      print("F**k of Grandmuther");               // Ты просил по рукам бить ¯\_(ツ)_/¯
      return null;
    }
  }
  
  /// Тоже проверяет на условие.
  ///
  /// Исправил функцию. Теперь сложность O(2n).
  /// По условию test не содержит циклов.
  int? firstWhere2(BFuncOfInt test){
    int? n = 0;
    _Record? rec = root;
    int lng = lenghtR();                                              // Исправление.
    while(rec != null){
      if(test(rec.value)) return rec.value;
      rec = rec.next;
    }
    return null;
  }
  
  /// Переворачивает список.
  ///
  /// Название взял у похожей функцции list.where(bool test(E element)).
  /// Тут функцция с циклом вложена в другой цикл, поэтому сложность O(n^2).
  /// Однако я не знаю как это упростить.
  /// Я придумал другую реализацию функции, но она тоже O(n^2).
  /// Правда в ней нужно создавать меньше сущностей.
  void reverse(){
    _Record? rec1;
    _Record? rec2;
    
    _Record? _lastRec(){              // Ищет последний элемент перевёрнутого списка.
      _Record? rec3 = rec1;
      if(rec1 == null){
        return null;
      }
      else{
        while(rec3!.next != null){
          rec3 = rec3.next;
        };
      };
      return rec3;
    }

    void addRec(value){               // Добавляет элемент в перевёрнутый список.
      final rec3 = _Record(value);
      if(rec1 == null){
        rec1 = rec3;
      }
      else{
        _Record? last = _lastRec();
        last!.next = rec3;
      }
    }

    while(lenghtR() != 0){
      //print(rec1!.value);
      addRec(_lastR()!.value);
      deletAt((lenghtR())-1);
    };
    root = rec1;
    return;
  }

  /// Тоже переворачивает список.
  void reverse2(){
    _Record? rec = root;
    _Record? rec1;
    _Record? rec2 = null;
    while(rec != null){
      rec1 = rec;
      rec = rec.next;             // Я не понимаю, почему эту строку нельзя сдвинуть ниже...
      rec1.next = rec2;
      rec2 = rec1;
    }
  root = rec1;
  }
}