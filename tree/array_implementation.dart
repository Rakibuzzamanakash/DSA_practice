void main() {
  List<String> binaryTreeArray = ['R', 'A', 'B', 'C', 'D', 'E', 'F', '', '', '', '', '', '', 'G', ''];

  int rightChild = rightChildIndex(0);
  int leftChildOfRightChild = leftChildIndex(rightChild);
  String? data = getData(binaryTreeArray, leftChildOfRightChild);

  if (data != null) {
    print('root.right.left.data: $data');
  } else {
    print('No data found.');
  }
}

String? getData(List<String> binaryTreeArray, int index) {
  if (index >= 0 && index < binaryTreeArray.length) {
    return binaryTreeArray[index];
  }
  return null;
}

int leftChildIndex(int index) {
  return 2 * index + 1;
}

int rightChildIndex(int index) {
  return 2 * index + 2;
}
