function [xTarget,yTarget,MAP,Map] = SetAimPoint(xStart,yStart,MAP,Map)
%%地图上选择目标点
% pause(0.1);
% h=msgbox('Please Select the Target using the Left Mouse button in the space');
% uiwait(h,5);
% if ishandle(h) == 1
%     delete(h);
% end
% xlabel('Please Select the Target using the Left Mouse button','Color','black');
but = 0;
while (but ~= 1) 
    [xval,yval,but]=ginput(1);
end
xval = floor(xval);
yval = floor(yval);
xTarget = xval;
yTarget = yval;

% MAP(xval,yval) = 0;
plot(xval,yval,'gd');
text(xval+1,yval+.5,'Target');
node = [xStart,yStart,xTarget,yTarget];


Map.goal=[xTarget,yTarget];

save map MAP;
save point node;