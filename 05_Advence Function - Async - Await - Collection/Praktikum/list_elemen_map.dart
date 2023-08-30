void main() {
  List<List<int>> listElemen = [
    [1, 2],
    [3, 4],
    [5, 6],
  ];

  Map<int, List<int>> myMap = Map.fromIterable(listElemen,
      key: (item) => listElemen.indexOf(item), value: (item) => item);

  print(myMap);
}
