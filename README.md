# FW SWIR Video Engine
### New generation of video engine firmware based Xilinx KRIA K26 SoM.
Folder contains the firmware versions (fpga bin and linux dtbo files + json file for xrt).

![](https://www.xilinx.com/content/xilinx/en/products/som/kria/_jcr_content/root/parsystop/xilinxflexibleslab_c_113513440/xilinxflexibleslab-parsys/xilinxcolumns_2046427055/childParsys-1/xilinximage_copy.img.png/1694739643280.png "SoM k26")

## How to update

```
chmod +x update.sh 
sudo ./update.sh rp-swir-sdi-isp-v001a
```

# What's new in the latest version
## Version rp-swir-v010
### New:
1. Added option to set baud rate to lens 422
2. Added frame dimension control
### Bugs fixed:
1. Removed extra row in full rate mode
2. Fixed timing issues 
3. Channel 2 timing issue in PLL - one clock
### Notes:
1. Required software version 0.1.0 and higher 


## Version rp-swir-sdi-isp-v001a
### Bugs fixed:
1. Fixed issue set baud rate to main 422


## Version rp-swir-sdi-isp-v001
### New:
1. All new ... ⚡
### Bugs fixed:
1. New release without bugs and problems 🏆
### Notes:
1. The release works as expected
