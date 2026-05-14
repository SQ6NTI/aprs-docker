# RTL-SDR Container

This container builds librtlsdr from source and runs rtl_tcp.

USB passthrough required:

    devices:
      - /dev/bus/usb:/dev/bus/usb

Default port: 1234
