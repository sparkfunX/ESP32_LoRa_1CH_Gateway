@set ARDUINO_SKETCHBOOK=C:\Users\jim.lindblom\Dropbox\SparkFun\Arduino
@set ESPTOOL=%ARDUINO_SKETCHBOOK%\hardware\espressif\esp32/tools/esptool.exe
@set COM_PORT=COM18

:flash_begin

@set /p DUMMY=Press ENTER to flash LoRa Test

%ESPTOOL% --chip esp32 --port %COM_PORT% --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0xe000 boot_app0.bin 0x1000 bootloader_qio_80m.bin 0x10000 ESP32_Lora_Send_sketch.ino.bin 0x8000 ESP32_Lora_Send_sketch.ino.partitions.bin

@set /p DUMMY=Press ENTER to flash BLANK

%ESPTOOL% --chip esp32 --port %COM_PORT% --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0xe000 boot_app0.bin 0x1000 bootloader_qio_80m.bin 0x10000 esp32_blank.ino.bin 0x8000 esp32_blank.ino.partitions.bin 

goto flash_begin