function []=corr_matrix(matriz);
len = length(matriz(1,:));
figure()
imagesc(matriz);
colorbar;
colormap('redbluecmap')
caxis([-1, 1]);
xline([0.5:1:len-0.5])
yline([0.5:1:len-0.5])
xlabel('Variables');
ylabel('Variables');
title('Matriz de Correlación')
end