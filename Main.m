Map = struct;       %����struct����Map��¼��㣬�յ�����
PicPath = 'TestPic\25_25_m_6.png';     %��ͼͼƬλ��
IfPlot = true;      %�Ƿ�չʾ��Ѱ����
PlotPausetime = 0;      %չʾʱͣ��ʱ��
LengthofMesh = 0.4;       %���񾫶ȣ�m
FullLengthofPic = 25;       %��ͼʵ�ʶ�Ӧ����ߴ磬m

[MAP] = CreateMap(PicPath,LengthofMesh,FullLengthofPic);       %ͨ����������ʵ��ʹ�õ�դ���ͼ
[xStart,yStart,MAP,Map] = SetStartPoint(MAP,Map);       %����趨��ʼ��
[xTarget,yTarget,MAP,Map] = SetAimPoint(xStart,yStart,MAP,Map);     %����趨�յ�
[Obstacle] = FindObstacle(MAP);
t = 0;
t1 = clock;
Path = AStar(Obstacle,Map,PlotPausetime,IfPlot);     %A*�㷨
t2 = clock;
t = t + etime(t2, t1)

%����·��
if length(Path)>=1
    plot(Path(:,1),Path(:,2),'-c','LineWidth',2);hold on;
end
