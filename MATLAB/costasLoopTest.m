%costasLoopTest - tests the Costas Loop algorithm implementation

clear
clc

L = 10000;
Fc = 433e6;
Fs = 4*Fc;
fLength = 11;           %Largura do pulso
nt = (fLength - 1)/2;   %Fator N_T do pulso

M = 10;
order = 64;
mu = 0.008;

%Gera a mensagem, símbolos, pulso e sinal no tempo:
bits = (randn(1, L) > 0.5);   %Mensagem de bits aleatórios
dados = 2*bits - 1;                 %Mapeamento para símbolos BPSK
pulso = rcosfir(0.25, nt, M, 1);  %Gera o pulso cosseno levantado

trainingSequence = load('mSequence.mat');
trainingSequence = trainingSequence.sequence;
%trainingSequence = double(trainingSequence > 0);
tLength = length(trainingSequence);

dados_up = upsample([trainingSequence dados],M); %Usa o oversampling pra dar upsample no símbolos
sinal = conv(dados_up, pulso);      %Convolui o pulso com os símbolos upsampleados
c = nt + L - 1/M;       %Limite superior do vetor de tempo do sinal
t2 = -nt:1/M:c;               %Vetor de tempo do sinal

j = sqrt(-1);

th = 1.4;
phaseOffset = exp(j*th);
t = 0:(length(sinal) - 1);
carrier = exp(j*2*pi*(Fc/Fs)*t)*phaseOffset;
modSig = real(carrier.*sinal);

	theta = costasLoop(modSig, Fc, Fs, order, mu)
	
	%plot(theta)
	%xlabel('Iteracoes')
	%ylabel('\Theta estimado')
	
	%theta_estimado = mean(theta(end-100:end))
