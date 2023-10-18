function [data_hora]=serie_horaria(data,horas);
for i=1:horas
    data_hora(:,i)=data((60*(i-1))+1:(60*(i-1))+60,1);
end
end