Future<double> getData() async {
  await Future.delayed(const Duration(seconds: 2));
  return 10.0;
}

Future<int> getMoney() async {
  await Future.delayed(const Duration(seconds: 2));
  return 20;
}
