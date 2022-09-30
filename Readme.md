# **OAK 相機模型轉換器 (OAK series camera transfer)**
## ( YOLO V3,V4 .weight to .blob )


這是一份關於如何轉換 YOLO V4,v3 架構至 OAK 相機可用的 .blob 檔自動化腳本。

This is a script about automatic transfer YOLO V3,V4 weight to .blob for OAK camera use.

## 使用前準備 Prework


本腳本使用 python3 及 windows 10 環境，
及 openvino_2021.4.752，執行前請先準備好。

Please prepare under requisites.

1. Windows 10
2. Python>=3.6 ( **recommend 3.7** )
3. pip
4. openvino == 2021.4.752 ( **must** )


## **Step 1**

編輯 Transfer.bat，

將 YOLO 權重、mo.py、setupvars.bat、compile_tool.exe 路徑改為你的：

Edit Transfer.bat,
replace YOLO weight, mo.py, setupvars.bat, compile_tool.exe Paths to yours.
(mo.py, setupvars.bat, compile_tool.exe all including in openvino.)

```bat
set weight = "Yours.weights"

set mo_Path = "Your_Path\mo.py"

set setup_Path = "Your_Path\setupvars.bat"

set compile_tool_Path = "Your_Path\compile_tool.exe"
```

## **Step 2**

執行 Transfer.bat，

得到轉換好的檔案在 ~/Model_Transfer/Model/output。

Run Transfer.bat, get transferred .blob under ~/Model_Transfer/Model/output.

## **Reference**

OpenVINO-YOLOV4-master directory all from here:

https://github.com/TNTWEN/OpenVINO-YOLOV4


## **Contact**

Further information please contact me.

wuyiulin@gmail.com




## murmur

Intel 官方指南根本是錯的：
https://docs.openvino.ai/latest/openvino_docs_MO_DG_prepare_model_convert_model_tf_specific_Convert_YOLO_From_Tensorflow.html

https://docs.openvino.ai/latest/openvino_docs_MO_DG_Deep_Learning_Model_Optimizer_DevGuide.html

這兩步根本不能用。