Source:
  Ncverilog:
  $ source /usr/cadence/cshrc

  WaveView:
  $ source /usr/cad/synopsys/CIC/customexplorer.cshrc
  nWave:
  $ source /usr/spring_soft/CIC/verdi.cshrc

Simulation:
  $ ncverilog tb.v sqrt.v lib.v +access+r
  $ ncverilog tb.v sqrt.v lib.v +access+r +define+DEBUG

Waveform:
  WaveView:
  $ wv &

  nWave:
  $ nWave &