class Node {
  Node right;
  Node left;
  int key;
  String path;

  Node(key, path) {
    this.key = key;
    this.right = null;
    this.left = null;
    this.path = path;
  }
}
