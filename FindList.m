function [flag,targetInd]=FindList(m,open,close)
%{
�������ܣ�
������ڽڵ�(m�洢����Ϣ)  �Ѿ���Closelist�У���flag = 1  targetInd = ������close��������������λ
������ڽڵ�(m�洢����Ϣ)    ����Openlist �У���flag = 2  targetInd = []
������ڽڵ�(m�洢����Ϣ)  �Ѿ���Openlist �У���flag = 3  targetInd = ������open��������������λ
%}

%���openlistΪ�գ���һ������openlist��
if  isempty(open)
    flag = 2;
    targetInd = [];
    
else  %open��Ϊ��ʱ����Ҫ����Ƿ���openlist��
    %����openlist������Ƿ���openlist��
    for io = 1:length(open(:,1))
        if isequal(  m(1:2) , open(io,1:2)  )  %��Openlist��
            flag = 3;
            targetInd = io;
            return;
        else  %����Openlist��
            flag = 2;
            targetInd = [];
        end
    end
end

%����ܵ���һ������һ������Openlist�У���ô��Ҫ�ж��Ƿ���closelist��

%����Closelist��ע��closelist������Ϊ�գ�
for ic = 1:length(close(:,1))
    if isequal(  m(1:2) , close(ic,1:2)  )  %��Closelist��
        flag = 1;
        targetInd = ic;
        return;%��Closelist��ֱ��return
    end
end

end