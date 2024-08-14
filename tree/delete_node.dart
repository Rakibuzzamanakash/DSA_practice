class TreeNode {
  int data;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.data);
}

TreeNode createNode(int data) {
  return TreeNode(data);
}

void inOrderTraversal(TreeNode? node) {
  if (node == null) {
    return;
  }
  inOrderTraversal(node.left);
  print('${node.data}, ');
  inOrderTraversal(node.right);
}

TreeNode? minValueNode(TreeNode? node) {
  TreeNode? current = node;
  while (current != null && current.left != null) {
    current = current.left;
  }
  return current;
}

TreeNode? delete(TreeNode? node, int data) {
  if (node == null) {
    return null;
  }

  if (data < node.data) {
    node.left = delete(node.left, data);
  } else if (data > node.data) {
    node.right = delete(node.right, data);
  } else {
    if (node.left == null) {
      return node.right;
    } else if (node.right == null) {
      return node.left;
    }

    TreeNode? temp = minValueNode(node.right);
    node.data = temp!.data;
    node.right = delete(node.right, temp.data);
  }
  return node;
}

void main() {
  TreeNode root = createNode(13);
  root.left = createNode(7);
  root.right = createNode(15);
  root.left!.left = createNode(3);
  root.left!.right = createNode(8);
  root.right!.left = createNode(14);
  root.right!.right = createNode(19);
  root.right!.right!.left = createNode(18);

  inOrderTraversal(root);
  print('');

  root = delete(root, 15)!;

  inOrderTraversal(root);
  print('');
}
