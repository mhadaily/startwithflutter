class Person {
  // if class produces objects that never changes,
  const Person({this.firstName});
  // another named constructor with inializer list
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      firstName: json['name'],
    );
  }
  // variable must be final if const constructor
  final String firstName;
  void printName() {
    print(firstName);
  }
}

class SomePerson extends Person {
  @override
  printName() {}
}

// abstract and generics
abstract class Something<T> {}
