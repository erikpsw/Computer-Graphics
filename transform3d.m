v=[0 0 0;0 50 0;30 50 0;30 0 0;0 0 40;0 50 40;30 50 40;30 0 40];
f= [1 2 3 4;2 6 7 3;4 3 7 8;1 5 8 4;1 2 6 5;5 6 7 8];
patch('Faces',f,'Vertices',v,'FaceColor','y');
grid on
view(30,30)
xlim([0 200])
ylim([-100 200])
zlim([0 200])
v1=v;
v1(:,4)=1;
tran1=[1 0 0 0;0 1 0 0;0 0 1 0;50 50 50 1];
for i=1:8
    v1(i,:)=v1(i,:)*tran;
end
disp(v1)
for i=1:8
    for j=1:3
        v2(i,j)=v1(i,j);
    end
end
% disp(v2)
patch('Faces',f,'Vertices',v2,'FaceColor','r');
tran2=[1 0 0 0;0 1 0 0;0 0 1 0;50 50 50 1];
rotate=[1 0 0 0;0 0.5 0.866 0;0 -0.866 0.5 0;0 0 0 1];
for i=1:8
    v1(i,:)=v1(i,:)*tran2*rotate;
end
disp(v1)
for i=1:8
    for j=1:3
        v3(i,j)=v1(i,j);
    end
end
patch('Faces',f,'Vertices',v3,'FaceColor','b');