function [flag,targetInd]=FindList(m,open,close)
%{
函数功能：
如果相邻节点(m存储其信息)  已经在Closelist中，则flag = 1  targetInd = 其所在close的行数，用来定位
如果相邻节点(m存储其信息)    不在Openlist 中，则flag = 2  targetInd = []
如果相邻节点(m存储其信息)  已经在Openlist 中，则flag = 3  targetInd = 其所在open的行数，用来定位
%}

%如果openlist为空，则一定不在openlist中
if  isempty(open)
    flag = 2;
    targetInd = [];
    
else  %open不为空时，需要检查是否在openlist中
    %遍历openlist，检查是否在openlist中
    for io = 1:length(open(:,1))
        if isequal(  m(1:2) , open(io,1:2)  )  %在Openlist中
            flag = 3;
            targetInd = io;
            return;
        else  %不在Openlist中
            flag = 2;
            targetInd = [];
        end
    end
end

%如果能到这一步，则一定不在Openlist中，那么需要判断是否在closelist中

%遍历Closelist（注意closelist不可能为空）
for ic = 1:length(close(:,1))
    if isequal(  m(1:2) , close(ic,1:2)  )  %在Closelist中
        flag = 1;
        targetInd = ic;
        return;%在Closelist中直接return
    end
end

end