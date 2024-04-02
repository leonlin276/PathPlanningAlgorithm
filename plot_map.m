function  plot_map(open,close,PlotPausetime,flag)

if flag == true
    plot(close(:,1),close(:,2),'sr','MarkerFaceColor','r');
    
    pause(PlotPausetime);%显示遍历过程,PlotPausetime为暂停时间
    plot(open(:,1),open(:,2),'sg','MarkerFaceColor','b');
    pause(PlotPausetime);
    
    
end

end