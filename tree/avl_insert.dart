import 'dart:math';

class TreeNode {
  String data;
  TreeNode? left, right;
  int height;

  TreeNode(this.data) : height = 1;
}

int height(TreeNode? node) {
  if (node == null) return 0;
  return node.height;
}

TreeNode newNode(String data) {
  return TreeNode(data);
}

TreeNode rightRotate(TreeNode y) {
  print('Rotate right on node ${y.data}');
  TreeNode x = y.left!;
  TreeNode? T2 = x.right;

  x.right = y;
  y.left = T2;

  y.height = max(height(y.left), height(y.right)) + 1;
  x.height = max(height(x.left), height(x.right)) + 1;

  return x;
}

TreeNode leftRotate(TreeNode x) {
  print('Rotate left on node ${x.data}');
  TreeNode y = x.right!;
  TreeNode? T2 = y.left;

  y.left = x;
  x.right = T2;

  x.height = max(height(x.left), height(x.right)) + 1;
  y.height = max(height(y.left), height(y.right)) + 1;

  return y;
}

int getBalance(TreeNode? node) {
  if (node == null) return 0;
  return height(node.left) - height(node.right);
}

TreeNode insert(TreeNode? node, String data) {
  if (node == null) return newNode(data);

  if (data.compareTo(node.data) < 0) {
    node.left = insert(node.left, data);
  } else if (data.compareTo(node.data) > 0) {
    node.right = insert(node.right, data);
  } else {
    return node;
  }

  node.height = 1 + max(height(node.left), height(node.right));

  int balance = getBalance(node);

  if (balance > 1 && data.compareTo(node.left!.data) < 0) {
    return rightRotate(node);
  }
  if (balance < -1 && data.compareTo(node.right!.data) > 0) {
    return leftRotate(node);
  }
  if (balance > 1 && data.compareTo(node.left!.data) > 0) {
    node.left = leftRotate(node.left!);
    return rightRotate(node);
  }
  if (balance < -1 && data.compareTo(node.right!.data) < 0) {
    node.right = rightRotate(node.right!);
    return leftRotate(node);
  }

  return node;
}

void inOrderTraversal(TreeNode? root) {
  if (root != null) {
    inOrderTraversal(root.left);
    print('${root.data} ');
    inOrderTraversal(root.right);
  }
}

void main() {
  TreeNode? root;
  List<String> letters = ['C', 'B', 'E', 'A', 'D', 'H', 'G', 'F'];
  for (String letter in letters) {
    root = insert(root, letter);
  }

  inOrderTraversal(root);
}
