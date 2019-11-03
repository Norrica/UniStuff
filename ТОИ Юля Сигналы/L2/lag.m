function yy=lag(x,y,xx)
% ���������� ����������������� �������� � ����� ��������
% x - ������ ��������� �����
% y - ������ �������� ��������������� �������
% xx - ������ �������� ���������, ��� ������� ���� ��������� �������� ��������
% yy - ������ �������� �������� � ������ xx 

% ������ ����� ����� ������������ (N=n+1)
N=length(x);
% ������� ������� ������ �������� ����������������� ��������
yy=zeros(size(xx));
% � ����� ������� ����� �� �����
for k=1:N
    % ��������� ������������, �.�. ������� Psi_k
    t=ones(size(xx));
    for j=[1:k-1, k+1:N]
        t=t.*(xx-x(j))/(x(k)-x(j));
    end
    % ����������� �����
    yy = yy + y(k)*t;
end