function [ lambda_ml, c_normalized, fc_normalized, hasuu_normalized, omega_normalized, mu, epsi, eta ] = SetEMwaveParametersNormalizedByLambda( fc_real )
%SetEMwaveParametersNormalizedByLambda �d���g�̎��g����ݒ�C���g������g���ɁE�g��k�E�p���x�ւ��v�Z
%   �ɂŋK�i�����ꂽ�l���v�Z���邱�Ƃɒ��ӁI

% �ɂ����g�����猈�肷�邽�߂̉��̎��g���ƍ�����ݒ�
c_real = 3*10^8;                  % �P�� [m/s]
lambda_ml = c_real./fc_real;      % �P�� [m/��]: 1�ɂ́Clamda���[�g��


% �ȉ��̌v�Z�͑S��lambda�ŋK�i�����Čv�Z�E�ݒ肷��I
% �����ɂ��ẮC�S�ăɁ~���{�Ƃ����\�L�ɂȂ邱�Ƃɒ��ӁI
c_normalized = 3*10^8./lambda_ml;      % �P�� [��/s]: 1s�����艽�ɐi�ނ��H
fc_normalized = c_normalized./1;       % �P�� [1/s]: 1s������ɉ���U�����邩�H
hasuu_normalized = 2*pi;               % �P�� [1/��]: 1�ɓ�����̔g����2��
omega_normalized = 2.*pi.*fc_normalized; %.*lambda_ml; % �P�� [1/s]: 1s�����艽���W�A���i�ނ��H


% �^��̓������ʁC�U�d���ÁC���R��Ԃ̔g���C���s�[�_���X�ł�ݒ�
mu = 4*pi*10^(-7);               % �P�� [H/m]
epsi = 1./( mu.*(c_real.^2) );
eta = (mu./epsi)^0.5;

end

