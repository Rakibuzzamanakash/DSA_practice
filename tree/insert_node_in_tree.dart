class TreeNode {
  int data;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.data);
}

TreeNode createNode(int data) {
  return TreeNode(data);
}

TreeNode? insert(TreeNode? node, int data) {
  if (node == null) {
    return createNode(data);
  } else {
    if (data < node.data) {
      node.left = insert(node.left, data);
    } else if (data > node.data) {
      node.right = insert(node.right, data);
    }
  }
  return node;
}

void inOrderTraversal(TreeNode? node) {
  if (node == null) {
    return;
  }
  inOrderTraversal(node.left);
  print('${node.data}, ');
  inOrderTraversal(node.right);
}

void main() {
  TreeNode root = createNode(13);
  TreeNode node7 = createNode(7);
  TreeNode node15 = createNode(15);
  TreeNode node3 = createNode(3);
  TreeNode node8 = createNode(8);
  TreeNode node14 = createNode(14);
  TreeNode node19 = createNode(19);
  TreeNode node18 = createNode(18);

  root.left = node7;
  root.right = node15;

  node7.left = node3;
  node7.right = node8;

  node15.left = node14;
  node15.right = node19;

  node19.left = node18;

  insert(root, 10);

  inOrderTraversal(root);
}
