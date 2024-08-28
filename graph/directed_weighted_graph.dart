class Graph {
  static const int size = 4;
  static const int noEdge = -1;

  List<List<int>> adjMatrix;
  List<String> vertexData;

  Graph()
      : adjMatrix = List.generate(size, (_) => List.filled(size, noEdge)),
        vertexData = List.filled(size, '');

  void addEdge(int u, int v, int weight) {
    if (u >= 0 && u < size && v >= 0 && v < size) {
      adjMatrix[u][v] = weight;
    }
  }

  void addVertexData(int vertex, String data) {
    if (vertex >= 0 && vertex < size) {
      vertexData[vertex] = data;
    }
  }

  void printGraph() {
    print('Adjacency Matrix:');
    for (var row in adjMatrix) {
      print(row.map((e) => e == noEdge ? 0 : e).join(' '));
    }
    print('\nVertex Data:');
    for (int i = 0; i < size; i++) {
      print('Vertex $i: ${vertexData[i]}');
    }
  }
}

void main() {
  Graph g = Graph();

  g.addVertexData(0, 'A');
  g.addVertexData(1, 'B');
  g.addVertexData(2, 'C');
  g.addVertexData(3, 'D');
  g.addEdge(0, 1, 3); // A -> B with weight 3
  g.addEdge(0, 2, 2); // A -> C with weight 2
  g.addEdge(3, 0, 4); // D -> A with weight 4
  g.addEdge(2, 1, 1); // C -> B with weight 1

  g.printGraph();
}
