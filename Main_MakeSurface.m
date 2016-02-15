function [ fname, SrfcDirName ] = Main_MakeSurface( PlateShape,MON,RoughTable,SizeTable )
%UNTITLED ���̊֐��̊T�v�������ɋL�q
%   �ڍא����������ɋL�q


% -----------------�@�֐����ň����ɐݒ肵���l��ݒ肷��ꍇ --------------- %
% % MONTE CARLO Number
% MON = 1;
% % Size of the Scatter (for x,y :unit[��])(�~�`:PlateShape=1�̎��́Cx=y�ɂ��邱��)
% SizeTable = [10, 10];
% % Roughness Combination of the Scatter ( [RMS height,Correlation], unit[��] )
% RoughTable = [0, 1];
% % RoughTable = MakeRoughTable(0.1, 0.2, 0.1,  0.4, 0.5, 0.1); % �^����ꂽ�S�Ă̑g�ݍ��킹��RMS��CorrelationLength��RoughTable�����
% % Set Scatter Shape (0:Rectangle, 1:Circle)
% PlateShape = 0;
% ---------------------------------------------------------------------- %


%% Set Parameters
% Correlation Distribution of the Scatter (0:Gaussian, 1:Exponential)
ac_type = 0;
% Mesh Size of the Scatter (for x,y :unit[��])
d_mesh_x = 10;%1/10;
d_mesh_y = d_mesh_x;


% Make Sub Directory for Saving Files
SrfcDirName = 'Surface';
mkdir( SrfcDirName );

% name table
fnameTable = zeros(MON,size(SizeTable,1),size(RoughTable,1),1);

% Make Surface
for i_monte = 1:1:MON
    for i_size = 1:1:size(SizeTable,1)
        for i_rough = 1:1:size(RoughTable,1)
            
            % Set Params
            x_size = SizeTable(i_size,1);
            y_size = SizeTable(i_size,2);
            
            Rms = RoughTable(i_rough,1);
            Cor_x = RoughTable(i_rough,2);
            Cor_y = Cor_x;
            
            % Set File Name
            fname = strcat('_h', num2str( Rms,'%0.1f'), '_l', num2str( Cor_x, '%0.1f'),...
                '_Size', num2str(x_size, '%0.4f'), '_MON', num2str(i_monte), num2str('.mat') );

            % Calc and Save Surface
            CalcRoughRectSrfc( SrfcDirName, fname, PlateShape, ac_type, x_size, y_size, Rms, Cor_x, Cor_y, d_mesh_x, d_mesh_y);
        end
    end
end

end

