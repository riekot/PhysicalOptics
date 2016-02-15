function [ lambda, c_normalized, hasuu_normalized, Omega, Mu, Epsi, Eta ] = SetEMwaveParamsNormalizedByLambda( fc_real )
%SetEMwaveParametersNormalizedByLambda �d���g�̎��g����ݒ�C���g������g���ɁE�g��k�E�p���x�ւ��v�Z
%   �ɂŋK�i�����ꂽ�l���v�Z���邱�Ƃɒ��ӁI

% fc_real = (10.8:0.1:11.2).^9;
% ���g������C�g���E����[��]�E�p���g����ݒ�
c_real = 2.99792458*10^8;                  % �P�� [m/s]
lambda = c_real./fc_real;      % �P�� [m/��]: 1�ɂ́Clamda���[�g��
c_normalized = 3*10^8./lambda; % �P�� [��/s]: 1s�����艽�ɐi�ނ��H
Omega = 2*pi.*fc_real;            % �P�� [1/s] : 1s�����艽���W�A���i�ނ��H

% lambda�ŋK�i�������g��
hasuu_normalized = 2*pi;          % �P�� [1/��]: 1�ɓ�����̔g����2��

% �^��̓������ʁC�U�d���ÁC���R��Ԃ̔g���C���s�[�_���X�ł�ݒ�
Mu = 4*pi*10^(-7);                % �P�� [H/m]
Epsi = 1/( Mu*(c_real^2) );       % �P�� [F/m]
Eta = (Mu/Epsi)^0.5;              % �P�� [��]

% Mu = 4*pi*10^(-7)./lambda;                % �P�� [H/��]
% Epsi = (1./( Mu.*(c_real^2) )).*lambda.^3;      % �P�� [F/��]
% Eta = sqrt(Mu./Epsi);              % �P�� [��]

% Omega = hasuu_normalized*Eta/Mu;            % �P�� [1/s] : 1s�����艽���W�A���i�ނ��H
end

