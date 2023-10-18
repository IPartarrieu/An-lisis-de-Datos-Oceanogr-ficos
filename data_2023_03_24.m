% % %% Presión
% % close all
% % figure()
% % plot(0:795,CH0Pressuredbar,'LineWidth',0.8)
% % xline(60:60:796)
% % xlim([0 795])
% % xlabel('24-03-2023 19:47:22 +x min')
% % ylabel('Pressure [dbar]')
% % grid minor
% % %
% % %% Clorofila A
% % close all
% % figure()
% % plot(0:795,CH1Chlorophyll_appb,'LineWidth',0.8)
% % xline(60:60:796)
% % xlim([0 795])
% % xlabel('24-03-2023 19:47:22 +x min')
% % ylabel('Chlorophyll-A [ppb]')
% % grid minor
% % %
% % %% Conductividad
% % close all
% % figure()
% % plot(0:795,CH2ConductivitymScm,'LineWidth',0.8)
% % xline(60:60:796)
% % xlim([0 795])
% % xlabel('24-03-2023 19:47:22 +x min')
% % ylabel('Conductivity [mS/cm]')
% % grid minor
% % %
% % %% Temperature
% % close all
% % figure()
% % plot(0:795,CH3TemperaturedegC,'LineWidth',0.8)
% % xline(60:60:796)
% % xlim([0 795])
% % xlabel('24-03-2023 19:47:22 +x min')
% % ylabel('Temperature [ºC]')
% % grid minor
% % %
% % %% Concentración de Oxígeno
% % close all
% % figure()
% % plot(0:795,CH4Oxygen_ConcentrationmgL,'LineWidth',0.8)
% % xline(60:60:796)
% % xlim([0 795])
% % xlabel('24-03-2023 19:47:22 +x min')
% % ylabel('Oxygen Concentration [mg/L]')
% % grid minor
% % %
% % %% Saturación de Oxígeno
% % close all
% % figure()
% % plot(0:795,CH5Oxygen_Saturation,'LineWidth',0.8)
% % xline(60:60:796)
% % xlim([0 795])
% % xlabel('24-03-2023 19:47:22 +x min')
% % ylabel('Oxygen Saturation [%]')
% % grid minor
% % %
% % %% Salinidad Práctica
% % close all
% % figure()
% % plot(0:795,CH6Practical_SalinityPSU,'LineWidth',0.8)
% % xline(60:60:796)
% % xlim([0 795])
% % xlabel('24-03-2023 19:47:22 +x min')
% % ylabel('Practical Salinity [PSU]')
% % grid minor
% % %
% % %% Velocidad del Sonido
% % close all
% % figure()
% % plot(0:795,CH7Sound_Velocityms,'LineWidth',0.8)
% % xline(60:60:796)
% % xlim([0 795])
% % xlabel('24-03-2023 19:47:22 +x min')
% % ylabel('Sound Velocity [m/s]')
% % grid minor
% % %
% % %% Conductividad a 25ºC
% % close all
% % figure()
% % plot(0:795,CH8Conductivity_25mScm,'LineWidth',0.8)
% % xline(60:60:796)
% % xlim([0 795])
% % xlabel('24-03-2023 19:47:22 +x min')
% % ylabel('Conductivity 25ºC [mS/cm]')
% % grid minor
% % %
% % %% Profundidad
% % close all
% % figure()
% % plot(0:795,CH9Depthm,'LineWidth',0.8)
% % xline(60:60:796)
% % xlim([0 795])
% % xlabel('24-03-2023 19:47:22 +x min')
% % ylabel('Depth [m]')
% % grid minor
% % %
%%
clear all
Tiempo = datetime('2023-03-24 19:47:22'):minutes(1):datetime('2023-03-25 09:02:22');
Tiempo = Tiempo';
%% Ploteamos todo junto para una mejor visualización
close all
figure()
subplot(5,2,1)
plot(Tiempo,CH0Pressuredbar,'LineWidth',0.8)
xline(Tiempo(60:60:796,1),'--k')
xlim([Tiempo(1) Tiempo(end)])
xlabel('Tiempo')
ylabel('Pressure [dbar]')
title('Presión')
grid minor
%
subplot(5,2,2)
plot(Tiempo,CH9Depthm,'LineWidth',0.8)
xline(Tiempo(60:60:796,1),'--k')
xlim([Tiempo(1) Tiempo(end)])
xlabel('Tiempo')
ylabel('Depth [m]')
title('Profundidad')
grid minor
%
subplot(5,2,3)
plot(Tiempo,CH2ConductivitymScm,'LineWidth',0.8)
xline(Tiempo(60:60:796,1),'--k')
xlim([Tiempo(1) Tiempo(end)])
xlabel('Tiempo')
ylabel('Conductivity [mS/cm]')
title('Conductividad')
grid minor
%
subplot(5,2,4)
plot(Tiempo,CH8Conductivity_25mScm,'LineWidth',0.8)
xline(Tiempo(60:60:796,1),'--k')
xlim([Tiempo(1) Tiempo(end)])
xlabel('Tiempo')
ylabel(sprintf('Conductivity 25ºC\n[mS/cm]'))
title('Conductividad a 25ºC')
grid minor
%
subplot(5,2,5)
plot(Tiempo,CH4Oxygen_ConcentrationmgL,'LineWidth',0.8)
xline(Tiempo(60:60:796,1),'--k')
xlim([Tiempo(1) Tiempo(end)])
xlabel('Tiempo')
ylabel(sprintf('Oxygen\nConcentration [mg/L]'))
title('Concentración de Oxígeno')
grid minor
%
subplot(5,2,6)
plot(Tiempo,CH5Oxygen_Saturation,'LineWidth',0.8)
xline(Tiempo(60:60:796,1),'--k')
xlim([Tiempo(1) Tiempo(end)])
xlabel('Tiempo')
ylabel('Oxygen Saturation [%]')
title('Saturación de Oxígeno')
grid minor
%
subplot(5,2,7)
plot(Tiempo,CH3TemperaturedegC,'LineWidth',0.8)
xline(Tiempo(60:60:796,1),'k--')
xlim([Tiempo(1) Tiempo(end)])
xlabel('Tiempo')
ylabel('Temperature [ºC]')
title('Temperatura')
grid minor
%
subplot(5,2,8)
plot(Tiempo,CH7Sound_Velocityms,'LineWidth',0.8)
xline(Tiempo(60:60:796,1),'--k')
xlim([Tiempo(1) Tiempo(end)])
xlabel('Tiempo')
ylabel(sprintf('Sound\nVelocity [m/s]'))
title('Velocidad del Sonido')
grid minor
%
subplot(5,2,9)
plot(Tiempo,CH6Practical_SalinityPSU,'LineWidth',0.8)
xline(Tiempo(60:60:796,1),'--k')
xlim([Tiempo(1) Tiempo(end)])
xlabel('Tiempo')
ylabel(sprintf('Practical\nSalinity [PSU]'))
title('Salinidad Práctica')
grid minor
%
subplot(5,2,10)
plot(Tiempo,CH1Chlorophyll_appb,'LineWidth',0.8)
xline(Tiempo(60:60:796,1),'--k')
xlim([Tiempo(1) Tiempo(end)])
xlabel('Tiempo')
ylabel('Chlorophyll-A [ppb]')
title('Clorofila-A')
grid minor
%
%% Hacemos una tabla de correlación
clear data data_ok
%
% Juntamos la data
CORTE=14;

