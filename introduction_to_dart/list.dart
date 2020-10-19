main() {
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  List<String> names = ['majid', 'hajian'];

  var list = List(2);
  list[0] = 2;
  list[1] = 2;
  print(list); // [2,2];

  var list2 = [];
  list.add(1);
  list.add(1);
// or Chain
  list.add(1).add(1);
  print(list); // [1,1];

  // Cascade
  List<num> list3 = List()..add(3)..add(3);
  print(list3); // [3,3];
}
