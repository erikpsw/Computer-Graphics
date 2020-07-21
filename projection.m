v1=[10 10 3;10 10 10;20 3 10;20 3 3];
f=[1,2,3,4];
d=5;
subplot(1,2,1)
patch('Faces',f,'Vertices',v1,'FaceColor','y');
hold on
view(20,20)
xlim([0 25])
ylim([0 15])
zlim([0 15])
v1(:,4)=1;
v2=zeros(4,4);
for i=1:4
    v2(i,:)=v1(i,:)*[0 0 0 0;0 d/v1(i,1) 0 0;0 0 d/v1(i,1) 0;d 0 0 1];
end
v2(:,4)=[];
patch('Faces',f,'Vertices',v2,'FaceColor','b');
o=[0,0,0];
v1(:,4)=[];
for i=1:4
    PTS = [v1(i,:); o];
    plot3(PTS(:,1),PTS(:,2),PTS(:,3))
end
grid on
subplot(1,2,2)
v2(:,1)=[];
disp(v2)
xlim([0 10])
ylim([0 10])
f2=[2,3,4,1];
patch('Faces',f2,'Vertices',v2,'FaceColor','r');