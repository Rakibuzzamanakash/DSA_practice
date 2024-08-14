class TreeNode {
  String data;
  TreeNode? left;
  TreeNode? right;

  TreeNode(this.data);
}

TreeNode createNewNode(String data) {
  return TreeNode(data);
}

void postOrderTraversal(TreeNode? root) {
  if (root == null) {
    return;
  }
  postOrderTraversal(root.left);
  postOrderTraversal(root.right);
  print('${root.data}, ');
}

void main() {
  TreeNode root = createNewNode('R');
  TreeNode nodeA = createNewNode('A');
  TreeNode nodeB = createNewNode('B');
  TreeNode nodeC = createNewNode('C');
  TreeNode nodeD = createNewNode('D');
  TreeNode nodeE = createNewNode('E');
  TreeNode nodeF = createNewNode('F');
  TreeNode nodeG = createNewNode('G');

  root.left = nodeA;
  root.right = nodeB;

  nodeA.left = nodeC;
  nodeA.right = nodeD;

  nodeB.left = nodeE;
  nodeB.right = nodeF;

  nodeF.left = nodeG;

  postOrderTraversal(root);
}
