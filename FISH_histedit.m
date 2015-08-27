%This is an edited version of fish hist that allows you to specify name of
%the graph

function [hist_percent,hist_3binstoreturn] = FISH_histedit(neighbor_distances,edges,name1,name2)

hist_temp    = histc(neighbor_distances,edges);
hist_percent = hist_temp/sum(hist_temp);

%Added by Daniel to figure out percentages of first 3 bins
hist_percent3bins = hist_percent(1) + hist_percent(2) + hist_percent(3);
hist_3binspercentage = hist_percent3bins * 100;
hist_3binstoreturntemp = sprintf('%6.2f',hist_3binspercentage);
hist_3binstoreturn = strcat(hist_3binstoreturntemp,'%')

bar(edges, hist_percent,'FaceColor',[0.5 0.5 0.5],'LineStyle','none');
set(gca,'LineWidth',1.5,'FontSize',16,'FontWeight','bold','Box','off');
%set(gca,'XTick',0:0.075:0.225,'XTickLabel',{'1','2','3','4'},'TickLength',[.005 .005]);
set(gca,'XLim',[-0.3 2.5],'YLim',[0 0.4],'YTick',0:0.1:0.4)
%set(gca,'XTick',0:1:2,'TickLength',[.005 .005]);
%set(gca,'XLim',[-0.5 2.5],'YLim',[0 0.55],'YTick',0:0.1:0.5)
set(gcf,'Color','w')
set(gca,'layer','top')

% label x axis,y axis and title
% Also display percent colocalized on graph
Graphname = horzcat('Distance from ',name1,' to ',name2,'  ');

textongraph = horzcat(hist_3binstoreturn,' colocalized   ');

xlabel('Distance(microns)  ');
ylabel('Percentage of total particles  ');
title(Graphname);
text(1,0.25,textongraph,'FontSize',20,'FontWeight','bold');



