close all;
clear all;
clc
A= imread('cameraman.tif');
I=double(imread('cameraman.tif'));
H1=matrix_downsample(I,2);
I=I(:);
I=H1*I;
I=reshape(I,[128,128]);
I=uint8(I);

B0=max(min(1.2*I,255),0);
B=imnoise(B0, 'gaussian', 0,1*0.005);
C0=max(min(I+10,255),0);
C=imnoise(C0, 'gaussian', 0,1*0.005);
h = ones(5,5)/25;
D=min(max(imfilter(I,h) ,0),255);
E=imnoise(I,'salt & pepper');
F=imnoise(I, 'gaussian', 0,1*0.005);


%B1=imresize(B,[256,256],'bicubic');
%C1=imresize(C,[256,256],'bicubic');
%D1=imresize(D,[256,256],'bicubic');
%E1=imresize(E,[256,256],'bicubic');
%F1=imresize(F,[256,256],'bicubic');
B1=imresize(B,[256,256],'nearest');
C1=imresize(C,[256,256],'nearest');
D1=imresize(D,[256,256],'nearest');
E1=imresize(E,[256,256],'nearest');
F1=imresize(F,[256,256],'nearest');
K=[0.01 0.03];
window = fspecial('gaussian', 11, 1.5);
L=255;


Y=[B;C;D;F;E];
X=C1;

lambda_1 = 0;
lambda_2 = 0.01;
lambda_3 = 1;
lambda_4 = 5.5;
lambda_5 = 7.5;
lambda_6 = 9.5;
Y1=opt0(X,Y,H1,lambda_1, K, window, L);
Y2=opt0(X,Y,H1,lambda_2, K, window, L);
Y3=opt0(X,Y,H1,lambda_3, K, window, L);
Y4=opt0(X,Y,H1,lambda_4, K, window, L); 
Y5=opt0(X,Y,H1,lambda_5, K, window, L);
Y6=opt0(X,Y,H1,lambda_6, K, window, L); 
figure;imshow(A,[]); title('Original');
figure;imshow(B1,[]); title('Noisy image B');
figure;imshow(C1,[]); title('Noisy image C');
figure;imshow(D1,[]); title('Noisy image D');
figure;imshow(E1,[]); title('Noisy image E');
figure;imshow(F1,[]); title('Noisy image F');
figure; imshow(Y1,[]);title(['lambda = ', num2str(lambda_1)]);
figure; imshow(Y2,[]);title(['lambda = ', num2str(lambda_2)]);
figure; imshow(Y3,[]);title(['lambda = ', num2str(lambda_3)]);
figure; imshow(Y4,[]);title(['lambda = ', num2str(lambda_4)]);
figure; imshow(Y5,[]);title(['lambda = ', num2str(lambda_5)]);
figure; imshow(Y6,[]);title(['lambda = ', num2str(lambda_6)]);
figure;
subplot(2,6,1);
g = gcf;
g.WindowState = 'maximized';
ax1=imshow(A,[]); title({
    ['Original' ] 
    }, 'FontSize', 6);
subplot(2,6,2);
ax2=imshow(B1,[]);  title({
    ['Noisy image B' ] 
    }, 'FontSize', 6);
subplot(2,6,3);
ax3=imshow(C1,[]);  title({
    ['(Noisy image c' ] 
    }, 'FontSize', 6);
subplot(2,6,4);
ax4=imshow(D1,[]);  title({
    ['Noisy image D' ] 
    }, 'FontSize', 6);
subplot(2,6,5);
ax5=imshow(E1,[]);  title({
    ['Noisy image E' ] 
    }, 'FontSize', 6);
subplot(2,6,6);
ax6=imshow(F1,[]);  title({
    ['NOISY IMAGE F' ] 
    }, 'FontSize', 6);

subplot(2,6,7);
ax7=imshow(Y1,[]);  title({ ['lambda = ', num2str(lambda_1)] }, 'FontSize', 6);

subplot(2,6,8);
ax9=imshow(Y2,[]);  title({ ['lambda = ', num2str(lambda_2)] }, 'FontSize', 6);

subplot(2,6,9);
ax7=imshow(Y3,[]);  title({ ['lambda = ', num2str(lambda_3)] }, 'FontSize', 6);

subplot(2,6,10);
ax10=imshow(Y4,[]);  title({ ['lambda = ', num2str(lambda_4)] }, 'FontSize', 6);

subplot(2,6,11);
ax11=imshow(Y5,[]);  title({ ['lambda = ', num2str(lambda_5)] }, 'FontSize', 6);

subplot(2,6,12);
ax12=imshow(Y6,[]);  title({ ['lambda = ', num2str(lambda_6)] }, 'FontSize', 6);


figure;
subplot(2,5,1);
g = gcf;
g.WindowState = 'maximized';
ax1=imshow(B,[]); title({
    ['B' ] 
    }, 'FontSize', 6);
subplot(2,5,2);
ax2=imshow(C,[]);  title({
    ['C' ] 
    }, 'FontSize', 6);
