% PO_terminal_20160104

clearvars;
 
%% ------------------ Simulation Parameters ------------------ %%
% 周波?狽ﾆ散?体の大きさを?ﾝ定([Hz],[m])
fc_setting = ((10.8:0.005:11.2).*10^9).'; %[Hz]
WaveLength = 3.*10^8./(fc_setting); %[m]

% 散?体の大きさをm単位で?ﾝ定
x_size_m = 20; %[m]
y_size_m = 20; %[m]

x_size_lambdatable = x_size_m./WaveLength; %[λ]
y_size_lambdatable = y_size_m./WaveLength; %[λ]

% 周波?狽ﾆ散?体のサイズの対応表
fc_size = horzcat(fc_setting, x_size_lambdatable);


%% Make and Save Scatter Surface

% 散?体のパラ?タ?ﾝ定 (λで?ﾝ定)
% Size of the Scatter (for x,y :unit[λ])(円形:PlateShape=1の時は?Cx=yにすること)
x_size_table = x_size_lambdatable;
y_size_table = y_size_lambdatable;
SizeTable = horzcat(x_size_table, y_size_table);

% Roughness Combination of the Scatter ( [RMS height,Correlation], unit[λ] )
RoughTable = [1, 5];

% モンテカル?の回??
MON = 1;
% Shape of the Plate (0:Rectangle, 1:Circle)
PlateShape = 0;

% Make Surface according to paramters
[ fname, SrfcDirName ] = Main_MakeSurface( PlateShape,MON,RoughTable,SizeTable );

%% Creating and Saveing Simulation Parameters
fc_Params = fc_setting;
[ SrcLocTable, ObsLocTable, PTable ] = SetSimParams( fc_Params );

%% Calculation
BUN = 1;
Main_CalcE( MON, BUN, SizeTable, RoughTable, fc_size );


%% Post Proceccing

SampleNum = length(fc_setting);
PosiNum = length(ObsLocTable);

% malloc
E1 = zeros(PosiNum,SampleNum,3);
E2 = zeros(PosiNum,SampleNum,3);

for i_posi = 1:PosiNum
    for i_load = 1:SampleNum
        load( strcat('Results/E_h0.0_l1.0_fc', num2str(fc_size(i_load,1)/10^9,'%0.3f'), '_Size', num2str(fc_size(i_load,2), '%0.4f'), '_MON1_Posi', num2str(i_posi),'.mat'));
        E1(i_posi,i_load,:) = E_xyz_m;
        E2(i_posi,i_load,:) = E_sph_m;
    end
end

%%
w = hann(SampleNum).';
SelCom1 = 1;
figure;
for i_posi = 1:PosiNum
ifftdata = ifft( w.*squeeze(E1(i_posi,:,SelCom1)), SampleNum);
% plot(20.*log10(abs(real(ifftdata))));
plot(20.*log10(abs(ifftdata)));
% plot(abs(ifftdata));
hold on;
xlim([0 SampleNum]);
ylabel('Ex [dB]');
% legend('2');
end

% SelCom2 = 2;
% figure;
% for i_posi = 1:PosiNum
% ifftdata = ifft(squeeze(E2(i_posi,:,SelCom2)), SampleNum);
% plot(20.*log10(abs(ifftdata)));
% % plot(abs(ifftdata));
% hold on;
% xlim([0 SampleNum]);
% ylabel('Etheta [dB]');
% % legend('2');
% end

% 周波?薄?ﾌ応答
for i_posi = 1:PosiNum
figure
stem(20.*log10(abs(E1(i_posi,:,SelCom1))));
% stem(abs(E1(i_posi,:,SelCom1)));
hold on;
xlim([0 SampleNum]);
ylabel('Ex [dB]');
% legend('2');
end

% 周波?薄?ﾌ応答
for i_posi = 1:PosiNum
figure
stem(20.*log10(abs(E2(i_posi,:,SelCom2))));
% stem(abs(E1(i_posi,:,SelCom1)));
hold on;
xlim([0 SampleNum]);
ylabel('Etheta [dB]');
% legend('2');
end