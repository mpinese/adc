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

# Get an endpoint instance
cfg = dev.get_active_configuration()
intf = cfg[(0, 0)]

ep_out = usb.util.find_descriptor(
    intf,
    # Match the first OUT endpoint
    custom_match=lambda e: usb.util.endpoint_direction(e.bEndpointAddress) == usb.util.ENDPOINT_OUT
)

ep_in = usb.util.find_descriptor(
    intf,
    # Match the first IN endpoint
    custom_match=lambda e: usb.util.endpoint_direction(e.bEndpointAddress) == usb.util.ENDPOINT_IN
)

assert ep_out is not None
assert ep_in is not None

while True:
    str_tx = input("TX: ")
    if str_tx == "exit":
        print("exiting...")
        break
    ep_out.write(str_tx + "\n")
    raw_rx = ep_in.read(len(str_tx) + 1, 1000)
    str_rx = str(raw_rx, "utf-8")
    print("RX: " + str_rx)
