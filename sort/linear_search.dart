class LinearSearch {
  int linearSearch(List<num> arr, int size, int targetValue) {
    for (int i = 0; i < size; i++) {
      if (arr[i] == targetValue) {
        return i;
      }
    }

    return -1;
  }
}
