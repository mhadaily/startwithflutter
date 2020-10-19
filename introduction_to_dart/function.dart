main() {
  void printName(String name) {
    print('The name is $name');
  }

// omitting types is ok!
  printName2(String name) {
    print('The name is $name');
  }

  String printNameToFirstLetter(String name) {
    print('The name is $name');
    return name[0];
  }

// Fat arrow syntax
  String printNameToFirstLetter2(String name) => name[0];

// Functions are first-class object,
  ['Majid', 'Hajian'].forEach(printName);
}
