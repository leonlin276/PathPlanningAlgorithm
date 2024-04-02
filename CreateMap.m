function [MAP] = CreateMap(PicPath,LengthofMesh,FullLengthofPic)
% PicPath = 'D:\leonlin276\Desktop\SRTP\Projects_Main\TestPic\20_20_m_1.png';
% MAP=[0 0 0 0 1 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0;       %二维二进制矩阵
%      0 1 1 0 1 0 1 0 0 1 0 0 0 0 1 0 0 0 1 0;
%      0 1 1 0 1 0 1 1 0 1 0 0 0 1 0 1 0 1 0 0;
%      0 0 0 1 0 0 1 1 1 0 0 0 1 0 0 0 1 1 0 0;
%      0 0 1 0 0 0 1 1 1 1 0 0 0 1 0 0 0 0 0 0;
%      0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 0;
%      0 1 0 1 0 0 1 1 1 0 0 0 0 0 0 1 1 0 0 0;
%      0 0 0 1 0 0 1 1 1 0 1 0 1 1 0 0 0 0 1 1;
%      0 1 1 1 0 0 0 0 0 0 1 0 1 1 0 0 0 0 1 1;
%      0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0;
%      0 0 1 1 0 0 0 1 1 0 1 1 1 1 0 0 0 1 0 0;
%      0 0 1 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0;
%      1 1 0 0 0 1 1 0 0 0 0 1 1 1 0 1 1 1 1 0;
%      1 1 0 0 0 1 1 0 0 0 1 0 0 0 0 0 0 0 0 0;
%      0 0 1 1 0 0 0 0 0 0 1 1 1 1 0 1 1 1 1 0;
%      0 0 1 1 0 0 1 1 1 0 1 0 0 0 0 0 0 0 0 0;
%      1 1 0 0 0 0 0 1 1 0 1 0 0 1 1 0 0 1 1 0; 
%      0 0 0 0 1 0 0 0 0 0 0 0 0 1 1 0 0 1 1 0;
%      0 0 0 1 1 1 0 0 1 1 0 0 0 1 1 0 0 1 0 0;
%      0 0 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0];
% MAP = randi([0,1], 100, 100)

% 以上无用，仅供函数测试

% 读入图片  可以用绝对路径，也可以用相对路径   路径用单引号
Img=imread(PicPath);
% 将图片转为灰度图
% 参考链接：https://ww2.mathworks.cn/help/matlab/ref/rgb2gray.html  
I = rgb2gray(Img);

% 网格边长  也就是每一个小黑块的最小占的长宽，如果设置为5，那么就代表最小的小黑块占的大小为5*5=25个格子。
% 即实际环境中网格的精度，通过区域边长除以预计网格精度的边长获得。
a=FullLengthofPic/LengthofMesh;
b=FullLengthofPic/LengthofMesh;

length=1;
%   将数字矩阵转为规定的大小
% B = imresize(A,[numrows numcols]) 返回图像 B，其行数和列数由二元素向量 [numrows numcols] 指定。
% B是一个50*50的矩阵，该矩阵中，最大值为255（表示白色），最小值为0（表示黑色）
% 参考链接：https://ww2.mathworks.cn/help/matlab/ref/imresize.html?searchHighlight=imresize&s_tid=srchtitle
B = imresize(I,[a/length b/length]);
% J=floor(B/255)表示向下取整   小于或等于该元素的最接近整数
% B/255表示 B中的每一个元素都除以255，小于255的数字除以255等于0（黑色），等于255的数字除以255等于1（白色）
% 当然这个地方也可以不除以255，而是其他数字，当然效果就会不一样
% 这行代码的意思是，将障碍物所在矩阵转为0（黑色），其余区域为1.也可自己将其改为障碍物为1，可行域为0.
% 参考链接：https://ww2.mathworks.cn/help/matlab/ref/floor.html?searchHighlight=floor&s_tid=srchtitle
J=floor(B/255);
J=double(J);    %转换为浮点数矩阵
MAP = ones(size(J)) - J;    %翻转黑白

MAP = flipud(MAP);  %上下翻转矩阵

MAX_X=size(MAP,2);
MAX_Y=size(MAP,1);

% j=0;
% x_val = 1;
% y_val = 1;
axis([0.5 MAX_X+0.5 0.5 MAX_Y+0.5])%坐标轴范围和纵横比
set(gca,'YTick',0:1:MAX_Y);
set(gca,'XTick',0:1:MAX_X);%设定xy坐标轴显示轴的刻度线
% for i = 1:map.XYMAX+3
%    line([-0.5,map.XYMAX+1.5],[i-1.5,i-1.5]);
% end
% 
% for j = 1:map.XYMAX+3
%    line([j-1.5,j-1.5],[-0.5,map.XYMAX+1.5]);
% end
hold on; %添加新绘图时候保留原绘图

draw_b = MAP;
draw_b(end+1,end+1) = 0;
colormap([1 1 1;0 0 0]);  % 创建颜色
pcolor(0.5:size(MAP,2) + 0.5, 0.5:size(MAP,1) + 0.5, draw_b); % 赋予栅格颜色


