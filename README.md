# Audio-Projects
This repository contains some personal projects of mine related to audio and DSP.

faust-effects: This folder contains Faust implementations of some gain, modulation and time-based effects; the idea is to try and incorporate some of these effects as unit generators as part of Arco, a signal processing server created by Dr. Roger Dannenberg. You can check out the Arco repository [here](https://github.com/rbdannenberg/arco).

wvd_fourierbessel: The signals under consideration in numerous engineering applications, including voice
 synthesis, analysis, radar, sonar, and telecommunications, are known to be nonstationary,
 meaning that their properties change over time. A typical method for power spectral density
 (PSD) estimate cannot be used for spectral analysis of these kinds of data. To cope with such
 signals, various techniques have been offered, including the time-frequency analysis
 technique [1].
 For time-frequency analysis, one of the first techniques was the short-time Fourier
 transform (STFT). A portion of the signal is removed by a moving window, and the local
 characteristics of the signal are obtained from the Fourier transform of this portion.
 Nonstationary signals are analysed using the spectrogram, which is the squared magnitude
 of the STFT.
 Another commonly used time-frequency distribution (TFD) is the Wigner–Ville distribution
 (WVD)
 ● TheWigner-Ville Distribution (WVD) is a mathematical tool used in signal processing
 to analyze non-stationary signals. It's named after Eugene Wigner and is a
 representation of a signal in the time-frequency domain. In essence, WVD provides a
 joint time-frequency representation of a signal, which means it shows how the
 frequency content of the signal changes over time. This is particularly useful for
 signals whose frequency components change over time, such as those encountered
 in communication systems, radar, sonar, and biomedical signal processing.
 ● Fourier-Bessel coefficients are coefficients used in expressing a function in terms of a
 series of orthogonal functions called Bessel functions. These coefficients play a role
 similar to the Fourier coefficients in expressing a function in terms of sine and cosine
 functions but for functions defined on a finite interval or a bounded domain,
 especially in cylindrical or spherical geometries.
 The research project aims to develop a novel method for decomposing digital signals into
 time-frequency representations using a combination of the Wigner-Ville Distribution (WVD)
 and Fourier-Bessel Coefficients (FBC)
