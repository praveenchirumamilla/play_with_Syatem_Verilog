debImport "-cunit" "-usevcs" "-sverilog" "dut.sv" "Assertions_Test.sv" \
          "verilog.dump"
verdiWindowWorkMode -win $_Verdi_1 -hardwareDebug
wvCreateWindow
wvResizeWindow -win $_nWave2 395 33 967 513
srcDeselectAll -win $_nTrace1
srcSelect -signal "clk" -win $_nTrace1
srcGotoLine -win $_nTrace1 2 -setActive
debExit
