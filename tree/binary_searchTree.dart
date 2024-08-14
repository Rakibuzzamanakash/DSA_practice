class TreeNode {
  int data;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.data);
}

TreeNode createNode(int data) {
  return TreeNode(data);
}

TreeNode? search(TreeNode? node, int target) {
  if (node == null) {
    return null;
  } else if (node.data == target) {
    return node;
  } else if (target < node.data) {
    return search(node.left, target);
  } else {
    return search(node.right, target);
  }
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

  TreeNode? result = search(root, 8);
  if (result != null) {
    print('Found the node with value: ${result.data}');
  } else {
    print('Value not found in the BST.');
  }
}
