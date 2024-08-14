class TreeNode {
  int data;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.data);
}

TreeNode newTreeNode(int data) {
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

void main() {
  TreeNode root = newTreeNode(13);
  root.left = newTreeNode(7);
  root.right = newTreeNode(15);

  root.left!.left = newTreeNode(3);
  root.left!.right = newTreeNode(8);

  root.right!.left = newTreeNode(14);
  root.right!.right = newTreeNode(19);

  root.right!.right!.left = newTreeNode(18);

  inOrderTraversal(root);
  print('');

  TreeNode? minNode = minValueNode(root);
  if (minNode != null) {
    print('Lowest value: ${minNode.data}');
  } else {
    print('The tree is empty.');
  }
}
