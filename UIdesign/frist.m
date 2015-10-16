
x=0:0.1:10;
y=sin(x);

h_f =figure('Position',[200 300 300 300],'menubar','none');
h_a1=axes('position',[0.1,0.1,0.8,0.8]);
h_t =title(h_a1,'ÕýÏÒÇúÏß');
h_I=line(x,y);
set(gca,'xtick',[0  pi/2  pi  3*pi/2  2*pi  5*pi/2  3*pi]);
set(gca,'xticklabel',['0',  'pi/2' , 'pi' , '3*pi/2' , '2*pi' , '5*pi/2' , '3*pi']);
set(gca,'xgrid','on','ygrid','on');
set(h_I,'linewidth',2);
set(get(h_t,'parent'),'color','y')
h_anno=annnotation(gcf,'rectangle',[0.1 0.5 0.8 0.4],'FaceAlpha',0.7,'FaceColor','red');

