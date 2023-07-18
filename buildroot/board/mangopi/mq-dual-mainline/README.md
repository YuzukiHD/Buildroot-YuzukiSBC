## MangoPI MQ-Dual board (Allwinner T113-S3 chip)

### Direction for use
- Modify the `board/mangopi/mq-dual/rootfs/etc/wpa_supplicant.conf` file, Set the WiFi ssid and password
- Or use `vi /etc/wpa_supplicant.conf` on the board to set WiFi ssid and password, then run `/etc/init.d/S45wifi restart`
- After powering on the board, you can connect to the console through the analog serial port of the OTG typec port
- Or use the usb-ttl tool to connect `PE2` and `PE3` to the console
- Or connect rgb lcd display and keyboard for console interaction.

### Peripheral support
| **Peripheral** |               **Describe**               |
|----------------|------------------------------------------|
|   RTL8189FS    | Realtek WiFi modules                     |
|   USB Host     | 1 typec host                             |
|   USB OTG      | 1 typec otg                              |
|     UART       | uart1 to uart5                           |
| ~~MIPI DSI~~   | MIPI DSI Display interface               |
|   RGB LCD      | RGB Display interface                    |
|      I2C       | i2c0 to i2c3                             |
|    ~~CAN~~     | can0 with can1                           |
|      SPI       | spi1dev drivers(No test)                 |
|  Nor Flash     | spi0 nor flash(No test)                  |
|  Video Engine  | video codec(No test)                     |

### Build
```
# Using mangopi_mq_dual_defconfig
make mangopi_mq_dual_defconfig

# Start compiling the tf card image
make
```

### Reference
https://github.com/apritzel/u-boot<br>
https://github.com/szemzoa/awboot

