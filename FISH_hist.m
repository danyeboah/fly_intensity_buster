function [hist_percent] = FISH_hist(neighbor_distances,edges)

hist_temp    = histc(neighbor_distances,edges);
hist_percent = hist_temp/sum(hist_temp);

bar(edges, hist_percent,'FaceColor',[0.5 0.5 0.5],'LineStyle','none');
set(gca,'LineWidth',1.5,'FontSize',16,'FontWeight','bold','Box','off');
%set(gca,'XTick',0:0.075:0.225,'XTickLabel',{'1','2','3','4'},'TickLength',[.005 .005]);
set(gca,'XLim',[-0.3 2.5],'YLim',[0 0.4],'YTick',0:0.1:0.4)
%set(gca,'XTick',0:1:2,'TickLength',[.005 .005]);
%set(gca,'XLim',[-0.5 2.5],'YLim',[0 0.55],'YTick',0:0.1:0.5)
set(gcf,'Color','w')
set(gca,'layer','top')

% label x axis,y axis and title
xlabel('Distance(microns)');
ylabel('Percentage total particles');
title('Histogram Showing Percentage of Total Number of Particles at Varying Distances from Pgc');