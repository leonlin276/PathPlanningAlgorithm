function [MAP] = CreateMap(PicPath,LengthofMesh,FullLengthofPic)
% PicPath = 'D:\leonlin276\Desktop\SRTP\Projects_Main\TestPic\20_20_m_1.png';
% MAP=[0 0 0 0 1 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0;       %��ά�����ƾ���
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

% �������ã�������������

% ����ͼƬ  �����þ���·����Ҳ���������·��   ·���õ�����
Img=imread(PicPath);
% ��ͼƬתΪ�Ҷ�ͼ
% �ο����ӣ�https://ww2.mathworks.cn/help/matlab/ref/rgb2gray.html  
I = rgb2gray(Img);

% ����߳�  Ҳ����ÿһ��С�ڿ����Сռ�ĳ����������Ϊ5����ô�ʹ�����С��С�ڿ�ռ�Ĵ�СΪ5*5=25�����ӡ�
% ��ʵ�ʻ���������ľ��ȣ�ͨ������߳�����Ԥ�����񾫶ȵı߳���á�
a=FullLengthofPic/LengthofMesh;
b=FullLengthofPic/LengthofMesh;

length=1;
%   �����־���תΪ�涨�Ĵ�С
% B = imresize(A,[numrows numcols]) ����ͼ�� B���������������ɶ�Ԫ������ [numrows numcols] ָ����
% B��һ��50*50�ľ��󣬸þ����У����ֵΪ255����ʾ��ɫ������СֵΪ0����ʾ��ɫ��
% �ο����ӣ�https://ww2.mathworks.cn/help/matlab/ref/imresize.html?searchHighlight=imresize&s_tid=srchtitle
B = imresize(I,[a/length b/length]);
% J=floor(B/255)��ʾ����ȡ��   С�ڻ���ڸ�Ԫ�ص���ӽ�����
% B/255��ʾ B�е�ÿһ��Ԫ�ض�����255��С��255�����ֳ���255����0����ɫ��������255�����ֳ���255����1����ɫ��
% ��Ȼ����ط�Ҳ���Բ�����255�������������֣���ȻЧ���ͻ᲻һ��
% ���д������˼�ǣ����ϰ������ھ���תΪ0����ɫ������������Ϊ1.Ҳ���Լ������Ϊ�ϰ���Ϊ1��������Ϊ0.
% �ο����ӣ�https://ww2.mathworks.cn/help/matlab/ref/floor.html?searchHighlight=floor&s_tid=srchtitle
J=floor(B/255);
J=double(J);    %ת��Ϊ����������
MAP = ones(size(J)) - J;    %��ת�ڰ�

MAP = flipud(MAP);  %���·�ת����

MAX_X=size(MAP,2);
MAX_Y=size(MAP,1);

% j=0;
% x_val = 1;
% y_val = 1;
axis([0.5 MAX_X+0.5 0.5 MAX_Y+0.5])%�����᷶Χ���ݺ��
set(gca,'YTick',0:1:MAX_Y);
set(gca,'XTick',0:1:MAX_X);%�趨xy��������ʾ��Ŀ̶���
% for i = 1:map.XYMAX+3
%    line([-0.5,map.XYMAX+1.5],[i-1.5,i-1.5]);
% end
% 
% for j = 1:map.XYMAX+3
%    line([j-1.5,j-1.5],[-0.5,map.XYMAX+1.5]);
% end
hold on; %����»�ͼʱ����ԭ��ͼ

draw_b = MAP;
draw_b(end+1,end+1) = 0;
colormap([1 1 1;0 0 0]);  % ������ɫ
pcolor(0.5:size(MAP,2) + 0.5, 0.5:size(MAP,1) + 0.5, draw_b); % ����դ����ɫ


