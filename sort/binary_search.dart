class BinarySearch {
  int binarySearch(List<num> arr, int size, int targetNum) {
    int left = 0;
    int right = size - 1;

    while (left <= right) {
      int mid = (left + right) ~/ 2;

      if (arr[mid] == targetNum) {
        return mid; // Target found at index mid
      }

      if (arr[mid] < targetNum) {
        left = mid + 1; // Continue searching in the right half
      } else {
        right = mid - 1; // Continue searching in the left half
      }
    }
    return -1;
  }
}
