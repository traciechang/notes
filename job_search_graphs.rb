# Graphs 9/16/18

# Introduction

# 1. Vertices (dots)
# 2. Edges (lines) that connect the vertices.
    # - can add directions (if u do, every point must have directions)
    # - can also have weights (can leave unweighted or must add weight to all edges)

# Example: Facebook
        Vertices: FB users
        Edges: connect user A to user B if and only if A and B are friends
            - unweighted and undirected. If A is friends with B, B is friends with A - there is no direction.

Sparce Graph

    |V| = num of vertices
    |E| = num of edges

    density = |E| / ( |V| (|V| - 1) )
    max density of 1
    min density = 0. the closer to 0 density is, the sparcer the graph
    - if there are directives, max density is 2 rather than 1, because everything is doubled since u could have an In or an Out edge

Example: Twitter
        Vertices: users
        Edges: u can follow me or I can follow u, or both. So A -> B if A were following B.

Trees
    - what makes a graph a tree?
        - connected
        - n vertices
        - n-1 edges 
    - Example: DOM
        - vertices: DOM elements
        - edges: parents & children are connected

    - Density of tree:
        = |E| / ( |V| (|V| - 1) )
        = (n-1) / ( n(n-1) )
        = 1 / n

4 Color Theorem

Dependency Set
    - list of tasks/events that depend on each other in some way
        - vertices: tasks
        - edges: Task A -> Task B if task B depends on Task A (meaning Task A must be done before B)
        - should not have any cycles, meaning A -> B -> C -> A, because this is never ending

Implementing a Graph
        class Graph
            def initialize
                @vertices = []
                @edges = []
            end
        end

        class Vertex
            def initialize(data)
                @data = data
            end
        end

        class Edge
            # define which vertices the edge is connecting
            def initialize(A, B)
                @vertices = [A, B]
                # if we have weighted graph:
                @weight = 1
            end
        end

        - or we can create a create_edges method in the Graph class. We can create a matrix that shows which vertices are connected (0 is not connected, 1 is)

        Adjacency Matrx

           A B C D
        A  0 1 0 1
        B 
        C
        D

        - or we can store edges in Vertex class. We can have ivar @in_edges = [] and @out_edges = []


Topological Sort
    1. do all tasks with no dependencies first (tasks with no In edges to them)
    2. then all the vertices with In edge only from step 1
    3. all vertices with no other In edges but the ones coming In from previous steps

    * in each step, tasks can be done in any order, since there are no dependencies. This means that there are many ways to do Topological Sort and there is not one unique answer

    # This is called Kahn's Algorithm
    #     1. Create Queue
    #         - push in all vertices with no In edges
    #     2. Pop off vertices from queue
    #         a. Remove vertex and its Out edges from the graph
    #         b. Push vertex into an array
    #         c. examine destination vertices, push onto queue if it has no more In edges

    #     - Vertex class should have access to In and Out edge set
    #     - you may choose to give Graph class access to edges as well to easily delete/add edges

    # Implementation

        def topo_sort(graph)
            sorted = []
            top = new Queue()
            graph.vertices.each do |vertex|
                if vertex.in_edges.empty?
                    top.enqueue(vertex)
                end
            end

            until top.empty?
                current = top.pop
                sorted << current
                current.out_edges.each do |edge|
                    if edge.destination(in_edges).empty?
                        top.enqueue(edge.destination)
                    end
                    graph.delete_edge(edge)
                end
                graph.delete_vertex(current)
            end
            sorted
        end

    Time Complexity
        - depends on sparcity or density of graph. If sparce, O(|V|). If we have dense graph, O(|V|**2)

Other Algorithms
        - Coffman-Graham
        - Modifying DFS

Use Cases
        - task/dependency lists
        - Webpack (file dependencies)
        - Schedule tasks given scheduling restrictions
        - minimal spanning tree