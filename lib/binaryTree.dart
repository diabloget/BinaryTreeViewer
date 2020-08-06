import 'package:binary_tree_viewer/binaryTreeViewer.dart';
import 'package:binary_tree_viewer/node.dart';

class BinaryTree{
  Node root;

  BinaryTree(){
    this.root = null;
  }

  void insertion(int key){
    return insertionAux(key, root, 1, "");
  }

  void insertionAux(key, Node current, avoid, pos){
    if(avoid > 5){
      return print("Tamaño máximo de raíz alcanzado, no se insertará el nodo");
    } else{
      String tempPos = pos;
      if(current == null){
        current = new Node(key, tempPos);
        BinaryTreeViewerScreenState().updateValue(key, tempPos);

      } else{

        if(key < current.key){
          tempPos+= "l";
          return insertionAux(key, current.left, avoid++, tempPos);
        }

        if(key > current.key){
          tempPos+= "r";
          return insertionAux(key, current.right, avoid++, tempPos);
        }

      }
    }
  }

}