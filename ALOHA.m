for m=2:1:500                   %m��ʾ��ǩ��
    n=1000;                    %aloha�㷨,m��ʾm����ǩ��n��ʾÿ����ǩ���ʹ���
    A=rand(m,n);                %����һ��0-1�ֲ��ľ���
    A1=0.5*A;                  %����һ��0-0.5�ֲ��ľ��󣬼�������˱�ʱ�����0-0.5�ֲ�
    B=cumsum(A1,2);            %����B�Ƕ�A1ÿ����ӵõ��ģ���ʾ������͵�ʱ��
    T=B(1,n);                   %TΪ��ǩ������ʱ�䣬��Ϊ�۲�ʱ��
    C=1:1:(m*n);                %����һ������
    for i=1:m                   %������Bת��Ϊ��������ֵ������C
        for j=1:n
           C(1,(i-1)*n+j)=B(i,j);
        end
    end
    D=sort(C);                  %����������С�����˳���������ڼ��������ݰ�֮���ʱ���
    E=diff(D);                  %������΢�֣��������ݰ�֮���ʱ�������ж��Ƿ������ײ
    T0=0.001;                  %ÿ�����ݰ��Ŀ���
    N=0;                      %��ʼ��N�����ͳɹ������ݰ���
    M=0;                      %��ʼ��M���ܹ������ݰ�
    for i=1:(m*n-1)              %��ѭ�����ڼ���M��N
          if D(1,i)<=T           %ֻҪС�ڹ۲�ʱ��T�ͼ�1
                  M=M+1;
             if i==1&&E(1,1)>=T0  %����ʱ�����ϵĵ�1���͵�m*n�����ݰ�ֻ���ж�һ��ʱ��������Ҫ�ж�����
                  N=N+1;
             elseif i==(m*n-1)&&E(1,(m*n-1))>=T0
                  N=N+1;
             elseif i~=1&&i~=(m*n-1)&&E(1,i)>=T0&&E(1,i-1)>=T0
                  N=N+1;
             end
          else continue
         end
    end
  G=T0/T*M;                    %����õ���ƽ�����������ݰ�����������������������ݰ��Ŀ�����ͬ�Ҷ�ΪT0�� TΪ�۲�ʱ��
  S=T0/T*N;                    %����õ���������
  Q=S/G;                       %���ͳɹ���
  F=m/500;                     %��һ����ǩ�������ڹ۲����ǩ���ı仯�������ı仯���
  plot(G,S,'g*',G,Q,'b.',G,F,'ro');  %���G��S,Q,F��ͼ��
  hold on;                     %������ͬһ��ͼ��
end
 xlabel('ƽ�����������ݰ���G'); %����X��ı���
 title('ALOHA�㷨����');       %���ӱ���
 legend('������S','���ͳɹ���Q','��һ����ǩ��F');    %����ע��
 grid on;                      %��������   