% data(:,1) = CH0Pressuredbar(5:end,1);
% data(:,2) = CH9Depthm(5:end,1);
% data(:,3) = CH2ConductivitymScm(5:end,1);
% data(:,4) = CH8Conductivity_25mScm(5:end,1);
% data(:,5) = CH4Oxygen_ConcentrationmgL(5:end,1);
% data(:,6) = CH5Oxygen_Saturation(5:end,1);
% data(:,7) = CH3TemperaturedegC(5:end,1);
% data(:,8) = CH7Sound_Velocityms(5:end,1);
% data(:,9) = CH6Practical_SalinityPSU(5:end,1);
% data(:,10) = CH1Chlorophyll_appb(5:end,1);

data(:,1) = CH2ConductivitymScm(CORTE:end,1);
data(:,2) = CH8Conductivity_25mScm(CORTE:end,1);
data(:,3) = CH4Oxygen_ConcentrationmgL(CORTE:end,1);
data(:,4) = CH5Oxygen_Saturation(CORTE:end,1);
data(:,5) = CH3TemperaturedegC(CORTE:end,1);
data(:,6) = CH7Sound_Velocityms(CORTE:end,1);
data(:,7) = CH6Practical_SalinityPSU(CORTE:end,1);
data(:,8) = CH1Chlorophyll_appb(CORTE:end,1);

