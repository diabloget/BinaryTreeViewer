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
}
