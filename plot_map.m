function  plot_map(open,close,PlotPausetime,flag)

if flag == true
    plot(close(:,1),close(:,2),'sr','MarkerFaceColor','r');
    
    pause(PlotPausetime);%��ʾ��������,PlotPausetimeΪ��ͣʱ��
    plot(open(:,1),open(:,2),'sg','MarkerFaceColor','b');
    pause(PlotPausetime);
    
    
end

end