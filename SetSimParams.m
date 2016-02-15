function [ SrcLocTable, ObsLocTable, PTable  ] = SetSimParams( fc_Params )
%UNTITLED12 ���̊֐��̊T�v�������ɋL�q
%   Set Source and Observation Points

% Make Sub Directory for Saving Files
EMprofDirName = 'SimProf';
mkdir( EMprofDirName );

for i_fc = 1:size(fc_Params,1)
    % Set File Name for saving
    fname = strcat( '_fc', num2str(fc_Params(i_fc)/10^9, '%0.3f'), '.mat' );
    
    
    %% Set Parameters as a lambda normalization
    [ lambda, c_normalized, hasuu_normalized, Omega, Mu, Epsi, Eta ] =...
        SetEMwaveParamsNormalizedByLambda( fc_Params(i_fc) );
    
    %% Source and Obsavation Points Setting
    
    % �g����ݒ�(Input:Spherical Coordinate)
    SrcLocDist_setting = [1.58113883,  2.121320344,  2.915475947]./lambda; % [m]
    SrcLocTheta_setting = [18.43494882,45, 59.03624347]; % [degree]
    SrcLocPhi_setting = [0, 0, 0];
    
%     SrcLocDist_setting = [1.58113883, 1.802775638, 2.121320344, 2.5, 2.915475947,3.354101966, 3.807886553, 4.272001873, 4.74341649, 5.220153254]./lambda; % [m]
%     SrcLocTheta_setting = [18.43494882, 33.69006753, 45, 53.13010235, 59.03624347,63.43494882, 66.80140949, 69.44395478, 71.56505118, 73.30075577]; % [degree]
%     SrcLocPhi_setting = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    % ���K���˕������ϑ�����ݒ�
    ObsLocDist_setting = SrcLocDist_setting;
    ObsLocTheta_setting = SrcLocTheta_setting;
    ObsLocPhi_setting = SrcLocPhi_setting+180;
    % �g���̌���������
    SrcDirTheta_setting = SrcLocTheta_setting; % ��[degree]
    SrcDirPhi_setting = SrcLocPhi_setting; % ��[degree]
    SelPol = 0; % 0: ���s�Δg�`�b�N�C1:����Δg�`�b�N
    
    [ SrcLocTable, ObsLocTable, PTable ] = SetSrcObs( SrcLocDist_setting,SrcLocTheta_setting,SrcLocPhi_setting,...
        ObsLocDist_setting,ObsLocTheta_setting,ObsLocPhi_setting,SelPol,SrcDirTheta_setting,SrcDirPhi_setting  );
    
    %% Save EM parameters and Sorce/Observation Parameters
%     % Save separately
%     save( strcat( num2str(EMprofDirName),'/EMParams', fname),'lambda',...
%         'hasuu_normalized', 'Omega', 'Mu', 'Epsi', 'Eta', 'c_normalized','-v7.3');
%     save( strcat( num2str(EMprofDirName),'/SrcObsParams', fname), 'SrcLocTable', 'ObsLocTable', 'PTable', '-v7.3');
    
    % Save together
    save( strcat( num2str(EMprofDirName),'/SimParams', fname), 'lambda',...
        'hasuu_normalized', 'Omega', 'Mu', 'Epsi', 'Eta', 'c_normalized','SrcLocTable', 'ObsLocTable', 'PTable', '-v7.3');
end

end
