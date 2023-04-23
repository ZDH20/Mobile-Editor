#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#define LIM 100

typedef struct Edge {
  char data;
  uint32_t cost;
} Edge;

typedef struct Vertex {
  char data;
  size_t sz;
  struct Edge *edges[LIM];
} Vertex;

typedef struct Graph {
  size_t sz;
  struct Vertex *verts[LIM];
} Graph;

void *s_malloc(size_t nbytes) {
  void *p = malloc(nbytes);
  if (!p) {
    fprintf(stderr, "ERROR: could not allocate %zu bytes. Reason: %s\n",
            nbytes, strerror(errno));
    exit(EXIT_FAILURE);
  }
  return p;
}

Edge *edge_alloc(char data, uint32_t cost) {
  Edge *edge = s_malloc(sizeof(Edge));
  edge->cost = cost;
  edge->data = data;
  return edge;
}

Vertex *edge_alloc(char data cost) {
  Vertex *vertex = s_malloc(sizeof(Vertex));
  vertex->cost   = cost;
  vertex->sz     = 0;
  return vertex;
}

Graph graph_init() {
  Graph g;
  g.sz = 0;
  return g;
}

int graph_contains_vertex(Graph *g, char data) {
  for (size_t i = 0; i < g->sz; i++) {
    if (g->verts[i]->data == data) {
      return true;
    }
  }
  return false;
}

void graph_add_vertex(Graph *g, char data) {
  if (!graph_contains_vertex(g, data)) {
    g->verts[g->sz++] = vertex_alloc(data);
  }
}

void graph_add_edge(Graph *g, char src, char dest, uint32_t cost) {
  int fdest = false;
  int idx = -1;
  for (size_t i = 0; i < g->sz; i++) {
    if (g->verts[i]->data == src) {
      idx = (int)i;
    }
    if (g->verts[i]->data == dest) {
      fdest = true;
    }
    if (idx != -1 && fdest) {
      break;
    }
  }
  g->verts[idx]->edges[g->verts[idx]->sz++] = edge_alloc(dest, cost);
}

int main(void) {
  Graph g = graph_init();
  graph_add_vertex(&g, 'a');
  graph_add_vertex(&g, 'b');
  graph_add_vertex(&g, 'c');
  graph_add_edge(&g, 'a', 'b', 1);
  graph_add_edge(&g, 'a', 'c', 2);
  graph_add_edge(&g, 'c', 'f', 3);
  return 0;
}
