function [xStart,yStart,MAP,Map] = SetStartPoint(MAP,Map)
%%��ͼ��ѡ����ʼλ��
% pause(0.1);
% h=msgbox('Please Select the Vehicle initial position using the Left Mouse button');
% uiwait(h,5);%����5�����ʧ
% if ishandle(h) == 1
%     delete(h);
% end
% xlabel('Please Select the Vehicle initial position ','Color','black');
but=0;
while (but ~= 1) %����ִ�г��ǵ����
    [xval,yval,but]=ginput(1);%¼�����������
    xval=floor(xval);%�㴦���������������
    yval=floor(yval);
end
xStart=xval;%Starting Position
yStart=yval;%Starting Position
Map.start=[xStart,yStart];
% MAP(xval,yval) = 0;
 plot(xval,yval,'bo');%����Ȧ