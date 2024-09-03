import 'dart:math';

const int SIZE = 10;

class Graph {
  List<List<int>> adjMatrix = List.generate(SIZE, (_) => List.filled(SIZE, 0));
  List<String?> vertexData = List.filled(SIZE, null);

  void addEdge(int u, int v, int weight) {
    adjMatrix[u][v] = weight;
    adjMatrix[v][u] = weight;
  }

  void addVertexData(int vertex, String data) {
    vertexData[vertex] = data;
  }

  int minDistance(List<int> dist, List<bool> sptSet) {
    int min = double.maxFinite.toInt(), minIndex = -1;
    for (int v = 0; v < SIZE; v++) {
      if (!sptSet[v] && dist[v] <= min) {
        min = dist[v];
        minIndex = v;
      }
    }
    return minIndex;
  }

  void printPath(List<int?> parent, int j) {
    if (j == -1 || parent[j] == null) {
      return;
    }
    printPath(parent, parent[j]!);
    print('->${vertexData[j]}');
  }

  void dijkstra(int src, int target) {
    List<int> dist = List.filled(SIZE, double.maxFinite.toInt());
    List<bool> sptSet = List.filled(SIZE, false);
    List<int?> parent = List.filled(SIZE, null);

    dist[src] = 0;

    for (int count = 0; count < SIZE - 1; count++) {
      int u = minDistance(dist, sptSet);

      if (u == -1 || u == target) {
        print('Breaking out of loop. Current vertex: ${vertexData[u]}');
        print('Distances: ${dist}');
        break;
      }

      print('Visited vertex: ${vertexData[u]}');
      sptSet[u] = true;

      for (int v = 0; v < SIZE; v++) {
        if (!sptSet[v] && adjMatrix[u][v] != 0 && dist[u] + adjMatrix[u][v] < dist[v]) {
          parent[v] = u;
          dist[v] = dist[u] + adjMatrix[u][v];
        }
      }
    }

    print('Path: ');
    if (src != target) {
      print('${vertexData[src]}');
      printPath(parent, target);
    } else {
      print('${vertexData[src]}');
    }
    print(', Distance: ${dist[target]}');
  }
}

void main() {
  Graph g = Graph();

  // Initialize vertex data
  g.addVertexData(0, "A");
  g.addVertexData(1, "B");
  g.addVertexData(2, "C");
  g.addVertexData(3, "D");
  g.addVertexData(4, "E");
  g.addVertexData(5, "F");
  g.addVertexData(6, "G");
  g.addVertexData(7, "H");
  g.addVertexData(8, "I");
  g.addVertexData(9, "J");

  // Initialize edges
  g.addEdge(3, 0, 4); // D - A, weight 4
  g.addEdge(3, 4, 2); // D - E, weight 2
  g.addEdge(0, 2, 3); // A - C, weight 3
  g.addEdge(0, 4, 4); // A - E, weight 4
  g.addEdge(4, 2, 4); // E - C, weight 4
  g.addEdge(4, 6, 5); // E - G, weight 5
  g.addEdge(2, 5, 5); // C - F, weight 5
  g.addEdge(2, 1, 2); // C - B, weight 2
  g.addEdge(1, 5, 2); // B - F, weight 2
  g.addEdge(6, 5, 5); // G - F, weight 5
  g.addEdge(6, 8, 4); // G - I, weight 4
  g.addEdge(6, 7, 5); // G - H, weight 5
  g.addEdge(8, 9, 2); // I - J, weight 2

  // Run Dijkstra's algorithm from D to F
  print("Dijkstra's Algorithm, from vertex D to F:\n");
  g.dijkstra(3, 5);
}
