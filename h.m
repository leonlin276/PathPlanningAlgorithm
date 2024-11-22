function hcost = h( m,goal )

%欧几里得启发函数
hcost=10*(sqrt((m(1)-goal(1))^2+(m(2)-goal(2))^2));
%计算启发函数代价值 ，这里采用曼哈顿算法
%另一种是欧式距离hcost =10* abs(  m(1)-goal(1)  )+10*abs(  m(2)-goal(2)  );此处不采用

end