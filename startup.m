% ----------------------------------------------------------------------- %
% File name : startup.m
% Date      : Dec 01, 2014
% Created by: Rieko TSUJI
% Summary   : set font and etc..
% ----------------------------------------------------------------------- %





%% 作業フォルダに移動
% cd('C:\sach1o\MATLAB');
% 
%% 自分の作ったライブラリを全部追加（指定したディレクトリ以下を全部パスに追加）
addpath(genpath('C:\Users\RT\Dropbox\200_Research\PO_codes\PO\function'));

% %% diaryコマンドが作るファイルに拡張子を追加
% set(0, 'DiaryFile', 'diary.txt');


%% Figureウインドウ関係のデフォルト設定 

% scrsz = get(0, 'ScreenSize');    % スクリーンサイズの取得
% 
% % Figureウインドウの位置とサイズのデフォルト
% set(0, 'defaultFigurePosition', [200 scrsz(4)-620 480 360]);
% 
% % Figureの紙の大きさ
% set(0, 'defaultFigurePaperType', 'A4');
% 
% % Figureの寸法の単位
% set(0, 'defaultFigurePaperUnits', 'inches');
% 
% % 黒背景のものprintするときに色を変更するか？
% set(0, 'defaultFigureInvertHardcopy', 'on');
% 
% % 軸のボックスをonに
% set(0, 'defaultAxesBox', 'on');

%% 色関係
% % テキストカラー
% set(0, 'defaultTextColor', [1 0 0]);
% 
% % 各軸の色 (軸の目盛りのテキストも変更）
% set(0, 'defaultAxesXColor', [0 0 0]);
% set(0, 'defaultAxesYColor', [0 0 0]);
% set(0, 'defaultAxesZColor', [0 0 0]);
% 
% % パッチのエッジの色
% set(0, 'defaultPatchEdgeColor', [0 0 0]);
% 
% % Surfaceのエッジの色
% set(0, 'defaultSurfaceEdgeColor', [0 0 0]);
% 
% % 注釈オブジェクトの線の色　plot の色ではなくannotationの色　Figureウインドウで書ける線の色
% set(0, 'defaultLineColor', [1 0 0]);
% 
% % Figureウインドウの色
% %    この例では透明にしていますが、[1 1 1]なら白などカラーベクトルで指定できます。
% set(0, 'defaultFigureColor', 'none');
% 
% % 軸の色（プロットエリアの色）
% set(0, 'defaultAxesColor', [1 1 1]);
% 
% % plotなどで自動的に付けられる色の指定
% corder = [[1 0 0];[0 0.5000 0];[0 0 1];[1 0.7500 0.7500];[0.7500 0 0.7500];[0.7500 0.7500 0];[0.2500 0.2500 0.2500]];
% set(0, 'defaultAxesColorOrder', corder);
% 
% % デフォルトのカラーマップ
% cmap = spring(128);
% set(0, 'defaultFigureColormap', cmap);

%% フォント関係
% GUIのフォント
set(0, 'defaultUicontrolFontName', 'MS UI Gothic');
% 軸のフォント
set(0, 'defaultAxesFontName', 'Arial');
% タイトル、注釈などのフォント
set(0, 'defaultTextFontName', 'Times');

% GUIのフォントサイズ
set(0, 'defaultUicontrolFontSize', 4);

% 軸のフォントサイズ
set(0, 'defaultAxesFontSize', 5);

% タイトル、注釈などのフォントサイズ
set(0, 'defaultTextFontSize', 12);



%% Font setting

% Font size
% Axes/Text
set(0,'defaultAxesFontSize',10);
set(0,'defaultTextFontSize',10);
% Font name
% Axes/Text
set(0,'defaultAxesFontName','Helvetica');
set(0,'defaultTextFontName','Helvetica');


%% 日本語フォント
% Font size
% Axes/Text;
set(0,'defaultAxesFontSize',14);
set(0,'defaultTextFontSize',14);
% Font name
% Axes/Text
set(0,'defaultAxesFontName','小塚ゴシック Pro R');
set(0,'defaultTextFontName','小塚ゴシック Pro R');


%% Linewidth
% 軸の線の太さ
set(0, 'DefaultAxesLineWidth', 2);

% 注釈オブジェクトの線の太さ
set(0, 'DefaultLineLineWidth', 2);

%% KA_phi使用する時に，mu関数がらみのエラーを消すために，mu関数を含むFMINCON関数をmatlabパスから消す
 rmpath(genpath('C:\Program Files\MATLAB\R2015a\toolbox\robust\rctobsolete\mutools\commands'));