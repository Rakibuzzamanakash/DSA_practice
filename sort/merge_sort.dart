class MergeSorts {
  void mergeSort(List<num> arr, int start, int end) {
    if (start < end) {
      int mid = (start + end) ~/ 2;
      mergeSort(arr, start, mid);
      mergeSort(arr, mid + 1, end);
      merge(arr, start, mid, end);
    }
  }

  void merge(List<num> arr, int start, int mid, int end) {
    int i = start;
    int j = mid + 1;
    int k = 0;
    List<num> temp = List<num>.filled(end - start + 1, 0);

    while (i <= mid && j <= end) {
      if (arr[i] <= arr[j]) {
        temp[k] = arr[i];
        i++;
      } else {
        temp[k] = arr[j];
        j++;
      }
      k++;
    }

    while (i <= mid) {
      temp[k] = arr[i];
      i++;
      k++;
    }

    while (j <= end) {
      temp[k] = arr[j];
      j++;
      k++;
    }

    for (k = 0; k < temp.length; k++) {
      arr[start + k] = temp[k];
    }
  }
}

