This is a project that applies the A* path planning algorithm to a target environment, programmed in MATLAB.

The project includes two parts: generating environment data based on a monochromatic bitmap, and applying the A* path planning algorithm to this environment.

For generating environment data, the input to the program is a monochrome bitmap which contains the obstacle information for a given environment. Black color in the graph indicates obstacles and white color indicates no obstacles. The program grids the bitmap based on a pre-set grid size parameter. The output is a two-dimensional array variable containing the obstacle information, which is the environment data that will be used by the algorithm.

This environmental data is presented by a visual interface. The start and end points are manually selected in the interactive interface and then the algorithm will plan a feasible route.

Since the increase in grid size will reduce the accuracy of the environmental data, but reduce the computation time and vice versa. This project also experimented with a series of tests to investigate a reasonable grid size, aimed at balancing between accuracy and compute time.
