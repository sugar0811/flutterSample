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

class TestObj{
  var instance = "123";

  TestObj.test() : super();

}

void main(){
  print(TestObj.test().instance);
}
