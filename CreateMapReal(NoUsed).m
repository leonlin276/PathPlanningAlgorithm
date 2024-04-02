function J = CreateMapReal(PicPath)
% 读入图片  可以用绝对路径，也可以用相对路径   路径用单引号
Img=imread(PicPath);
% 将图片转为灰度图
% 参考链接：https://ww2.mathworks.cn/help/matlab/ref/rgb2gray.html  
I = rgb2gray(Img);
% 设置网格格数 a表示横轴 b表示纵轴
a=20;
b=20;
% 网格边长  也就是每一个小黑块的最小占的长宽   如果设置为5  那么就代表最小的小黑块占的大小为5*5=25个格子
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
J=double(J);
J = ones(size(J)) - J;




% % GridLineStyle表示栅格图 -表示使用实线画  --表示使用虚线画 还可以使用{:} 或者  -.
% % 参考链接：https://ww2.mathworks.cn/help/matlab/ref/axes.html?searchHighlight=axes&s_tid=srchtitle
% % https://www.cnblogs.com/mphyfin/archive/2011/12/26/2302232.html
% axes('GridLineStyle', '-');
% % set(gca,'ydir','reverse')的含义参考链接：https://blog.csdn.net/Suii_v5/article/details/78728873
% % 为什么需要做坐标转换呢???
% % y坐标调换
% set(gca,'ydir','reverse');
% %x坐标调换
% set(gca,'xdir');
% % hold on作用：https://jingyan.baidu.com/article/2009576160a9158a0721b495.html
% % hold on：保持原图并接受此后绘制的新的曲线，叠加绘图
% % hold off：重新刷新图形窗口，绘制新的曲线
% hold on
% % grid on作用：在画图的时候添加网格线
% grid on
% % 画图
% axis([0,a,0,b]);
% % gca表示当前绘图区域
% % xtick表示x轴坐标刻度，刻度为0到a，步进为1
% % https://zhidao.baidu.com/question/2208073897409037028.html
% set(gca,'xtick',0:1:a,'ytick',0:1:b);
% 
% % 障碍物填充为黑色
% for i=1:a/length-1
%     for j=1:b/length-1
%         if(J(i,j)==0)
%             y=[i,i,i+1,i+1]*length;
%             x=[j,j+1,j+1,j]*length;
%             % 参考链接：https://ww2.mathworks.cn/help/matlab/ref/fill.html?searchHighlight=fill&s_tid=srchtitle
%             % k代表'black'（或 'k'），也可以使用'black'
%             h=fill(x,y,'k');
%             hold on
%         end
%     end
% end
