function [  ] = Main_CalcE( MON, BUN, SizeTable, RoughTable, fc_size )
%UNTITLED5 この関数の概要をここに記述
%   詳細説明をここに記述

EdetailDirName = 'ResultsD';
mkdir( EdetailDirName );

EDirName = 'Results';
mkdir( EDirName );

for i_monte = 1:MON
    for i_fc = 1:size(fc_size,1)
        for i_rough = 1:size(RoughTable,1)
            
            fc = fc_size(i_fc,1);
            Rms = RoughTable(i_rough, 1);
            Cor = RoughTable(i_rough, 2);
            Size = SizeTable(i_fc,1);
            
            srfcname = strcat('Surface0_h', num2str( Rms,'%0.1f'), '_l', num2str( Cor, '%0.1f'),...
                '_Size', num2str( Size, '%0.4f'), '_MON', num2str(i_monte), num2str('.mat') );
            spname = strcat( 'SimParams_fc', num2str( fc/10^9, '%0.3f'), '.mat' );
            
            %% load surface data and simulation paramters
            load(strcat('Surface/',srfcname));
            load(strcat('SimProf/',spname));
            
           
            for i_posi = 1:size(SrcLocTable,1)
                
                SrcLoc_xyz = SrcLocTable(i_posi,:).';
                ObsLoc_xyz = ObsLocTable(i_posi,:).';
                P = PTable(i_posi,:).';
                
%                 % 表面と波源・観測点の表示・確認
%                 figure;
%                 d = 1;
%                 surf(plate_location(1:d:end,1:d:end,1),plate_location(1:d:end,1:d:end,2),plate_location(1:d:end,1:d:end,3)); hold on;
%                 shading interp;
%                 quiver3( SrcLoc_xyz(1), SrcLoc_xyz(2), SrcLoc_xyz(3), P(1), P(2), P(3),10, 'ro'); hold on;
%                 quiver3( ObsLoc_xyz(1), ObsLoc_xyz(2), ObsLoc_xyz(3), 1, 1, 1,1/1000, 'bo');
%                 xlabel('X');
%                 ylabel('Y');
%                 zlabel('Z');
%                 ax = gca;
%                 xlim([-20 20])
%                 ylim([-20 20]);
%                 ax.XTick = [-20, -1*(double(N)*d_mesh_x/2), -1*(double(N)*d_mesh_x/4), 0, double(N)*d_mesh_x/4, double(N)*d_mesh_x/2, 20];
%                 ax.YTick = [-20, -1*(double(M)*d_mesh_x/2), -1*(double(M)*d_mesh_x/4), 0, double(M)*d_mesh_x/4, double(M)*d_mesh_x/2, 20];
%                 ax.XTickLabel = {};
%                 ax.YTickLabel = {};
%                 %View
%                 az = 180;
%                 el = 90;
%                 view(az, el);

                
                
                % Make common file name
                cfname = strcat( 'h', num2str( Rms,'%0.1f'), '_l', num2str( Cor, '%0.1f'),...
                    '_fc',num2str(fc/10^9, '%0.3f'), '_Size', num2str( Size, '%0.4f'), '_MON', num2str(i_monte),'_Posi', num2str(i_posi) );
                
                % Do calc
                E_xyz_lambda = Main_PO( cfname, BUN, plate_location, N, M, dS, lambda, ...
                    hasuu_normalized, Omega, Mu, Epsi, SrcLoc_xyz, ObsLoc_xyz, P, fc, Rms, Cor, Size,i_posi, i_monte).';
                
                % convert to V/λ to V/m
                E_xyz_m = E_xyz_lambda./lambda;
                
                % base conversion
                % 電界Eのベクトル変換(カーテシアン→(r, theta, phi)座標系)
                [az, el, r] = cart2sph( ObsLoc_xyz(1), ObsLoc_xyz(2), ObsLoc_xyz(3) );
                E_sph_m = baseconversion_cart2sph( az, pi-el, E_xyz_m(1), E_xyz_m(2), E_xyz_m(3) );
                
                %% save
                save(strcat('Results/E_', cfname, '.mat'), 'E_xyz_lambda', 'E_xyz_m','E_sph_m','-v7.3');
                
            end
        end
    end
end
end

