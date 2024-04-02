Map = struct;       %定义struct变量Map记录起点，终点坐标
PicPath = 'D:\leonlin276\Desktop\SRTP\Projects_Main\TestPic\25_25_m_6.png';     %地图图片位置
IfPlot = true;      %是否展示搜寻过程
PlotPausetime = 0;      %展示时停留时间
LengthofMesh = 0.4;       %网格精度，m
FullLengthofPic = 25;       %地图实际对应区域尺寸，m

[MAP] = CreateMap(PicPath,LengthofMesh,FullLengthofPic);       %通过函数生成实验使用的栅格地图
[xStart,yStart,MAP,Map] = SetStartPoint(MAP,Map);       %点击设定起始点
[xTarget,yTarget,MAP,Map] = SetAimPoint(xStart,yStart,MAP,Map);     %点击设定终点
[Obstacle] = FindObstacle(MAP);
t = 0;
t1 = clock;
Path = AStar(Obstacle,Map,PlotPausetime,IfPlot);     %A*算法
t2 = clock;
t = t + etime(t2, t1)

%画出路径
if length(Path)>=1
    plot(Path(:,1),Path(:,2),'-c','LineWidth',2);hold on;
end
