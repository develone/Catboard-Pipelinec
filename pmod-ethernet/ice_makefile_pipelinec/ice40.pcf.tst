set_io -nowarn clk_100p0         C8 # 100MHz clock in default RP firmware

# RGB LED
set_io -nowarn ICE_39           A9 # LED_G active-low
set_io -nowarn ICE_40           B8 # LED_B active-low
set_io -nowarn ICE_41           B7 # LED_R active-low

# UART in default RP firmware
set_io -nowarn ICE_25           J1
set_io -nowarn ICE_27           K1

# PM2A
set_io -nowarn PM2-A4 B6 #PM2-A4 345
set_io -nowarn PM2-A3 B5 #PM2-A3 47
set_io -nowarn PM2-A2 A2 #PM2-A2 2
set_io -nowarn PM2-A1 A1 #PM2-A1 4

# PM2B
set_io -nowarn PM2-B4 A6 #PM2-B4 44
set_io -nowarn PM2-B3 A5 #PM2-B3 46
set_io -nowarn PM2-B2 B4 #PM2-B2 48
set_io -nowarn PM2-B1 A2 #PM2-B1 3

# PM3A
set_io -nowarn PM3-A4 B15 #PM3-A4 31
set_io -nowarn PM3-A3 B14 #PM3-A3 34
set_io -nowarn PM3-A2 B12 #PM3-A2 38
set_io -nowarn PM3-A1 A11 #PM3-A1 43

# PM3B
set_io -nowarn PM2-B4 A15 #PM3-B4 28 
set_io -nowarn PM3-B3 B13 #PM3-B3 32
set_io -nowarn PM3-B2 B11 #PM3-B2 36
set_io -nowarn PM3-B3 B10 #PM3-B1 42



