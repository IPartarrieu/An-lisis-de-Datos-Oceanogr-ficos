clear all
time = datetime('2023-02-24 20:28:22'):minutes(1):datetime('2023-02-25 10:29:22');
time = time';
%% Ploteamos todo junto para una mejor visualización
% close all
figure()
subplot(5,2,1)
plot(time,CH0Pressuredbar,'LineWidth',0.8)
xline(time(60:60:end,1),'--k')
xlabel('Tiempo')
ylabel('Pressure [dbar]')
title('Presión')
xlim([time(1) time(end)])
grid minor
%
subplot(5,2,2)
plot(time,CH9Depthm,'LineWidth',0.8)
xline(time(60:60:end,1),'--k')
xlabel('Tiempo')
ylabel('Depth [m]')
title('Profundidad')
xlim([time(1) time(end)])
grid minor
%
subplot(5,2,3)
plot(time,CH4ConductivitymScm,'LineWidth',0.8)
xline(time(60:60:end,1),'--k')
xlabel('Tiempo')
ylabel('Conductivity [mS/cm]')
title('Conductividad')
xlim([time(1) time(end)])
grid minor
%
subplot(5,2,4)
plot(time,CH8Conductivity_25mScm,'LineWidth',0.8)
xline(time(60:60:end,1),'--k')
xlabel('Tiempo')
ylabel(sprintf('Conductivity 25ºC\n[mS/cm]'))
title('Conductividad a 25ºC')
xlim([time(1) time(end)])
grid minor
%
subplot(5,2,5)
plot(time,CH2Oxygen_ConcentrationmgL,'LineWidth',0.8)
xline(time(60:60:end,1),'--k')
xlabel('Tiempo')
ylabel(sprintf('Oxygen\nConcentration [mg/L]'))
title('Concentración de Oxígeno')
xlim([time(1) time(end)])
grid minor
%
subplot(5,2,6)
plot(time,CH3Oxygen_Saturation,'LineWidth',0.8)
xline(time(60:60:end,1),'--k')
xlabel('Tiempo')
ylabel('Oxygen Saturation [%]')
title('Saturación de Oxígeno')
xlim([time(1) time(end)])
grid minor
%
subplot(5,2,7)
plot(time,CH5TemperaturedegC,'LineWidth',0.8)
xline(time(60:60:end,1),'--k')
xlabel('Tiempo')
ylabel('Temperature [ºC]')
title('Temperatura')
xlim([time(1) time(end)])
grid minor
%
subplot(5,2,8)
plot(time,CH7Sound_Velocityms,'LineWidth',0.8)
xline(time(60:60:end,1),'--k')
xlabel('Tiempo')
ylabel(sprintf('Sound\nVelocity [m/s]'))
title('Velocidad del Sonido')
xlim([time(1) time(end)])
grid minor
%
subplot(5,2,9)
plot(time,CH6Practical_SalinityPSU,'LineWidth',0.8)
xline(time(60:60:end,1),'--k')
xlabel('Tiempo')
ylabel(sprintf('Practical\nSalinity [PSU]'))
title('Salinidad Práctica')
xlim([time(1) time(end)])
grid minor
%
subplot(5,2,10)
plot(time(5:end,1),CH1Chlorophyll_appb(5:end,1),'LineWidth',0.8)
xline(time(60:60:end,1),'--k')
xlabel('Tiempo')
ylabel('Chlorophyll-A [ppb]')
title('Clorofila-A')
xlim([time(1) time(end)])
grid minor
%
%%
variables = {'Presión','Profundidad','Conductividad','Conductividad 25ºC',...
    'Concentración O2','Saturación O2','Temperatura','Vel. Sonido',...
    'Salinidad Pract.','Clorofila-A'};

%% Hacemos una tabla de correlación
%
clear data data_ok
CORTE=33;

% Juntamos la data
% data(:,1) = CH0Pressuredbar(CORTE:end,1);
% data(:,2) = CH9Depthm(CORTE:end,1);
% data(:,3) = CH4ConductivitymScm(CORTE:end,1);
% data(:,4) = CH8Conductivity_25mScm(CORTE:end,1);
% data(:,5) = CH2Oxygen_ConcentrationmgL(CORTE:end,1);
% data(:,6) = CH3Oxygen_Saturation(CORTE:end,1);
% data(:,7) = CH5TemperaturedegC(CORTE:end,1);
% data(:,8) = CH7Sound_Velocityms(CORTE:end,1);
% data(:,9) = CH6Practical_SalinityPSU(CORTE:end,1);
% data(:,10) = CH1Chlorophyll_appb(CORTE:end,1);
data(:,1) = CH4ConductivitymScm(CORTE:end,1);
data(:,2) = CH8Conductivity_25mScm(CORTE:end,1);
data(:,3) = CH2Oxygen_ConcentrationmgL(CORTE:end,1);
data(:,4) = CH3Oxygen_Saturation(CORTE:end,1);
data(:,5) = CH5TemperaturedegC(CORTE:end,1);
data(:,6) = CH7Sound_Velocityms(CORTE:end,1);
data(:,7) = CH6Practical_SalinityPSU(CORTE:end,1);
data(:,8) = CH1Chlorophyll_appb(CORTE:end,1);

variables = {'Conductividad','Conductividad 25ºC',...
    'Concentración O2','Saturación O2','Temperatura','Vel. Sonido',...
    'Salinidad Pract.','Clorofila-A'};

