function [xStart,yStart,MAP,Map] = SetStartPoint(MAP,Map)
%%地图上选择起始位置
% pause(0.1);
% h=msgbox('Please Select the Vehicle initial position using the Left Mouse button');
% uiwait(h,5);%出现5秒后消失
% if ishandle(h) == 1
%     delete(h);
% end
% xlabel('Please Select the Vehicle initial position ','Color','black');
but=0;
while (but ~= 1) %反复执行除非点左键
    [xval,yval,but]=ginput(1);%录入这个鼠标左键
    xval=floor(xval);%点处向负无穷方向四舍五入
    yval=floor(yval);
end
xStart=xval;%Starting Position
yStart=yval;%Starting Position
Map.start=[xStart,yStart];
% MAP(xval,yval) = 0;
 plot(xval,yval,'bo');%画个圈