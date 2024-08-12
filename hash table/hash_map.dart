void main() {
  Map<String, int> hashTable = {};

  hashTable['apple'] = 10;
  hashTable['banana'] = 20;
  hashTable['orange'] = 30;

  print('HashTable: $hashTable');

  print('Value for key "banana": ${hashTable['banana']}');

  print('Contains key "apple": ${hashTable.containsKey('apple')}');
  print('Contains key "grape": ${hashTable.containsKey('grape')}');

  hashTable.remove('apple');
  print('HashTable after removing "apple": $hashTable');

  hashTable.forEach((key, value) {
    print('Key: $key, Value: $value');
  });
}