subplot(2,5,3);
ax3=imshow(D,[]);  title({
    ['(D' ] 
    }, 'FontSize', 6);
subplot(2,5,4);
ax4=imshow(E,[]);  title({
    ['E' ] 
    }, 'FontSize', 6);
subplot(2,5,5);
ax5=imshow(F,[]);  title({
    ['F' ] 
    }, 'FontSize', 6);
subplot(2,5,6);
ax6=imshow(B1,[]);  title({
    ['B1' ] 
    }, 'FontSize', 6);

subplot(2,5,7);
ax7=imshow(C1,[]);  title({ 'c1' }, 'FontSize', 6);

subplot(2,5,8);
ax9=imshow(D1,[]);  title({ D1 }, 'FontSize', 6);

subplot(2,5,9);
ax7=imshow(E1,[]);  title({ E1 }, 'FontSize', 6);

subplot(2,5,10);
ax10=imshow(F1,[]);  title({ F1 }, 'FontSize', 6);




Difference_original_NoisyB=immse(A, B1);
Difference_original_NoisyC=immse(A, C1);
Difference_original_NoisyD=immse(A, D1);
Difference_original_NoisyE=immse(A,E1);
Difference_original_NoisyF=immse(A,F1);
Difference_original_resullt_lambda_1=immse(A,Y1);
Difference_original_resullt_lambd_2=immse(A,Y2);
Difference_original_resullt_lambda_3=immse(A,Y3);
Difference_original_resullt_lambda_4=immse(A,Y4);
Difference_original_resullt_lambda_5=immse(A,Y5);
Difference_original_resullt_lambda_6=immse(A,Y6);
psnr_original_NoisyB=psnr(A,B1);
psnr_original_NoisyC=psnr(A,C1);
psnr_original_NoisyD=psnr(A,D1);
psnr_original_NoisyE=psnr(A,E1);
psnr_original_NoisyF=psnr(A,F1);
psnr_original_resullt_lambda_1=psnr(A,Y1);
psnr_original_resullt_lambda_2=psnr(A,Y2);
psnr_original_resullt_lambda_3=psnr(A,Y3);
psnr_original_resullt_lambda_4=psnr(A,Y4);
psnr_original_resullt_lambda_5=psnr(A,Y5);
psnr_original_resullt_lambda_6=psnr(A,Y6);
ssim_original_B=ssim(A,B1);
ssim_original_C=ssim(A,C1);
ssim_original_D=ssim(A,D1);
ssim_original_E=ssim(A,E1);
ssim_original_F=ssim(A,F1);
ssim_original_resullt_lambda_1=ssim(A,Y1);
ssim_original_resullt_lambda_2=ssim(A,Y2);
ssim_original_resullt_lambda_3=ssim(A,Y3);
ssim_original_resullt_lambda_4=ssim(A,Y4);
ssim_original_resullt_lambda_5=ssim(A,Y5);
ssim_original_resullt_lambda_6=ssim(A,Y6);

%LAMBDA=[0,0.2,0.4,0.6,0.8,1,1.2,1.4,1.6,1.8,2,2.2,2.4,2.6,2.8,3,3.2,3.4,3.6,3.8,4,4.2,4.4,4.6,4.8,5,5.2,5.4,5.6,5.8,6,6.2,6.4,6.6,6.8,7,7.2,7.4,7.6,7.8,8,8.2,8.4,8.6,8.8,9,9.2,9.4,9.6,9.8,10,10.25,10.5,10.75,11,11.25,11.75,12];
LAMBDA=[0,0.2,0.4,0.6,0.8,1,1.2,1.4,1.6,1.8,2,2.2,2.4,2.6,2.8,3,3.2,3.4,3.6,3.8,4,4.2,4.4,4.6,4.8,5,5.2,5.4,5.6,5.8,6,6.5,7,7.5,8,8.5,9,9.5,10,10.25,10.5,10.75,11,11.25,11.75,12,12.5,13,13.5,14,14.5,15];

valueopt = zeros(256,256,length(LAMBDA));
for M=1:length(LAMBDA)
    W=opt0(X,Y,H1,LAMBDA(M) ,K, window, L);
    valueopt(:,:,M) = W;
end
for i=1:length(LAMBDA)
    PSNR(i)=psnr(A,uint8(valueopt(:,:,i)));
    SSIM(i)=ssim(A,uint8(valueopt(:,:,i)));
    MSE(i)=immse(A,uint8(valueopt(:,:,i)));
end
figure
scatter(LAMBDA,PSNR,'filled','r')
xlabel('$$\lambda$$','interpreter','latex');
ylabel('$$\mathtt{PSNR}$$','interpreter','latex');


figure
scatter(LAMBDA,SSIM,'filled','r')
xlabel('$$\lambda$$','interpreter','latex');
ylabel('$$\mathtt{SSIM}$$','interpreter','latex');


figure
scatter(LAMBDA,MSE,'filled','r')
xlabel('$$\lambda$$','interpreter','latex');
ylabel('$$\mathtt{MSE}$$','interpreter','latex');