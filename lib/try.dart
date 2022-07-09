import 'dart:io';

void main() {
  int a = 4;
  int b = 0;

  try {
    print(a ~/ b);
    // ignore: deprecated_member_use
  } on IntegerDivisionByZeroException catch (e) {
    print("The Exeception is : $e");
    print("Can not devide by zero");
  } finally {
    print("Always Executed");
  }
}
