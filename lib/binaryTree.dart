import 'package:binary_tree_viewer/binaryTreeViewer.dart';
import 'package:binary_tree_viewer/node.dart';

import 'node.dart';

class BinaryTree {
  Node root;

  BinaryTree() {
    this.root = null;
  }

  void insert(int key) {
    if (root != null) {
      insertAux(key, this.root, "", 0);
    } else {
      root = new Node(key, "");
      BinaryTreeViewerScreenState().updateValue(key, "");
    }
  }

  void insertAux(int key, Node current, String path, int avoid) {
    if (avoid > 5) {
      return print("Tamaño máximo de raíz alcanzado, no se insertará el nodo");
    }

    if (key > current.key) {
      path += "r";

      if (current.right != null) {
        insertAux(key, current.right, path, avoid++);
      } else {
        current.right = new Node(key, path);
        BinaryTreeViewerScreenState().updateValue(key, path);
      }
    } else {
      path += "l";

      if (current.left != null) {
        insertAux(key, current.left, path, avoid++);
      } else {
        current.left = new Node(key, path);
        BinaryTreeViewerScreenState().updateValue(key, path);
      }
    }
  }

  void postOrder() {
    printPostorderAux(this.root);
  }

  void printPostorderAux(Node node) {
    if (node == null) return;

    printPostorderAux(node.left);

    printPostorderAux(node.right);

    print(node.key.toString() + " ");

    BinaryTreeViewerScreenState.postOrder.add(node.path);
  }

  void inOrder() {
    printinorderAux(this.root);
  }

  void printinorderAux(Node node) {
    if (node == null) return;

    printinorderAux(node.left);

    print(node.key.toString() + " ");

    BinaryTreeViewerScreenState.postOrder.add(node.path);

    printinorderAux(node.right);
  }

  void preOrder() {
    printpreorderAux(this.root);
  }

  void printpreorderAux(Node node) {
    if (node == null) return;

    print(node.key.toString() + " ");
    BinaryTreeViewerScreenState.postOrder.add(node.path);

    printpreorderAux(node.left);

    printpreorderAux(node.right);
  }
}
