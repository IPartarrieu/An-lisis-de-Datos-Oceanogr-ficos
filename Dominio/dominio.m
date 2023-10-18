%% DOMINIO

clear all; close all; clc;

dom='magallanes.grd';
xLAT=ncread(dom,'lat');
xLON=ncread(dom,'lon');
clat=[min(xLAT) max(xLAT)];
clon=[min(xLON) max(xLON)];
ilat=xLAT>=clat(1) & xLAT<=clat(2);
ilon=xLON>=clon(1) & xLON<=clon(2);
Z=ncread(dom,'altitude',[ find((ilon),1,'first') find((ilat),1,'first')],[ sum(ilon) sum(ilat)],[1 1]);

figure()
subplot(1,2,1)
m_proj('equidistant cylindrical','lon',clon,'lat',clat);   % Projection
caxis([-3000 3000]);  
colormap([m_colmap('water',256);m_colmap('land',256)]);   % Colormap sizes chosen because...
hold on 
m_shadedrelief(xLON,xLAT,Z');
m_grid('box','fancy','grid','none','fontsize',14);

line1 = [-72.6169 -72.6169 -72.0170 -72.0170 -72.6169];
line2 = [-53.8571 -53.5253 -53.5253 -53.8571 -53.8571];
m_line(line1,line2,'color','r','linewidth',1.5);

xlabel('Longitud','fontsize',14)
ylabel('Latitud','FontSize',14)
title('Región de Magallanes','FontSize',14)




clear all

dom='bahias.grd';
xLAT=ncread(dom,'lat');
xLON=ncread(dom,'lon');
clat=[min(xLAT) max(xLAT)];
clon=[min(xLON) max(xLON)];
ilat=xLAT>=clat(1) & xLAT<=clat(2);
ilon=xLON>=clon(1) & xLON<=clon(2);
Z=ncread(dom,'altitude',[ find((ilon),1,'first') find((ilat),1,'first')],[ sum(ilon) sum(ilat)],[1 1]);

subplot(1,2,2)

m_proj('equidistant cylindrical','lon',clon,'lat',clat);   % Projection
caxis([-2990 3000]);  
colormap([m_colmap('water',256);m_colmap('land',256)]);   % Colormap sizes chosen because...
hold on 
m_shadedrelief(xLON,xLAT,Z');
m_grid('box','fancy','grid','none','fontsize',14);
c=colorbar;

m_line(-72.27275,-53.74512,'marker','pentagram','color',[0 0 0],'linest','none','markerfacecolor','r','markersize',10,'clip','point');
m_text(-72.27275-0.1,-53.74512+0.02,'Bahía Choiseul','vertical','top','Color','k','fontsize',10);

m_line(-72.29,-53.615,'marker','pentagram','color',[0 0 0],'linest','none','markerfacecolor','r','markersize',10,'clip','point');
m_text(-72.29-0.05,-53.62+0.03,'Bahía Mussel','vertical','top','Color','k','fontsize',10);

ylabel(c,'[m]','fontsize',14)
xlabel('Longitud','fontsize',14)
ylabel('Latitud','FontSize',14)
title('Bahías','FontSize',14)
% sgtitle('Dominio: Topografía y Batimetría','fontsize',20)

%%


% Definir los colores en RGB (rojo, verde, azul)
color1 = [1 0 0];    % Rojo
color2 = [0 1 0];    % Verde
color3 = [0 0 1];    % Azul

% Crear una matriz de colores personalizada
miPaleta = [color1; color2; color3];

% Establecer la nueva paleta de colores
colormap(miPaleta);

% Ejemplo de uso: generar una gráfica con la nueva paleta de colores
x = 1:10;
y = sin(x);
scatter(x, y, 50, y, 'filled');
