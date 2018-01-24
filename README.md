dft of length 1632, 139, 839 etc.
===================

The following fft algorithms are involved.
  * Rader's fft of length 11, 13, 17, 19, 23, 139, 839.
  * Winograd fft of length 3.
  * Pease fft of length 2^n.
  * Gold-Thomas fft of length 69, 96, 138, 209, 418, 838, 1632.

The code of Pease fft are from https://www.cs.drexel.edu/tech-reports/DU-MCS-98-01.pdf 
and the rights are reversed by the original author.

Other codes follow the MIT license.
