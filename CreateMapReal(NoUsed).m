function J = CreateMapReal(PicPath)
% ����ͼƬ  �����þ���·����Ҳ���������·��   ·���õ�����
Img=imread(PicPath);
% ��ͼƬתΪ�Ҷ�ͼ
% �ο����ӣ�https://ww2.mathworks.cn/help/matlab/ref/rgb2gray.html  
I = rgb2gray(Img);
% ����������� a��ʾ���� b��ʾ����
a=20;
b=20;
% ����߳�  Ҳ����ÿһ��С�ڿ����Сռ�ĳ���   �������Ϊ5  ��ô�ʹ�����С��С�ڿ�ռ�Ĵ�СΪ5*5=25������
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
J=double(J);
J = ones(size(J)) - J;




% % GridLineStyle��ʾդ��ͼ -��ʾʹ��ʵ�߻�  --��ʾʹ�����߻� ������ʹ��{:} ����  -.
% % �ο����ӣ�https://ww2.mathworks.cn/help/matlab/ref/axes.html?searchHighlight=axes&s_tid=srchtitle
% % https://www.cnblogs.com/mphyfin/archive/2011/12/26/2302232.html
% axes('GridLineStyle', '-');
% % set(gca,'ydir','reverse')�ĺ���ο����ӣ�https://blog.csdn.net/Suii_v5/article/details/78728873
% % Ϊʲô��Ҫ������ת����???
% % y�������
% set(gca,'ydir','reverse');
% %x�������
% set(gca,'xdir');
% % hold on���ã�https://jingyan.baidu.com/article/2009576160a9158a0721b495.html
% % hold on������ԭͼ�����ܴ˺���Ƶ��µ����ߣ����ӻ�ͼ
% % hold off������ˢ��ͼ�δ��ڣ������µ�����
% hold on
% % grid on���ã��ڻ�ͼ��ʱ�����������
% grid on
% % ��ͼ
% axis([0,a,0,b]);
% % gca��ʾ��ǰ��ͼ����
% % xtick��ʾx������̶ȣ��̶�Ϊ0��a������Ϊ1
% % https://zhidao.baidu.com/question/2208073897409037028.html
% set(gca,'xtick',0:1:a,'ytick',0:1:b);
% 
% % �ϰ������Ϊ��ɫ
% for i=1:a/length-1
%     for j=1:b/length-1
%         if(J(i,j)==0)
%             y=[i,i,i+1,i+1]*length;
%             x=[j,j+1,j+1,j]*length;
%             % �ο����ӣ�https://ww2.mathworks.cn/help/matlab/ref/fill.html?searchHighlight=fill&s_tid=srchtitle
%             % k����'black'���� 'k'����Ҳ����ʹ��'black'
%             h=fill(x,y,'k');
%             hold on
%         end
%     end
% end
