m=[3,1,2];
ball=[5 5;20 10;11 15];%球的坐标
r=[3,4,5];%半径
v= rand(3,2);%随机生成速度
disp(v)
dt=0.55;
figure
xlim([-5 45])
ylim([-5 35])
while true
    yes=[1,1,1];
    for i=1:3
        for j=1:3
            if yes(i)
                if i==j
                    if ball(j,1)<r(j) || ball(j,1)>=40-r(j)
                        v(j,1)=-v(j,1);
                    end
                    if ball(j,2)<r(j) || ball(j,2)>=30-r(j)
                        v(j,2)=-v(j,2);
                    end
                else
                    distance=sqrt((ball(i,1)-ball(j,1)).^2+(ball(i,2)-ball(j,2)).^2);
                    if distance<=(r(i)+r(j))
                        vix=((m(i)-m(j))*v(i,1)+2*m(j)*v(j,1))/(m(i)+m(j));
                        viy=((m(i)-m(j))*v(i,2)+2*m(j)*v(j,2))/(m(i)+m(j));
                        vjx=((m(j)-m(i))*v(j,1)+2*m(i)*v(i,1))/(m(i)+m(j));
                        vjy=((m(j)-m(i))*v(j,2)+2*m(i)*v(i,2))/(m(i)+m(j));
                        v(i,1)=vix;
                        v(i,2)=viy;
                        v(j,1)=vjx;
                        v(j,2)=vjy;
                        yes(j)=0;
                    end    
                end
            end
        end 
    end
    rectangle('Position',[0,0,40,30])
    for i=1:3
        ball(i,:)=ball(i,:)+v(i,:)*dt;
        rectangle('Position',[ball(i,1)-r(i),ball(i,2)-r(i),2*r(i),2*r(i)],'Curvature',[1,1],  'FaceColor','b')
    end
    drawnow
    cla
end