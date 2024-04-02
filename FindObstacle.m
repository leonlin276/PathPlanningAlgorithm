function [Obstacle] = FindObstacle(MAP)
Obstacle=[];
MAX_X=size(MAP,2);
MAX_Y=size(MAP,1);

for i=1:MAX_X       %±éÀúMAPÊý×é
    for j=1:MAX_Y
        if MAP(i,j) == 1
            Obstacle=[Obstacle;[j i]];
        end
    end
end