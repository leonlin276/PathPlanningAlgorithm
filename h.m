function hcost = h( m,goal )

%ŷ�������������
hcost=10*(sqrt((m(1)-goal(1))^2+(m(2)-goal(2))^2));
%����������������ֵ ����������������㷨
%��һ����ŷʽ����hcost =10* abs(  m(1)-goal(1)  )+10*abs(  m(2)-goal(2)  );�˴�������

end