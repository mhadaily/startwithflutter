
main() {
  // Named parameters
  someFunction({bool isBold: false, String name: ""}) {
    //...
  }
  someFunction(isBold: true);

  someFunction(isBold: true, name: 'Majid');
}

class SomeClassName {
  SomeClassName({this.isBold});
  bool isBold;

  someFunction({bool isBold: false, @required String name}) {}
}

final m = SomeClassName(isBold: true);

positional() {
  // Positional parameters
  someFunction(bool isBold, [String name]) {
    //...
    if (name != null) {}
  }

  someFunction(true);

  someFunction(bool isBold, [String name]) {
    //...
    if (name != null) {}
  }

  someFunction(true, 'Majid');
}
