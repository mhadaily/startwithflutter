import 'dart:async';

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    yield i;
  }
}

main() async {
  final count = await countStream(10).first;
  print('first count $count');

  countStream(10).listen((v) {
    print('Listen to count $v');
  });
}
