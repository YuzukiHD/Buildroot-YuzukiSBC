## MangoPI MQ-Quad board (Allwinner H616 chip)

### Direction for use
- Modify the `board/mangopi/mq-quad/rootfs/etc/wpa_supplicant/wpa_supplicant-wlan0.conf` file, Set the WiFi ssid and password
- Using `systemctrl start wpa_supplicant@wlan0` command to connect Wifi
- Using `systemctrl enable wpa_supplicant@wlan0` Automatic startup connection
- After powering on the board, you can connect to the console through the analog serial port of the OTG typec port
- Or connect HDMI and keyboard for console interaction.

### Peripheral support
| **Peripheral** |               **Describe**               |
|----------------|------------------------------------------|
|   RTL8723DS    | WiFi/BT                                  |
|   USB Host     | 1 typec host with2 usb host in misc port |
|   USB OTG      | 1 typec otg                              |
|   ethernet     | ethernet for mac1 with ephy in misc port |
|     UART       | uart1 with uart2                         |
|  Mini HDMI     | hdmi with audio                          |
|      I2C       | i2c1 with i2c2                           |
|  Nor Flash     | spi0 nor flash                           |
|      SPI       | spi1dev drivers                          |
|      GPU       | gpu(panforst)                            |

### Build
```
# Using mangopi_mq_quad_defconfig
make mangopi_mq_quad_defconfig

# Start compiling the tf card image
make
```

### Test method
- Bluetooth Test
```
bluetoothctl                # Open bluetooth console
[bluetooth]# power on       # Open bluetooth power
[bluetooth]# scan on        # Start scanning peripheral devices
[bluetooth]# devices        # Lists the scanned peripherals
[bluetooth]# exit           # Exit bluetooth console
```
- HDMI Audio test
```
# Configure HDMI audio
amixer -c 1 set 'I2S1 Src Select' 'APBIF_TXDIF0'
amixer -c 1 set 'I2S1OUT' on

# The -D hw:2,0 command must be run first, before you can use audio normally. (You only need to do this once per startup)
aplay test.wav -D hw:2,0

# Play music
aplay test.wav -D hw:1,0
```
- GPU Test
```
# Perform the following command on the terminal to start scoring (Insert the HDMI screen first)
glmark2-es2-drm

# Test images can be seen on HDMI while running
```

### Reference
https://github.com/open-cores/mangguo-h616-armbian
