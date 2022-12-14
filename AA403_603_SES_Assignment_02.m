%% AA403/407 Space Engeineering system: Assignment 02

%% Code to create plots and finding orbital parameters
%Importing data from excel file, eliminating the NaN(9999.99) values and
%creating new excel file.

% P = readtable('data4.xlsx')
% P(P.X == 9999.99,:) = [];
% P(P.Y == 9999.99,:) = [];
% P(P.Z == 9999.99,:) = [];
% P(P.B == 9999.99,:) = [];
% P(P.BX == 9999.99,:) = [];
% P(P.BY == 9999.99,:) = [];
% P(P.BZ == 9999.99,:) = [];
% writetable(P,'data4_new.xlsx')

%loading new excel file and import data as .mat file. Load .mat file
%created and reading different variables.
load data4.mat
X = data4.X;
Y = data4.Y;
Z= data4.Z;
B=data4.B;
BX=data4.BX;
BY=data4.BY;
BZ=data4.BZ;
DOY=data4.DOY;

% Plotting B and its different component as time series
figure(1);
subplot(4,1,1),plot(DOY,B); ylabel('Scalar B, nT');xlim([0 370]);grid on; title('Scalar B, nT vs DOY'); hold on
subplot(4,1,2),plot(DOY,BX,'g');ylabel('BX, nT (GSE)');xlim([0 370]);grid on; title('BX, nT (GSE) vs DOY');
subplot(4,1,3),plot(DOY,BY,'c'); ylabel('BY, nT (GSE)');xlim([0 370]);grid on; title('BY, nT (GSE) vs DOY');
subplot(4,1,4),plot(DOY,BZ,'r');ylabel('BZ, nT (GSE)');xlim([0 370]) ; hold off; title('BZ, nT (GSE) vs DOY');
sgtitle('Time series plot of magnetic field and its various components');
xlabel('DOY');
grid on;

% Ploting orbit in various 2d planes and in 3d
figure(2);
subplot(2,2,1),plot(X,Y); hold on ;plot(235.44,0,'m*'); hold off;xlabel('X(target), GSE, Re');ylabel('Y(target), GSE, Re');grid on ; title('2d in XY plane');hold on
subplot(2,2,2),plot(Y,Z,'g');hold on ;plot(0,0,'m*'); hold off; xlabel('Y(target), GSE, Re');ylabel('Z(target), GSE, Re');grid on; title('2d in YZ plane');
subplot(2,2,3),plot(X,Z,'c');hold on ;plot(235.44,0,'m*'); hold off; xlabel('X(target), GSE, Re'); ylabel('Z(target), GSE, Re');grid on; title('2d in XZ plane');
subplot(2,2,4),plot3(X,Y,Z,'r'); hold on ;plot3(235.44,0,0,'m*'); hold off; xlabel('X(target), GSE, Re');ylabel('Y(target), GSE, Re'); zlabel('Z(target), GSE, Re') ; title('3d in XYZ plane'); hold off
sgtitle('2d and 3d plots of orbit in GSE coordinate');
grid on;

% Finding Major Orbital paramaters
R=sqrt((X-235.44).^2+Y.^2+Z.^2)';     %Spacecraft distance from Earth
 rp=min(R);     %Perigee distance
 ra=max(R);     %Apogee distance
 a=(rp+ra)/2;   % Semi major axis
 b=sqrt(ra*rp); % Semi minor axis
 e=(ra-rp)/(ra+rp);  %Eccentricity
 disp('Major orbital Parameters are:')
 fprintf('Perigee distance, rp = %f Re or %i km\n',rp,rp* 6371);
 fprintf('Apogee distance, ra = %f Re or %i km\n',ra,ra*6371);
 fprintf('Semi major axis, a = %f Re or %i km\n',a,a*6371);
 fprintf('Semi minor axis, b = %f Re or %i km\n',b,b*6371);
 fprintf('Eccentricity, e = %f\n',e);
disp((2*pi*(a*6371)^(3/2)/sqrt(4*10^14)))
%% Results
% Major orbital Parameters are:
% Perigee distance, rp = 22.549293 Re or 1.436615e+05 km
% Apogee distance, ra = 41.932171 Re or 2.671499e+05 km
% Semi major axis, a = 32.240732 Re or 2.054057e+05 km
% Semi minor axis, b = 30.749647 Re or 1.959060e+05 km
% Eccentricity, e = 0.300596