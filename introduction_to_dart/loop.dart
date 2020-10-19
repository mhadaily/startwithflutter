import 'dart:collection';

main() {
  var collection = Queue();
  collection.addAll([100, 200, 300]);

  // Loop

  for (var i = 0; i < 3; i++) {}

  for (var x in collection) {}

// Iterable
  [].forEach((c) => print(c));
  [].map((c) => c); // and more
}
