class Node {
  dynamic data;
  Node? left;
  Node? right;

  Node(this.data);
}

class BinaryTree {
  Node? root;

  void insert(dynamic data) {
    root = _insertAt(root, data);
  }

  Node? _insertAt(Node? node, dynamic data) {
    if (node == null) {
      return Node(data);
    }

    if (data < node.data) {
      node.left = _insertAt(node.left, data);
    } else {
      node.right = _insertAt(node.right, data);
    }

    return node;
  }

  void inOrderTraversal(Node? node) {
    if (node == null) return;

    inOrderTraversal(node.left);
    print(node.data);
    inOrderTraversal(node.right);
  }

  void preOrderTraversal(Node? node) {
    if (node == null) return;

    print(node.data);
    preOrderTraversal(node.left);
    preOrderTraversal(node.right);
  }

  void postOrderTraversal(Node? node) {
    if (node == null) return;
    postOrderTraversal(node.left);
    postOrderTraversal(node.right);
    print(node.data);
  }
}

void main() {
  BinaryTree tree = BinaryTree();

  tree.insert(5);
  tree.insert(3);
  tree.insert(7);
  tree.insert(8);
  tree.insert(2);
  tree.insert(6);

  print('in oreder travarsel: ');
  tree.inOrderTraversal(tree.root);

  print('pre oreder travarsel: ');
  tree.preOrderTraversal(tree.root);

  print('post oreder travarsel: ');
  tree.postOrderTraversal(tree.root);
}
