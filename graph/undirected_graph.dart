void printAdjacencyMatrix(List<List<int>> matrix) {
  print("Adjacency Matrix:");
  for (int i = 0; i < matrix.length; i++) {
    StringBuffer row = StringBuffer();
    for (int j = 0; j < matrix[i].length; j++) {
      row.write('${matrix[i][j]} ');
    }
    print(row.toString().trim());
  }
}

void printConnections(List<List<int>> matrix, List<String> vertices) {
  print("\nConnections for each vertex:");
  for (int i = 0; i < matrix.length; i++) {
    StringBuffer connections = StringBuffer('${vertices[i]}: ');
    for (int j = 0; j < matrix[i].length; j++) {
      if (matrix[i][j] == 1) {  // if there is a connection
        connections.write('${vertices[j]} ');
      }
    }
    print(connections.toString().trim());
  }
}

void main() {
  List<String> vertexData = ['A', 'B', 'C', 'D'];
  List<List<int>> adjacencyMatrix = [
    [0, 1, 1, 1], // Edges for A
    [1, 0, 1, 0], // Edges for B
    [1, 1, 0, 0], // Edges for C
    [1, 0, 0, 0]  // Edges for D
  ];

  printAdjacencyMatrix(adjacencyMatrix);
  printConnections(adjacencyMatrix, vertexData);
}
