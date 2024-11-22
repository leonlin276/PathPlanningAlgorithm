function Path = AStar(Obstacle,Map,PlotPausetime,IfPlot)

OpenList=[];
CloseList=[];
FoundFlag=false;

%====================1.将起始点放在Openlist中

%open变量每一行  [节点坐标，代价值F=G+H,代价值G,父节点坐标]
OpenList =[Map.start(1), Map.start(2), 0+h(Map.start,Map.goal),0, Map.start(1), Map.start(2)];

% 更新状态--下一步的八个点
next=MotionModel();

        
%====================2.重复以下过程

while ~FoundFlag
%--------------------首先判断是否达到目标点，或无路径
    if isempty(OpenList(:,1))
        disp('No path to goal');
        return;
    end
    
    %判断目标点是否出现在open列表中
    [isopenFlag,Id]=isopen(Map.goal,OpenList);
    if isopenFlag
        disp('Find Goal');
        CloseList = [OpenList(Id,:);CloseList];
        FoundFlag=true;
        break;
    end


    %------------------a.按照Openlist中的第三列（代价函数F）进行排序，查找F值最小的节点
    %对OpenList中第三列排序
    [Y,I] = sort(OpenList(:,3)); %I为index
    OpenList=OpenList(I,:);%open中第一行节点是F值最小的
    
    %------------------b.将F值最小的节点(即open中第一行节点)，放到close第一行(close是不断累积的)，作为当前节点
    CloseList = [OpenList(1,:);CloseList];
    current = OpenList(1,:);
    OpenList(1,:)=[];%因为已经从open中移除了，所以第一列需要为空
    
    %--------------------c.对当前节点周围的8个相邻节点，算法主体：------------------------
    for in=1:length(next(:,1))
        
        %获得相邻节点的坐标,代价值F先等于0,代价值G先等于0,后面两个值是其父节点的坐标值，暂定为零(因为暂时还无法判断其父节点坐标是多少)
        m=[current(1,1)+next(in,1) , current(1,2)+next(in,2) , 0 , 0 , 0 ,0]; 
        m(4)=current(1,4)+next(in,3); % m(4)是相邻节点G值
        m(3)=m(4)+h(m(1:2),Map.goal);% m(3)是相邻节点F值
        
        %>>如果它不可达，忽略它，处理下一个相邻节点  (obstacle这个数组中是包括边界的)
        if isObstacle(m,Obstacle)
            continue;
        end
        
        %flag == 1：相邻节点  在Closelist中  targetInd = close中行号
        %flag == 2：相邻节点不在Openlist中   targetInd = []
        %flag == 3：相邻节点  在Openlist中   targetInd = open中行号
        [flag,targetInd]=FindList(m,OpenList,CloseList);
        
        %>>如果它在Closelist中，忽略此相邻节点
        if flag==1 
            continue;
        %>>如果它不在Openlist中，加入Openlist,并把当前节点设置为它的父节点
        elseif flag==2 
            m(5:6)=[current(1,1),current(1,2)];%将当前节点作为其父节点
            OpenList = [OpenList;m];%将此相邻节点加放openlist中
        %>>若它在Openlist中，检查由当前节点到相邻节点是否更好，如果更好则将当前节点设置为其父节点，并更新F,G值；否则不操作    
        else
            %由当前节点到达相邻节点更好(targetInd是此相邻节点在open中的行号 此行的第3列是代价函数F值)
            if m(3) < OpenList(targetInd,3)
                %更好，则将此相邻节点的父节点设置为当前节点，否则不作处理
                m(5:6)=[current(1,1),current(1,2)];%将当前节点作为其父节点
                OpenList(targetInd,:) = m;%将此相邻节点在Openlist中的数据更新
            end
        end
        
        %下面的end是判断八个相邻节点的for循环的end
    end
    plot_map(OpenList,CloseList,PlotPausetime,IfPlot);       %用于展示算法运算过程，用于仿真测试速度时关闭
    

end

%绘出路径
Path=GetPath(CloseList,Map.start);