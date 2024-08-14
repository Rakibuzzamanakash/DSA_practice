import 'dart:math';

class TreeNode {
  int data;
  TreeNode? left;
  TreeNode? right;
  int height;

  TreeNode(this.data) : height = 1;
}

int getHeight(TreeNode? node) {
  if (node == null) return 0;
  return node.height;
}

int getBalance(TreeNode? node) {
  if (node == null) return 0;
  return getHeight(node.left) - getHeight(node.right);
}

TreeNode rightRotate(TreeNode y) {
  TreeNode x = y.left!;
  TreeNode? T2 = x.right;

  x.right = y;
  y.left = T2;

  y.height = max(getHeight(y.left), getHeight(y.right)) + 1;
  x.height = max(getHeight(x.left), getHeight(x.right)) + 1;

  return x;
}

TreeNode leftRotate(TreeNode x) {
  TreeNode y = x.right!;
  TreeNode? T2 = y.left;

  y.left = x;
  x.right = T2;

  x.height = max(getHeight(x.left), getHeight(x.right)) + 1;
  y.height = max(getHeight(y.left), getHeight(y.right)) + 1;

  return y;
}

TreeNode insert(TreeNode? node, int data) {
  if (node == null) return TreeNode(data);

  if (data < node.data) {
    node.left = insert(node.left, data);
  } else if (data > node.data) {
    node.right = insert(node.right, data);
  } else {
    return node;
  }

  node.height = 1 + max(getHeight(node.left), getHeight(node.right));

  int balance = getBalance(node);

  // Left Left Case
  if (balance > 1 && data < node.left!.data) return rightRotate(node);

  // Right Right Case
  if (balance < -1 && data > node.right!.data) return leftRotate(node);

  // Left Right Case
  if (balance > 1 && data > node.left!.data) {
    node.left = leftRotate(node.left!);
    return rightRotate(node);
  }

  // Right Left Case
  if (balance < -1 && data < node.right!.data) {
    node.right = rightRotate(node.right!);
    return leftRotate(node);
  }

  return node;
}

// Function to find the node with the minimum value
TreeNode minValueNode(TreeNode node) {
  TreeNode current = node;
  while (current.left != null) {
    current = current.left!;
  }
  return current;
}

void inOrderTraversal(TreeNode? root) {
  if (root != null) {
    inOrderTraversal(root.left);
    print('${root.data} ');
    inOrderTraversal(root.right);
  }
}

// Function to delete a node from the AVL tree
TreeNode? deleteNode(TreeNode? root, int data) {
  if (root == null) return root;

  if (data < root.data) {
    root.left = deleteNode(root.left, data);
  } else if (data > root.data) {
    root.right = deleteNode(root.right, data);
  } else {
    if ((root.left == null) || (root.right == null)) {
      TreeNode? temp = root.left ?? root.right;
      if (temp == null) {
        temp = root;
        root = null;
      } else {
        root = temp;
      }
    } else {
      TreeNode temp = minValueNode(root.right!);
      root.data = temp.data;
      root.right = deleteNode(root.right, temp.data);
    }
  }

  if (root == null) return root;

  root.height = 1 + max(getHeight(root.left), getHeight(root.right));

  int balance = getBalance(root);

  // Left Left Case
  if (balance > 1 && getBalance(root.left) >= 0) return rightRotate(root);

  // Left Right Case
  if (balance > 1 && getBalance(root.left) < 0) {
    root.left = leftRotate(root.left!);
    return rightRotate(root);
  }

  // Right Right Case
  if (balance < -1 && getBalance(root.right) <= 0) return leftRotate(root);

  // Right Left Case
  if (balance < -1 && getBalance(root.right) > 0) {
    root.right = rightRotate(root.right!);
    return leftRotate(root);
  }

  return root;
}

void main() {
  TreeNode? root;
  List<int> elements = [67, 34, 82, 12, 45, 78, 90, 23];

  for (int data in elements) {
    root = insert(root, data);
  }

  print("Inorder traversal of the constructed AVL tree is:");
  inOrderTraversal(root);
  print("\n");

  print("Deleting node 34");
  root = deleteNode(root, 34);

  print("Inorder traversal after deletion:");
  inOrderTraversal(root);
  print("\n");
}