%
% figure
% for i=1:8
%     subplot(4,2,i)
%     plot(time(CORTE:end,1),data(:,i))
%     title(variables{i})
% end



% Data anomalía estandarizada
for i=1:8
    data_ok(:,i)=(data(:,i)-mean(data(:,i)))./std(data(:,i));
end
time_ok = time(CORTE:end,1);
%

[matrix_corr,matrix_p] = corrcoef(data_ok);
%%
% close all
figure()
imagesc(matrix_corr);
colorbar;
colormap('redbluecmap')
caxis([-1, 1]);
xline([0.5:1:9.5])
yline([0.5:1:9.5])
xticks(1:size(matrix_corr, 2));
yticks(1:size(matrix_corr, 1));
xticklabels(variables);
yticklabels(variables);
xtickangle(45);
ytickangle(45);
title('Matriz de Correlación')
%%
figure()
imagesc(matrix_p);
colorbar;
caxis([0, 0.1]);
xline([0.5:1:9.5])
yline([0.5:1:9.5])
xticks(1:size(matrix_corr, 2));
yticks(1:size(matrix_corr, 1));
xticklabels(variables);
yticklabels(variables);
xtickangle(45);
ytickangle(45);
title('Matriz P-Value')
%%
clusters = 3; % define el número de clusters que deseo obtener
% for i=1:1000
%     idx(:,i) = kmeans(matrix_corr,clusters);
% end
% for i=1:10
%     idx_mode(i,1) = length(find(idx(i,:)==1));
%     idx_mode(i,2) = length(find(idx(i,:)==2));
%     idx_mode(i,3) = length(find(idx(i,:)==3));
% end
% 
% idx;
[idx,C] = kmeans(matrix_corr,clusters);
%
close all

for i=1:clusters
    aux=find(idx==i);
    figure()    
    b=1;
    for a=1:length(aux)
        plot(time(CORTE:end,1),data_ok(:,aux(a)))
        xlabel('Tiempo')
        hold on
        caca{b}=variables{aux(a)};
        b=b+1;
    end
    hold off
    legend(caca)
    caca
    clear caca
    grid minor
    yline(0,'--k')
    % xline(time(60:60:end,1),'--k')
    xlim([time(CORTE) time(end)])
    title(['Cluster: ',num2str(i)])
end
%% Cluster 1
clear cluster_1
% data(:,1); 'Conductividad'
% data(:,2); 'Conductividad 25ºC'
% data(:,7); 'Salinidad Pract.'
cluster_1(:,1)=data(:,1);
cluster_1(:,2)=data(:,2);
cluster_1(:,3)=data(:,7);

cls_1={'Conductividad','Conductividad a 25ºC','Salinidad Práctica'};
cls_mag_1={'[mS/cm]','[mS/cm]','[PSU]'};

for i=1:3
    figure
    subplot(2,1,1)
    plot(time_ok,cluster_1(:,i))
    xline(time_ok(1:60:length(time_ok),1),'k--')
    title(cls_1{i})
    xlabel('Tiempo')
    ylabel(cls_mag_1{i})
    grid minor
    subplot(2,1,2)
    aux=serie_horaria(cluster_1(:,i),13);
    boxplot(aux)
    title('Boxplot por hora')
    xlabel('Hora')
    ylabel(cls_mag_1{i})
    grid minor
end


% aux=serie_horaria(cluster_1(:,3),13);
% 
% aux_table=zeros(3,13);
% for i=1:13
%     aux_table(1,i)=round(mean(aux(:,i)),2);
%     aux_table(2,i)=round(median(aux(:,i)),2);
%     aux_table(3,i)=round(std(aux(:,i)),2);
% end


%% Cluster 2
cluster_2(:,1:4)=data(:,3:6);

cls_2={'Concentración de O2','Saturación de O2','Temperatura','Velocidad del Sonido'};
cls_mag_2={'[mg/L]','[%]','[ºC]','[m/s]'};

for i=1:4
    figure
    subplot(2,1,1)
    plot(time_ok,cluster_2(:,i))
    xline(time_ok(1:60:length(time_ok),1),'k--')
    title(cls_2{i})
    xlabel('Tiempo')
    ylabel(cls_mag_2{i})
    grid minor
    subplot(2,1,2)
    aux=serie_horaria(cluster_2(:,i),13);
    boxplot(aux)
    title('Boxplot por hora')
    xlabel('Hora')
    ylabel(cls_mag_2{i})
    grid minor
end

aux=serie_horaria(cluster_2(:,4),13);

aux_table=zeros(3,13);
for i=1:13
    aux_table(1,i)=round(mean(aux(:,i)),2);
    aux_table(2,i)=round(median(aux(:,i)),2);
    aux_table(3,i)=round(std(aux(:,i)),2);
end

%% Cluster 3
% data(:,8)
% [ppb]
figure
subplot(2,1,1)
plot(time_ok,data(:,8))
xline(time_ok(1:60:length(time_ok),1),'k--')
title('Clorofila-A')
xlabel('Tiempo')
ylabel('[ppb]')
grid minor
subplot(2,1,2)
aux=serie_horaria(data(:,8),13);
boxplot(aux)
title('Boxplot por hora')
xlabel('Hora')
ylabel('[ppb]')
grid minor

aux=serie_horaria(data(:,8),13);

aux_table=zeros(3,13);
for i=1:13
    aux_table(1,i)=round(mean(aux(:,i)),2);
    aux_table(2,i)=round(median(aux(:,i)),2);
    aux_table(3,i)=round(std(aux(:,i)),2);
end

