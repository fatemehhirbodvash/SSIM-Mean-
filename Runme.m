%4 Noisy images+downsampling
close all;
clear all;
clc
A = imread('mandrill.tif');
I=double(imread('mandrill.tif'));
H1=matrix_downsample(I,2);
a=double(A);
a=a(:);
BB=H1*a;
BB=reshape(BB,[256,256]);
BB=uint8(BB);
B=imnoise(BB, 'gaussian', 0,1*0.005);
C=imnoise(BB, 'gaussian', 0,1*0.005);
D=imnoise(BB, 'gaussian', 0,1*0.005);
E=imnoise(BB, 'gaussian', 0, 1*0.005);
%B1=imresize(double(B),[256,256],'bicubic');
%C1=imresize(double(C),[256,256],'bicubic');
%D1=imresize(double(D),[256,256],'bicubic');
%E1=imresize(double(E),[256,256],'bicubic');
B1=imresize(double(B),[512,512],'nearest');
C1=imresize(double(C),[512,512],'nearest');
D1=imresize(double(D),[512,512],'nearest');
E1=imresize(double(E),[512,512],'nearest');
B1=uint8(B1);
C1=uint8(C1);
D1=uint8(D1);
E1=uint8(E1);

K=[0.01 0.03];
window = fspecial('gaussian', 11, 1.5);
L=256;
num=4;
number_of_inputsimage=num;
Y=[B;C;D;E];
X1=(double(B1)+double(C1)+double(D1)+double(E1))/4;
arithmatic= uint8(X1);
X=arithmatic;
%X=B1;


lambda_1 = 0;
lambda_2 = 0.01;
lambda_3 = 1;
lambda_4 = 2.5;
lambda_5 = 3.8;
lambda_6 = 4.5;
Y1=opt0(X,Y,H1,lambda_1, K, window, L,number_of_inputsimage);
Y2=opt0(X,Y,H1,lambda_2, K, window, L,number_of_inputsimage);
Y3=opt0(X,Y,H1,lambda_3, K, window, L,number_of_inputsimage);
Y4=opt0(X,Y,H1,lambda_4, K, window, L,number_of_inputsimage); 
Y5=opt0(X,Y,H1,lambda_5, K, window, L,number_of_inputsimage);
Y6=opt0(X,Y,H1,lambda_6, K, window, L,number_of_inputsimage); 
figure;imshow(A,[]); title('Original');
figure;imshow(B1,[]); title('Noisy image B');
figure;imshow(C1,[]); title('Noisy image C');
figure;imshow(D1,[]); title('Noisy image D');
figure;imshow(E1,[]); title('Noisy image E');
figure;imshow(arithmatic,[]); title('Arithmatic')
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
ax6=imshow(arithmatic,[]);  title({
    ['Arithmatic' ] 
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




Difference_original_NoisyB=immse(A, B1);
Difference_original_NoisyC=immse(A, C1);
Difference_original_NoisyD=immse(A, D1);
Difference_original_NoisyE=immse(A,E1);
Difference_original_Arithmatic=immse(A,arithmatic);
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
psnr_original_Arithmatic=psnr(A,arithmatic);
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
ssim_original_Arithmatic=ssim(A,arithmatic);
ssim_original_resullt_lambda_1=ssim(A,Y1);
ssim_original_resullt_lambda_2=ssim(A,Y2);
ssim_original_resullt_lambda_3=ssim(A,Y3);
ssim_original_resullt_lambda_4=ssim(A,Y4);
ssim_original_resullt_lambda_5=ssim(A,Y5);
ssim_original_resullt_lambda_6=ssim(A,Y6);

LAMBDA=[0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,1.2,1.4,1.6,1.8,2,2.2,2.4,2.6,2.8,3,3.2,3.4,3.6,3.8,4,4.2,4.4,4.6,4.8,5,5.2,5.4,5.6,5.8];
valueopt = zeros(512,512,length(LAMBDA));
for M=1:length(LAMBDA)
    W=opt0(X,Y,H1,LAMBDA(M) ,K, window, L,num);
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