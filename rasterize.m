v=[0 0 0 ;0 40 0;20 50 0;60 0 0;10 0 40;0 60 40;30 70 40;20 0 40];
f= [1 2 3 4;2 6 7 3;4 3 7 8;1 5 8 4;1 2 6 5;5 6 7 8];
tiledlayout(1,3);
ax1 = nexttile;
title('原始');
patch('Faces',f,'Vertices',v,'FaceColor','y');
hold on
xlim([0 100])
zlim([0 100])
xmin=min(v(:,1));
ymin=min(v(:,2));
zmin=min(v(:,3));
xmax=max(v(:,1));
ymax=max(v(:,2));
zmax=max(v(:,3));
a=[xmin xmax ymin ymax zmin zmax];
for i=1:2
    for j=3:4
        for k=5:6
            if(i==1)
                b=[a(1) a(2) ; a(j) a(j) ; a(k) a(k)];
                plot3(b(1,:),b(2,:),b(3,:))
                hold on
            else
                b=[a(2) a(1) ; a(j) a(j) ; a(k) a(k)];
                plot3(b(1,:),b(2,:),b(3,:))
                hold on
            end
            if(j==3)
                b=[a(i) a(i) ; a(3) a(4) ; a(k) a(k)];
                plot3(b(1,:),b(2,:),b(3,:))
                hold on
            else
                b=[a(i) a(i) ; a(4) a(3) ; a(k) a(k)];
                plot3(b(1,:),b(2,:),b(3,:))
                hold on
            end
             if(k==5)
                b=[a(i) a(i) ; a(j) a(j) ; a(5) a(6)];
                plot3(b(1,:),b(2,:),b(3,:))
                hold on
            else
                b=[a(i) a(i) ; a(j) a(j) ; a(6) a(5)];
                plot3(b(1,:),b(2,:),b(3,:))
                hold on
            end
        end
    end
end
view([1.5,1.5,1.5])
scatter3(100,100,100,'k','filled')
grid on

ax2 = nexttile;
title('移动后');
v(:,4)=1;
v1=v*[1 0 0 0;0 1 0 0;0 0 1 0;-100 -100 -100 1];
v1(:,4)=[];
patch('Faces',f,'Vertices',v1,'FaceColor','y');
grid on
hold on
scatter3(0,0,0,'k','filled')
xlim([-100 0])
view([1.5,1.5,1.5])
zlim([-100 0])

ax3=nexttile;
title('缩放后')
disp(v)
scale=[2/(xmax-xmin) 0 0 0;0 2/(ymax-ymin) 0 0;0 0 2/(zmax-zmin) 0;0 0 0 1];
v2=v*scale;
v2(:,4)=[];
disp(v2)
patch('Faces',f,'Vertices',v2,'FaceColor','y');
grid on
hold on
view([1.5,1.5,1.5])