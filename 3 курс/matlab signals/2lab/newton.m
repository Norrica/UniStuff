function y = newton(x, xS, yS)
N = length(xS);
% ��������� ����������� ��������
diff = yS;
for  k = 1 : N-1
    for i = 1: N - k
        diff(i) = (diff(i+1) - diff(i)) / (xS(i+k) - xS(i));
    end
end
% ��������� �������� ����������������� �������� � ������ xS
% � �������������� �������� ������������� ��������� .* 
% ��� ��������� ����� ���� �������� �������� yS
y = diff(1) * ones(size(x));
for k = 2 : N
    y = diff(k) + (x - xS(k)) .* y;
end