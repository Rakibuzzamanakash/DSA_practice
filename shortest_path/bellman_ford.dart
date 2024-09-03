import 'dart:core';
import 'dart:math';

const int maxSize = 100;
const int intMax = 9223372036854775807;

class Graph {
  List<List<int>> adjMatrix;
  List<String> vertexData;
  int size;

  Graph(this.size)
      : adjMatrix = List.generate(
            maxSize, (_) => List.filled(maxSize, 0)), // Initialize matrix
        vertexData = List.filled(maxSize, ''); // Initialize vertex data

  void addEdge(int u, int v, int weight) {
    if (u >= 0 && u < size && v >= 0 && v < size) {
      adjMatrix[u][v] = weight;
      // For undirected graph: adjMatrix[v][u] = weight;
    }
  }

  void addVertexData(int vertex, String data) {
    if (vertex >= 0 && vertex < size) {
      vertexData[vertex] = data;
    }
  }

  int bellmanFord(String startVertexData, List<int> distances,
      List<int> predecessors) {
    int startVertex = vertexData.indexOf(startVertexData);

    for (int i = 0; i < size; i++) {
      distances[i] = intMax;
      predecessors[i] = -1;
    }

    distances[startVertex] = 0;

    for (int i = 0; i < size - 1; i++) {
      for (int u = 0; u < size; u++) {
        for (int v = 0; v < size; v++) {
          if (adjMatrix[u][v] != 0 &&
              distances[u] != intMax &&
              distances[u] + adjMatrix[u][v] < distances[v]) {
            distances[v] = distances[u] + adjMatrix[u][v];
            predecessors[v] = u;
            print(
                'Relaxing edge ${vertexData[u]} -> ${vertexData[v]}, Updated distance to ${vertexData[v]}: ${distances[v]}');
          }
        }
      }
    }

    // Check for negative weight cycles
    for (int u = 0; u < size; u++) {
      for (int v = 0; v < size; v++) {
        if (adjMatrix[u][v] != 0 &&
            distances[u] != intMax &&
            distances[u] + adjMatrix[u][v] < distances[v]) {
          return 1; // Negative weight cycle detected
        }
      }
    }

    return 0; // No negative weight cycle found
  }

  String getPath(List<int> predecessors, String startVertexData,
      String endVertexData) {
    List<String> path = [];
    int current = vertexData.indexOf(endVertexData);

    while (current != -1) {
      path.add(vertexData[current]);
      current = predecessors[current];
      if (current != -1 && vertexData[current] == startVertexData) {
        path.add(startVertexData);
        break;
      }
    }

    return path.reversed.join(' -> ');
  }
}

void main() {
  Graph g = Graph(5);

  g.addVertexData(0, 'A');
  g.addVertexData(1, 'B');
  g.addVertexData(2, 'C');
  g.addVertexData(3, 'D');
  g.addVertexData(4, 'E');

  g.addEdge(3, 0, 4); // D -> A, weight 4
  g.addEdge(3, 2, 7); // D -> C, weight 7
  g.addEdge(3, 4, 3); // D -> E, weight 3
  g.addEdge(0, 2, 4); // A -> C, weight 4
  g.addEdge(2, 0, -3); // C -> A, weight -3
  g.addEdge(0, 4, 5); // A -> E, weight 5
  g.addEdge(4, 2, 3); // E -> C, weight 3
  g.addEdge(1, 2, -4); // B -> C, weight -4
  g.addEdge(4, 1, 2); // E -> B, weight 2

  List<int> distances = List.filled(maxSize, 0);
  List<int> predecessors = List.filled(maxSize, 0);

  print('\nThe Bellman-Ford Algorithm starting from vertex D:');
  int negativeCycle = g.bellmanFord('D', distances, predecessors);

  if (negativeCycle == 0) {
    for (int i = 0; i < g.size; i++) {
      if (g.vertexData[i].isNotEmpty) {
        String path = g.getPath(predecessors, 'D', g.vertexData[i]);
        if (path.isNotEmpty) {
          print('$path, Distance: ${distances[i] == intMax ? "Infinity" : distances[i]}');
        } else {
          print('No path from D to ${g.vertexData[i]}, Distance: Infinity');
        }
      }
    }
  } else {
    print('Negative weight cycle detected. Cannot compute shortest paths.');
  }
}
