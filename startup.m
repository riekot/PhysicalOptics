% ----------------------------------------------------------------------- %
% File name : startup.m
% Date      : Dec 01, 2014
% Created by: Rieko TSUJI
% Summary   : set font and etc..
% ----------------------------------------------------------------------- %





%% ��ƃt�H���_�Ɉړ�
% cd('C:\sach1o\MATLAB');
% 
%% �����̍�������C�u������S���ǉ��i�w�肵���f�B���N�g���ȉ���S���p�X�ɒǉ��j
addpath(genpath('C:\Users\RT\Dropbox\200_Research\PO_codes\PO\function'));

% %% diary�R�}���h�����t�@�C���Ɋg���q��ǉ�
% set(0, 'DiaryFile', 'diary.txt');


%% Figure�E�C���h�E�֌W�̃f�t�H���g�ݒ� 

% scrsz = get(0, 'ScreenSize');    % �X�N���[���T�C�Y�̎擾
% 
% % Figure�E�C���h�E�̈ʒu�ƃT�C�Y�̃f�t�H���g
% set(0, 'defaultFigurePosition', [200 scrsz(4)-620 480 360]);
% 
% % Figure�̎��̑傫��
% set(0, 'defaultFigurePaperType', 'A4');
% 
% % Figure�̐��@�̒P��
% set(0, 'defaultFigurePaperUnits', 'inches');
% 
% % ���w�i�̂���print����Ƃ��ɐF��ύX���邩�H
% set(0, 'defaultFigureInvertHardcopy', 'on');
% 
% % ���̃{�b�N�X��on��
% set(0, 'defaultAxesBox', 'on');

%% �F�֌W
% % �e�L�X�g�J���[
% set(0, 'defaultTextColor', [1 0 0]);
% 
% % �e���̐F (���̖ڐ���̃e�L�X�g���ύX�j
% set(0, 'defaultAxesXColor', [0 0 0]);
% set(0, 'defaultAxesYColor', [0 0 0]);
% set(0, 'defaultAxesZColor', [0 0 0]);
% 
% % �p�b�`�̃G�b�W�̐F
% set(0, 'defaultPatchEdgeColor', [0 0 0]);
% 
% % Surface�̃G�b�W�̐F
% set(0, 'defaultSurfaceEdgeColor', [0 0 0]);
% 
% % ���߃I�u�W�F�N�g�̐��̐F�@plot �̐F�ł͂Ȃ�annotation�̐F�@Figure�E�C���h�E�ŏ�������̐F
% set(0, 'defaultLineColor', [1 0 0]);
% 
% % Figure�E�C���h�E�̐F
% %    ���̗�ł͓����ɂ��Ă��܂����A[1 1 1]�Ȃ甒�ȂǃJ���[�x�N�g���Ŏw��ł��܂��B
% set(0, 'defaultFigureColor', 'none');
% 
% % ���̐F�i�v���b�g�G���A�̐F�j
% set(0, 'defaultAxesColor', [1 1 1]);
% 
% % plot�ȂǂŎ����I�ɕt������F�̎w��
% corder = [[1 0 0];[0 0.5000 0];[0 0 1];[1 0.7500 0.7500];[0.7500 0 0.7500];[0.7500 0.7500 0];[0.2500 0.2500 0.2500]];
% set(0, 'defaultAxesColorOrder', corder);
% 
% % �f�t�H���g�̃J���[�}�b�v
% cmap = spring(128);
% set(0, 'defaultFigureColormap', cmap);

%% �t�H���g�֌W
% GUI�̃t�H���g
set(0, 'defaultUicontrolFontName', 'MS UI Gothic');
% ���̃t�H���g
set(0, 'defaultAxesFontName', 'Arial');
% �^�C�g���A���߂Ȃǂ̃t�H���g
set(0, 'defaultTextFontName', 'Times');

% GUI�̃t�H���g�T�C�Y
set(0, 'defaultUicontrolFontSize', 4);

% ���̃t�H���g�T�C�Y
set(0, 'defaultAxesFontSize', 5);

% �^�C�g���A���߂Ȃǂ̃t�H���g�T�C�Y
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


%% ���{��t�H���g
% Font size
% Axes/Text;
set(0,'defaultAxesFontSize',14);
set(0,'defaultTextFontSize',14);
% Font name
% Axes/Text
set(0,'defaultAxesFontName','���˃S�V�b�N Pro R');
set(0,'defaultTextFontName','���˃S�V�b�N Pro R');


%% Linewidth
% ���̐��̑���
set(0, 'DefaultAxesLineWidth', 2);

% ���߃I�u�W�F�N�g�̐��̑���
set(0, 'DefaultLineLineWidth', 2);

%% KA_phi�g�p���鎞�ɁCmu�֐�����݂̃G���[���������߂ɁCmu�֐����܂�FMINCON�֐���matlab�p�X�������
 rmpath(genpath('C:\Program Files\MATLAB\R2015a\toolbox\robust\rctobsolete\mutools\commands'));