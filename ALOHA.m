for m=2:1:500                   %m表示标签数
    n=1000;                    %aloha算法,m表示m个标签，n表示每个标签发送次数
    A=rand(m,n);                %生成一个0-1分布的矩阵
    A1=0.5*A;                  %生成一个0-0.5分布的矩阵，假设随机退避时间服从0-0.5分布
    B=cumsum(A1,2);            %矩阵B是对A1每列相加得到的，表示随机发送的时间
    T=B(1,n);                   %T为标签均发送时间，即为观察时间
    C=1:1:(m*n);                %生成一个向量
    for i=1:m                   %将矩阵B转化为向量，赋值到向量C
        for j=1:n
           C(1,(i-1)*n+j)=B(i,j);
        end
    end
    D=sort(C);                  %将向量按从小到大的顺序排序，用于计算两数据包之间的时间差
    E=diff(D);                  %向量的微分，求两数据包之间的时间差，用于判断是否产生碰撞
    T0=0.001;                  %每个数据包的宽度
    N=0;                      %初始化N（发送成功的数据包）
    M=0;                      %初始化M，总共的数据包
    for i=1:(m*n-1)              %此循环用于计算M与N
          if D(1,i)<=T           %只要小于观察时间T就加1
                  M=M+1;
             if i==1&&E(1,1)>=T0  %对于时间轴上的第1个和第m*n个数据包只需判断一个时间差，其他需要判断两个
                  N=N+1;
             elseif i==(m*n-1)&&E(1,(m*n-1))>=T0
                  N=N+1;
             elseif i~=1&&i~=(m*n-1)&&E(1,i)>=T0&&E(1,i-1)>=T0
                  N=N+1;
             end
          else continue
         end
    end
  G=T0/T*M;                    %仿真得到的平均交换的数据包量，由于这里假设所有数据包的宽度相同且都为T0， T为观察时间
  S=T0/T*N;                    %仿真得到的吞吐量
  Q=S/G;                       %发送成功率
  F=m/500;                     %归一化标签数，便于观察随标签数的变化其他量的变化情况
  plot(G,S,'g*',G,Q,'b.',G,F,'ro');  %绘出G与S,Q,F的图像
  hold on;                     %保留在同一张图上
end
 xlabel('平均交换的数据包量G'); %添加X轴的标题
 title('ALOHA算法仿真');       %添加标题
 legend('吞吐量S','发送成功率Q','归一化标签数F');    %添加注释
 grid on;                      %添加网格   
