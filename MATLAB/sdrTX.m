%transmitter - this script simulates all the steps of the SDR transmitter.

%Parameters----------------------------------------------------------------
mLength = 10;         %Message length
srcType = 'random';     %Source type
srcFile = 'none';       %Message source path
modSchm = 'PSK';        %Modulation scheme
M = 2;                  %Number of levels for modulation scheme
energy = 1;             %Energy with which the symbols will be normalized
f = struct(...          %Pulse shaping filter parameters
    'type','Root-Raised-Cosine',... %Shape
    'sps', 15,...                   %Samples per symbol
    'T', 1,...                      %Symbol period
    'length', 8,...                 %Parameter used for filter length
    'r', 0.5);                      %Roll-off factor
psFilter = pulseShapingFilter(f);   %Pulse shaping filter
oversample = 20;        %Oversampling factor
synchAlg = 'Early-Late Gate';       %Symbol synch algorithm
Fc = 433e6;                         %Carrier frequency
Fs = 4*Fc;                          %Sample rate
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
%Message Generation
%--------------------------------------------------------------------------
msg = source(srcType, mLength, srcFile); %Message bits are generated


%--------------------------------------------------------------------------
%Frame Generation
%--------------------------------------------------------------------------
frame = framer(msg); %Includes training sequence as header

%--------------------------------------------------------------------------
%Bit-to-Symbol Mapping
%--------------------------------------------------------------------------
symbols = mapper(frame, modSchm, M, energy); %Maps bits to the symbols of
                                             %corresponding mod scheme.
                                             
%--------------------------------------------------------------------------
%Pulse Shaping
%--------------------------------------------------------------------------
%Shapes the symbols to the selected pulse shape:
pulses = pulseShaping(symbols, oversample, psFilter, f);

%--------------------------------------------------------------------------
%Modulation
%--------------------------------------------------------------------------
txSig = modulation(pulses, Fc, Fs, 1);