class Node{
  Node right;
  Node left;
  int key;
  String pos;

  Node(key, pos){
    this.key = key;
    this.right = null;
    this.left = null;
    this.pos = pos;
  }
}