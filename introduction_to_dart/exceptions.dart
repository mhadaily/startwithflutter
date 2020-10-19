import 'dart:io';

main() {
  // All dart exceptions are unchecked exceptions

  try {
    throw Exception('what?!');
  } on SocketException {
// handle a specific exception

  } catch (e) {
// no specificed, handle everything

  } finally {
    // clean up tasks
  }
}
