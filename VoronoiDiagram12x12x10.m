clear all
%Smallbox volume consider
% x -6 6
% y -6 6 
% z -5 5
% but in figure we are ploting 10x10x10 (-5.0 to 5.00 -5 to 5 and -5 to 5)
num=xlsread('DataParaviewGlass12x12x10');
x=num(:,2);
y=num(:,3);
z=num(:,4);
d2=[x y];
density=num(:,5);
color=num(:,6);
myColorMap = jet(18);
colormap(myColorMap);
[v,c]=voronoin(d2); 
for i = 1:length(c) 
%if all(c{i}~=1)   % If at least one of the indices is 1, 
                  % then it is an open region and we can't 
                  % patch that.
patch(v(c{i},1),v(c{i},2),myColorMap(color(i),:),'EdgeColor',myColorMap(color(i),:)); % use color i.
%end
end
%hold on
%voronoi(d2(:,1),d2(:,2))
xlim([-5 5]);
ylim([-5 5]);
 set(gca,'Box','on');

caxis([56 73]);
%colorbar('southoutside');