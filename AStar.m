function Path = AStar(Obstacle,Map,PlotPausetime,IfPlot)

OpenList=[];
CloseList=[];
FoundFlag=false;

%====================1.����ʼ�����Openlist��

%open����ÿһ��  [�ڵ����꣬����ֵF=G+H,����ֵG,���ڵ�����]
OpenList =[Map.start(1), Map.start(2), 0+h(Map.start,Map.goal),0, Map.start(1), Map.start(2)];

% ����״̬--��һ���İ˸���
next=MotionModel();

        
%====================2.�ظ����¹���

while ~FoundFlag
%--------------------�����ж��Ƿ�ﵽĿ��㣬����·��
    if isempty(OpenList(:,1))
        disp('No path to goal');
        return;
    end
    
    %�ж�Ŀ����Ƿ������open�б���
    [isopenFlag,Id]=isopen(Map.goal,OpenList);
    if isopenFlag
        disp('Find Goal');
        CloseList = [OpenList(Id,:);CloseList];
        FoundFlag=true;
        break;
    end


    %------------------a.����Openlist�еĵ����У����ۺ���F���������򣬲���Fֵ��С�Ľڵ�
    %��OpenList�е���������
    [Y,I] = sort(OpenList(:,3)); %IΪindex
    OpenList=OpenList(I,:);%open�е�һ�нڵ���Fֵ��С��
    
    %------------------b.��Fֵ��С�Ľڵ�(��open�е�һ�нڵ�)���ŵ�close��һ��(close�ǲ����ۻ���)����Ϊ��ǰ�ڵ�
    CloseList = [OpenList(1,:);CloseList];
    current = OpenList(1,:);
    OpenList(1,:)=[];%��Ϊ�Ѿ���open���Ƴ��ˣ����Ե�һ����ҪΪ��
    
    %--------------------c.�Ե�ǰ�ڵ���Χ��8�����ڽڵ㣬�㷨���壺------------------------
    for in=1:length(next(:,1))
        
        %������ڽڵ������,����ֵF�ȵ���0,����ֵG�ȵ���0,��������ֵ���丸�ڵ������ֵ���ݶ�Ϊ��(��Ϊ��ʱ���޷��ж��丸�ڵ������Ƕ���)
        m=[current(1,1)+next(in,1) , current(1,2)+next(in,2) , 0 , 0 , 0 ,0]; 
        m(4)=current(1,4)+next(in,3); % m(4)�����ڽڵ�Gֵ
        m(3)=m(4)+h(m(1:2),Map.goal);% m(3)�����ڽڵ�Fֵ
        
        %>>��������ɴ��������������һ�����ڽڵ�  (obstacle����������ǰ����߽��)
        if isObstacle(m,Obstacle)
            continue;
        end
        
        %flag == 1�����ڽڵ�  ��Closelist��  targetInd = close���к�
        %flag == 2�����ڽڵ㲻��Openlist��   targetInd = []
        %flag == 3�����ڽڵ�  ��Openlist��   targetInd = open���к�
        [flag,targetInd]=FindList(m,OpenList,CloseList);
        
        %>>�������Closelist�У����Դ����ڽڵ�
        if flag==1 
            continue;
        %>>���������Openlist�У�����Openlist,���ѵ�ǰ�ڵ�����Ϊ���ĸ��ڵ�
        elseif flag==2 
            m(5:6)=[current(1,1),current(1,2)];%����ǰ�ڵ���Ϊ�丸�ڵ�
            OpenList = [OpenList;m];%�������ڽڵ�ӷ�openlist��
        %>>������Openlist�У�����ɵ�ǰ�ڵ㵽���ڽڵ��Ƿ���ã���������򽫵�ǰ�ڵ�����Ϊ�丸�ڵ㣬������F,Gֵ�����򲻲���    
        else
            %�ɵ�ǰ�ڵ㵽�����ڽڵ����(targetInd�Ǵ����ڽڵ���open�е��к� ���еĵ�3���Ǵ��ۺ���Fֵ)
            if m(3) < OpenList(targetInd,3)
                %���ã��򽫴����ڽڵ�ĸ��ڵ�����Ϊ��ǰ�ڵ㣬����������
                m(5:6)=[current(1,1),current(1,2)];%����ǰ�ڵ���Ϊ�丸�ڵ�
                OpenList(targetInd,:) = m;%�������ڽڵ���Openlist�е����ݸ���
            end
        end
        
        %�����end���жϰ˸����ڽڵ��forѭ����end
    end
    plot_map(OpenList,CloseList,PlotPausetime,IfPlot);       %����չʾ�㷨������̣����ڷ�������ٶ�ʱ�ر�
    

end

%���·��
Path=GetPath(CloseList,Map.start);