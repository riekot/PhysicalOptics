function [ lambda_ml, c_normalized, fc_normalized, hasuu_normalized, omega_normalized, mu, epsi, eta ] = SetEMwaveParametersNormalizedByLambda( fc_real )
%SetEMwaveParametersNormalizedByLambda 電磁波の周波数を設定，周波数から波長λ・波数k・角速度ωを計算
%   λで規格化された値を計算することに注意！

% λを周波数から決定するための仮の周波数と高速を設定
c_real = 3*10^8;                  % 単位 [m/s]
lambda_ml = c_real./fc_real;      % 単位 [m/λ]: 1λは，lamdaメートル


% 以下の計算は全てlambdaで規格化して計算・設定する！
% 長さについては，全てλ×○倍という表記になることに注意！
c_normalized = 3*10^8./lambda_ml;      % 単位 [λ/s]: 1s当たり何λ進むか？
fc_normalized = c_normalized./1;       % 単位 [1/s]: 1s当たりに何回振動するか？
hasuu_normalized = 2*pi;               % 単位 [1/λ]: 1λ当たりの波数は2π
omega_normalized = 2.*pi.*fc_normalized; %.*lambda_ml; % 単位 [1/s]: 1s当たり何ラジアン進むか？


% 真空の透磁率μ，誘電率ε，自由空間の波動インピーダンスηを設定
mu = 4*pi*10^(-7);               % 単位 [H/m]
epsi = 1./( mu.*(c_real.^2) );
eta = (mu./epsi)^0.5;

end

