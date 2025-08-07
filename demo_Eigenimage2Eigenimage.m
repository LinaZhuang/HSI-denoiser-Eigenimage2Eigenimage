%%  The code and data herein distributed reproduces the results published in
%  the paper 
%
%  Lina Zhuang, Michael K. Ng, Lianru Gao, Joseph Michalski, and Zhicheng Wang. 
% Eigenimage2Eigenimage (E2E):  A self-supervised deep learning network for 
% hyperspectral image denoising. 
% IEEE Transactions on Neural Networks and Learning Systems. 2023.
%  
%  URL: https://ieeexplore.ieee.org/document/10187207
%

%      
%!!!!!!!!!!!!!!!!!! Warning !!!!!!!!!!!!!!!!!!!!!!!!!!!!
%
% To run this demo, Matlab version should be R2022a or higher. 
% The "machine learning and deep learning" toolbox should be installed.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Author: Lina Zhuang, July 2025
% zhuangln@aircas.ac.cn



clc; clear; close all;
addpath('scripts');


load img_noisy;
load img_clean;
k_subspace = 10; % IMPORTANT: key parameter! Recommended to set within the range of 6 to 10.
path_onnx = "epoch_model_100_net2.onnx";

img_E2E  =  Eigenimage2Eigenimage(path_onnx,img_noisy,  k_subspace);

[MPSNR,PSNRV,MSSIM,SSIMV,MFSIM,FSIMV] = QuanAsse_psnr_ssim_fsim(img_clean,img_E2E);

figure;imagesc([img_clean(:,:,50),img_noisy(:,:,50),img_E2E(:,:,50)]);
title('Clean,  Noisy,   Denoised')

  

 
 
          



 
           

          
 

