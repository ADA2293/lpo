%receiver - simulates the SDR receiver

%Copying the TX parameters, just in case...
%Parameters----------------------------------------------------------------
%See sdrSettingsSave for a complete list of the used parameters.
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%Demodulation
%--------------------------------------------------------------------------
[rxSig, theta]= demodulator(corruptSig, Fc, Fs);%, bpf);

%--------------------------------------------------------------------------
%Matched Filtering
%--------------------------------------------------------------------------
rSymbols = matchedFiltering(rxSig, psFilter);

%--------------------------------------------------------------------------
%Symbol Timing Synchronization
%--------------------------------------------------------------------------
[synchSymbols, allignOffset] = symbolSynch(rSymbols, oversample,...
                                           codeLength + synchWordLength,...
                                           2*f.nt, synchAlg);

%--------------------------------------------------------------------------
%Frame Synchronization
%--------------------------------------------------------------------------
[symbols, delay] = slidingCorrelator(synchSymbols, codeLength);

%--------------------------------------------------------------------------
%Demapping
%--------------------------------------------------------------------------
bits = demapper(symbols, modSchm, M);

%--------------------------------------------------------------------------
%Decoder
%--------------------------------------------------------------------------
rxBits = decoder(bits, codingAlgorithm, codingParams, mLength);

%--------------------------------------------------------------------------
%Sink
%--------------------------------------------------------------------------
sink_msg = sink(rxBits, srcType);