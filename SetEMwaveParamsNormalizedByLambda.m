function [ lambda, c_normalized, hasuu_normalized, Omega, Mu, Epsi, Eta ] = SetEMwaveParamsNormalizedByLambda( fc_real )
%SetEMwaveParametersNormalizedByLambda 電磁波の周波数を設定，周波数から波長λ・波数k・角速度ωを計算
%   λで規格化された値を計算することに注意！

% fc_real = (10.8:0.1:11.2).^9;
% 周波数から，波長・光速[λ]・角周波数を設定
c_real = 2.99792458*10^8;                  % 単位 [m/s]
lambda = c_real./fc_real;      % 単位 [m/λ]: 1λは，lamdaメートル
c_normalized = 3*10^8./lambda; % 単位 [λ/s]: 1s当たり何λ進むか？
Omega = 2*pi.*fc_real;            % 単位 [1/s] : 1s当たり何ラジアン進むか？

% lambdaで規格化した波数
hasuu_normalized = 2*pi;          % 単位 [1/λ]: 1λ当たりの波数は2π

% 真空の透磁率μ，誘電率ε，自由空間の波動インピーダンスηを設定
Mu = 4*pi*10^(-7);                % 単位 [H/m]
Epsi = 1/( Mu*(c_real^2) );       % 単位 [F/m]
Eta = (Mu/Epsi)^0.5;              % 単位 [Ω]

% Mu = 4*pi*10^(-7)./lambda;                % 単位 [H/λ]
% Epsi = (1./( Mu.*(c_real^2) )).*lambda.^3;      % 単位 [F/λ]
% Eta = sqrt(Mu./Epsi);              % 単位 [Ω]

% Omega = hasuu_normalized*Eta/Mu;            % 単位 [1/s] : 1s当たり何ラジアン進むか？
end

