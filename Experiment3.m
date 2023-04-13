close all;
clear all;
clc
I= imread('cameraman.tif');
B1=max(min(1.2*I,255),0);
B=imnoise(B1, 'gaussian', 0,1*0.005);
C1=max(min(I+10,255),0);
C=imnoise(C1, 'gaussian', 0,1*0.005);
h = ones(10,10)/100;
D=min(max(imfilter(I,h) ,0),255);
F=imnoise(I,'salt & pepper');
E=imnoise(I, 'gaussian', 0,1*0.005);

K=[0.01 0.03];
window = fspecial('gaussian', 11, 1.5);
L=255;


Y=[B;C;D;F;E];
X=E;
lambda_1 = 0;
lambda_2 = 0.01;
lambda_3 = 1;
lambda_4 = 5;
lambda_5 = 7;
lambda_6 = 10;
Y1=opt(X,Y,lambda_1, K, window, L);
Y2=opt(X,Y,lambda_2, K, window, L);
Y3=opt(X,Y,lambda_3, K, window, L);
Y4=opt(X,Y,lambda_4, K, window, L); 
Y5=opt(X,Y,lambda_5, K, window, L);
Y6=opt(X,Y,lambda_6, K, window, L); 
figure;imshow(I,[]); title('Original');
figure;imshow(B,[]); title('image B');
figure;imshow(C,[]); title(' image C');
figure;imshow(D,[]); title('image D');
figure;imshow(E,[]); title(' image E');
figure;imshow(F,[]); title(' image F');
figure;imshow(X,[]); title('Arithmatic');
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
ax1=imshow(I,[]); title({
    ['Original' ] 
    }, 'FontSize', 6);
subplot(2,6,2);
ax2=imshow(B,[]);  title({
    ['Noisy image B' ] 
    }, 'FontSize', 6);
subplot(2,6,3);
ax3=imshow(C,[]);  title({
    ['(Noisy image c' ] 
    }, 'FontSize', 6);
subplot(2,6,4);
ax4=imshow(D,[]);  title({
    ['Noisy image D' ] 
    }, 'FontSize', 6);
subplot(2,6,5);
ax5=imshow(E,[]);  title({
    ['Noisy image E' ] 
    }, 'FontSize', 6);
subplot(2,6,6);
ax6=imshow(F,[]);  title({
    ['F' ] 
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




Difference_original_NoisyB=immse(I,B);
Difference_original_NoisyC=immse(I,C);
Difference_original_NoisyD=immse(I,D);
Difference_original_NoisyE=immse(I,E);
Difference_original_NoisyF=immse(I,F);
Difference_original_X=immse(I,X);
Difference_original_resullt_lambda1=immse(I,Y1);
Difference_original_resullt_lambda2=immse(I,Y2);
Difference_original_resullt_lambda3=immse(I,Y3);
Difference_original_resullt_lambda4=immse(I,Y4);
Difference_original_resullt_lambda5=immse(I,Y5);
Difference_original_resullt_lambda6=immse(I,Y6);


psnr_original_B=psnr(I,B);
psnr_original_C=psnr(I,C);
psnr_original_D=psnr(I,D);
psnr_original_E=psnr(I,E);
psnr_original_F=psnr(I,F);
psnr_original_resullt_lambda1=psnr(I,Y1);
psnr_original_resullt_lambda2=psnr(I,Y2);
psnr_original_resullt_lambda3=psnr(I,Y3);
psnr_original_resullt_lambda4=psnr(I,Y4);
psnr_original_resullt_lambda5=psnr(I,Y5);
psnr_original_resullt_lambda6=psnr(I,Y6);
ssim_original_B=ssim(I,B);
ssim_original_C=ssim(I,C);
ssim_original_D=ssim(I,D);
ssim_original_E=ssim(I,E);
ssim_original_F=ssim(I,F);
ssim_original_resullt_lambda1=ssim(I,Y1);
ssim_original_resullt_lambda2=ssim(I,Y2);
ssim_original_resullt_lambda3=ssim(I,Y3);
ssim_original_resullt_lambda4=ssim(I,Y4);
ssim_original_resullt_lambda5=ssim(I,Y5);
ssim_original_resullt_lambda6=ssim(I,Y6);
LAMBDA=[0, 0.001,0.1, 0.2,0.4,0.6,0.9,1,1.25,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7];
valueopt = zeros(512,512,length(LAMBDA));
for M=1:length(LAMBDA)
    W=opt(X,Y,LAMBDA(M) ,K, window, L);
    valueopt(:,:,M) = W;
end
for i=1:length(LAMBDA)
    PSNR(i)=psnr(I,uint8(valueopt(:,:,i)));
    SSIM(i)=ssim(I,uint8(valueopt(:,:,i)));
    MSE(i)=immse(I,uint8(valueopt(:,:,i)));
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
figure;
subplot(2,6,1);
g = gcf;
g.WindowState = 'maximized';
ax1=imshow(I,[]); title({
    ['Original' ] 
    }, 'FontSize', 6);
subplot(2,6,2);
ax2=imshow(B,[]);  title({
    ['Noisy image B' ] 
    }, 'FontSize', 6);
subplot(2,6,3);
ax3=imshow(C,[]);  title({
    ['(Noisy image c' ] 
    }, 'FontSize', 6);
subplot(2,6,4);
ax4=imshow(D,[]);  title({
    ['Noisy image D' ] 
    }, 'FontSize', 6);
subplot(2,6,5);
ax5=imshow(E,[]);  title({
    ['Noisy image E' ] 
    }, 'FontSize', 6);
subplot(2,6,6);
ax6=imshow(F,[]);  title({
    ['F' ] 
    }, 'FontSize', 6);

subplot(2,6,7);
ax7=imshow(Y1,[]);  title({ ['lambda = ', num2str(lambda_1)] }, 'FontSize', 6);

subplot(2,6,8);
ax9=imshow(Y2,[]);  title({ ['lambda = ', num2str(lambda_2)] }, 'FontSize', 6);

subplot(2,6,9);
ax7=imshow(uint8(valueopt(:,:,11)),[]);  title({ ['2 ', num2str(lambda_3)] }, 'FontSize', 6);

subplot(2,6,10);
ax10=imshow(uint8(valueopt(:,:,11)),[]);  title({ ['2.5= ', num2str(lambda_4)] }, 'FontSize', 6);

subplot(2,6,11);
ax11=imshow(uint8(valueopt(:,:,14)),[]);  title({ ['3.5 ', num2str(lambda_5)] }, 'FontSize', 6);

subplot(2,6,12);
ax12=imshow(Y4,[]);  title({ ['lambda = ', num2str(lambda_4)] }, 'FontSize', 6);