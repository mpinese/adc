import usb.core
import usb.util

# Find the I2S to USB FS bridge device
dev = usb.core.find(idVendor=0x1209, idProduct=0x9e87)

if dev == None:
    raise ValueError('I2S to USB FS bridge not found')

# Set the active configuration to the first config
dev.set_configuration()

# Send some control signals
dev.ctrl_transfer(0x40, 0x00, 0, 0, None)
dev.ctrl_transfer(0x40, 0x40, 0, 0, None)
dev.ctrl_transfer(0x40, 0x80, 0, 0, None)
dev.ctrl_transfer(0x40, 0xC0, 0, 0, None)

dev.ctrl_transfer(0x40, 0x40, 0, 0, None)
while True:
    raw_rx = dev.read(0x81, 64, 100)
    print(raw_rx)
