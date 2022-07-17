class A {
  String getMessage() => 'A';
}

class B {
  String getMessage() => 'B';
}

class P {
  String getMessage() => 'P';
}

class AB extends P with A, B {
  @override
  String getMessage() => 'AB';
}

class BA extends P with B, A {}

class TestObj {
  var instance = "123";

  TestObj.test() : super();
}

typedef CallBack(String msg);

class Call {
  CallBack callBack;

  Call(this.callBack);

  void execute() {
    callBack("调用回调");
  }
}

void f(void Function(String msg) fun) {
  fun("你好啊");
}

extension IntFit on int {
  double get px {
    return this * 2;
  }
}

void main() {
  print(90.px);
}
