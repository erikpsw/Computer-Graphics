subplot(2,2,1);title('原始');
hold on
t = 0:0.05:10;                     
u=1;
r=1;
e=0;%用于交换变量
for i=1:10
    for j=u:u+20
    y(j)=r;
    end
    u=u+20;
    q=e;
    e=r;
    r=q;
end
plot(t,y)
subplot(2,2,2);title('振幅');
hold on
a = fft(y); 
for i=1:201
    b(i)=real(a(i));
    b(i)=abs(b(i));
end
plot(t,b)
subplot(2,2,3);title('相位');
hold on
for i=1:201
    c(i)=imag(a(i));
    c(i)=abs(c(i));
end
plot(t,c)
subplot(2,2,4);title('逆傅里叶变换(使用低通滤波)');
ylim=([0,1.5]);
hold on
for i=1:201
    disp(real(a(i)))
    if(abs(real(a(i)))>1)
        f(i)=0;
    else
        f(i)=abs(real(a(i)));
    end
end
disp(f)
d=ifft(f);
plot(t,d)