%
variables = {'Conductividad','Conductividad 25ºC',...
    'Concentración O2','Saturación O2','Temperatura','Vel. Sonido',...
    'Salinidad Pract.','Clorofila-A'};

% Vamos a normalizar la matriz de datos para poder trabajar de forma cómoda
for i=1:8
    data_ok(:,i)=(data(:,i)-mean(data(:,i)))./std(data(:,i));
end
time_ok = Tiempo(CORTE:end,1);

%%
[matrix_corr,matrix_p] = corrcoef(data);
% Correlación
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
% close all
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

%

% para simplificar, creamos vector de variables
%variables = {'Presión';'Profundidad';'Clorofila-A';'Conductividad';'Temperatura';...
%    'Concentarción de O2';'Saturación de O2';'Salinidad Práctica';'Velocidad del Sonido';'Conductividad 25ºC'};


%% Clusters
close all
clusters = 2; % define el número de clusters que deseo obtener
idx = kmeans(matrix_corr,clusters);

for i=1:clusters
    aux=find(idx==i);
    b=1;
    for a=1:length(aux)
        caca{b}=variables{aux(a)};
        b=b+1;
    end   
    caca
    clear caca
end

%
for i=1:clusters
    aux=find(idx==i);
    figure()    
    b=1;
    for a=1:length(aux)
        plot(Tiempo(CORTE:end,1),data_ok(:,aux(a)))
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
    xlim([Tiempo(CORTE) Tiempo(end)])
    title(['Cluster: ',num2str(i)])
end

%% Cluster 1
clear cluster_1
% data(:,1); 'Conductividad'
% data(:,2); 'Conductividad 25ºC'
% data(:,6); 'Velocidad del Sonido'
% data(:,7); 'Salinidad Pract.'
cluster_1(:,1)=data(:,1);
cluster_1(:,2)=data(:,2);
cluster_1(:,3)=data(:,6);
cluster_1(:,4)=data(:,7);

cls_1={'Conductividad','Conductividad a 25ºC','Velocidad del Sonido','Salinidad Práctica'};
cls_mag_1={'[mS/cm]','[mS/cm]','[m/s]','[PSU]'};

close all

for i=1:4
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

aux=serie_horaria(cluster_1(:,4),13);

aux_table=zeros(3,13);
for i=1:13
    aux_table(1,i)=round(mean(aux(:,i)),2);
    aux_table(2,i)=round(median(aux(:,i)),2);
    aux_table(3,i)=round(std(aux(:,i)),2);
end


%% Cluster 2
cluster_2(:,1:3)=data(:,3:5);
cluster_2(:,4)=data(:,8);

cls_2={'Concentración de O2','Saturación de O2','Temperatura','Clorofila-A'};
cls_mag_2={'[mg/L]','[%]','[ºC]','[ppb]'};

close all

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

