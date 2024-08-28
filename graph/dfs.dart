import 'dart:io';

class Graph {
  final int size;
  List<List<int>> adjMatrix;
  List<String> vertexData;

  Graph(this.size)
      : adjMatrix = List.generate(size, (_) => List.filled(size, 0)),
        vertexData = List.filled(size, '');

  void addEdge(int u, int v) {
    if (u >= 0 && u < size && v >= 0 && v < size) {
      adjMatrix[u][v] = 1;
      adjMatrix[v][u] = 1;
    }
  }

  void addVertexData(int vertex, String data) {
    if (vertex >= 0 && vertex < size) {
      vertexData[vertex] = data;
    }
  }

  void printGraph() {
    print('Adjacency Matrix:');
    for (var i = 0; i < size; i++) {
      for (var j = 0; j < size; j++) {
        stdout.write('${adjMatrix[i][j]} ');
      }
      print('');
    }

    print('\nVertex Data:');
    for (var i = 0; i < size; i++) {
      print('Vertex $i: ${vertexData[i]}');
    }
  }

  void dfsUtil(int v, List<bool> visited) {
    visited[v] = true;
    print('${vertexData[v]} ');

    for (var i = 0; i < size; i++) {
      if (adjMatrix[v][i] == 1 && !visited[i]) {
        dfsUtil(i, visited);
      }
    }
  }

  void dfs(String startVertexData) {
    var visited = List<bool>.filled(size, false);
    var startVertex = vertexData.indexOf(startVertexData);

    if (startVertex != -1) {
      dfsUtil(startVertex, visited);
    }
  }
}

void main() {
  var g = Graph(7);

  g.addVertexData(0, 'A');
  g.addVertexData(1, 'B');
  g.addVertexData(2, 'C');
  g.addVertexData(3, 'D');
  g.addVertexData(4, 'E');
  g.addVertexData(5, 'F');
  g.addVertexData(6, 'G');

  g.addEdge(3, 0); // D - A
  g.addEdge(0, 2); // A - C
  g.addEdge(0, 3); // A - D
  g.addEdge(0, 4); // A - E
  g.addEdge(4, 2); // E - C
  g.addEdge(2, 5); // C - F
  g.addEdge(2, 1); // C - B
  g.addEdge(2, 6); // C - G
  g.addEdge(1, 5); // B - F

  g.printGraph();

  print('\nDepth First Search starting from vertex D:');
  g.dfs('D');
}
