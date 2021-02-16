Source:
  Ncverilog:
  $ source /usr/cadence/cshrc

  WaveView:
  $ source /usr/cad/synopsys/CIC/customexplorer.cshrc
  nWave:
  $ source /usr/spring_soft/CIC/verdi.cshrc

Simulation:
  $ ncverilog +access+r tb_sorting.v sorting.v lib.v
  $ ncverilog +access+r tb_sorting_pattern.v sorting.v lib.v

Waveform:
  WaveView:
  $ wv &

  nWave:
  $ nWave &