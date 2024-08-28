import 'dart:collection';

class Graph {
  List<List<int>> adjMatrix;
  List<String> vertexData;
  int size;

  Graph(this.size)
      : adjMatrix = List.generate(size, (_) => List.filled(size, 0)),
        vertexData = List.filled(size, '');

  void addEdge(int u, int v) {
    if (u >= 0 && u < size && v >= 0 && v < size) {
      adjMatrix[u][v] = 1;
      // adjMatrix[v][u] = 1; // Uncomment for undirected graph
    }
  }

  void addVertexData(int vertex, String data) {
    if (vertex >= 0 && vertex < size) {
      vertexData[vertex] = data;
    }
  }

  void printGraph() {
    print("Adjacency Matrix:");
    for (var row in adjMatrix) {
      print(row.join(' '));
    }

    print("\nVertex Data:");
    for (int i = 0; i < size; i++) {
      print("Vertex $i: ${vertexData[i]}");
    }
  }

  void dfsUtil(int v, List<bool> visited) {
    visited[v] = true;
    print(vertexData[v]);

    for (int i = 0; i < size; i++) {
      if (adjMatrix[v][i] == 1 && !visited[i]) {
        dfsUtil(i, visited);
      }
    }
  }

  void dfs(String startVertexData) {
    List<bool> visited = List.filled(size, false);
    int startVertex = vertexData.indexOf(startVertexData);

    if (startVertex != -1) {
      dfsUtil(startVertex, visited);
    }
  }

  void bfs(String startVertexData) {
    List<bool> visited = List.filled(size, false);
    Queue<int> queue = Queue<int>();
    int startVertex = vertexData.indexOf(startVertexData);

    if (startVertex != -1) {
      queue.add(startVertex);
      visited[startVertex] = true;

      while (queue.isNotEmpty) {
        int currentVertex = queue.removeFirst();
        print(vertexData[currentVertex]);

        for (int i = 0; i < size; i++) {
          if (adjMatrix[currentVertex][i] == 1 && !visited[i]) {
            queue.add(i);
            visited[i] = true;
          }
        }
      }
    }
  }
}

void main() {
  Graph g = Graph(7);

  g.addVertexData(0, 'A');
  g.addVertexData(1, 'B');
  g.addVertexData(2, 'C');
  g.addVertexData(3, 'D');
  g.addVertexData(4, 'E');
  g.addVertexData(5, 'F');
  g.addVertexData(6, 'G');

  g.addEdge(3, 0); // D -> A
  g.addEdge(3, 4); // D -> E
  g.addEdge(4, 0); // E -> A
  g.addEdge(0, 2); // A -> C
  g.addEdge(2, 5); // C -> F
  g.addEdge(2, 6); // C -> G
  g.addEdge(5, 1); // F -> B
  g.addEdge(1, 2); // B -> C

  g.printGraph();

  print("\nDepth First Search starting from vertex D:");
  g.dfs('D');

  print("\n\nBreadth First Search starting from vertex D:");
  g.bfs('D');
}
