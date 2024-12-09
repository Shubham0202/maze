function path = solveMaze(maze)
    [n, m] = size(maze);
    path = [];
    visited = zeros(n, m);

    function isSafe(x, y)
        return x >= 1 && x <= n && y >= 1 && y <= m && maze(x, y) == 0 && visited(x, y) == 0;
    end

    function dfs(x, y, currentPath)
        if x == n && y == m then
            path = currentPath;
            return;
        end

        visited(x, y) = 1;
        directions = [[0, 1]; [1, 0]; [0, -1]; [-1, 0]]; // Right, Down, Left, Up

        for i = 1:4
            nx = x + directions(i, 1);
            ny = y + directions(i, 2);

            if isSafe(nx, ny) then
                dfs(nx, ny, [currentPath; [nx, ny]]);
                if ~isempty(path) then
                    return;
                end
            end
        end

        visited(x, y) = 0;  // Backtrack if no path is found
    end

    dfs(1, 1, [1, 1]);
end

// Example maze (0 = open, 1 = wall)
maze = [
    0, 1, 0, 0, 0;
    0, 1, 0, 1, 0;
    0, 0, 0, 1, 0;
    1, 1, 0, 0, 0;
    0, 0, 0, 1, 0
];

path = solveMaze(maze);
if isempty(path) then
    disp("No path found.");
else
    disp("Path found:");
    disp(path);
end
