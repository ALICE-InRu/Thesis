clear all,clc,close all
%%
x=-3:0.5:7;
y=funs(x,x,'sphere');
surfc(x,x,y)
axis([min(x) max(x) min(x) max(x) min(min(y)) max(max(y))])
xlabel('x_1'), ylabel('x_2'), zlabel('f(x_1,x_2)'),view(10,20);
saveas(gcf,'sphere','eps'), pause(2)
%%
y=funs(x,x,'nsphere');
surfc(x,x,y)
axis([min(x) max(x) min(x) max(x) min(min(y)) max(max(y))])
xlabel('x_1'), ylabel('x_2'), zlabel('f(x_1,x_2)'),view(10,20);
saveas(gcf,'nsphere','eps'), pause(2)
%%
x=-3:0.5:7;
y=funs(x,x,'ellipsoid');
surfc(x,x,y)
axis([min(x) max(x) min(x) max(x) min(min(y)) max(max(y))])
xlabel('x_1'), ylabel('x_2'), zlabel('f(x_1,x_2)'),view(10,20);
saveas(gcf,'ellipsoid','eps'), pause(2),
%%
x=-5:0.5:5;
y=funs(x,x,'rosen');
surfc(x,x,y)
axis([min(x) max(x) min(x) max(x) min(min(y)) max(max(y))])
xlabel('x_1'), ylabel('x_2'), zlabel('f(x_1,x_2)'),view(10,20);
saveas(gcf,'rosen','eps'), pause(2)
%%
x=-10:0.5:10;
y=funs(x,x,'schwefel');
surfc(x,x,y)
axis([min(x) max(x) min(x) max(x) min(min(y)) max(max(y))])
xlabel('x_1'), ylabel('x_2'), zlabel('f(x_1,x_2)'),view(10,20);
saveas(gcf,'schwefel','eps'), pause(2)
%%
x=1:0.5:30;
y=funs(x,x,'ackley');
surfc(x,x,y)
axis([min(x) max(x) min(x) max(x) min(min(y)) max(max(y))])
xlabel('x_1'), ylabel('x_2'), zlabel('f(x_1,x_2)'),view(10,20);
saveas(gcf,'ackley','eps'), pause(2)
%%
x=1:0.1:5;
y=funs(x,x,'rastrigin');
surfc(x,x,y)
axis([min(x) max(x) min(x) max(x) min(min(y)) max(max(y))])
xlabel('x_1'), ylabel('x_2'), zlabel('f(x_1,x_2)'),view(10,20);
saveas(gcf,'rastrigin','eps'), pause(2)






