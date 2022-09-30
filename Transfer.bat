set weight="Model/input/myModel.weights"

set JSON="Model/input/yolo_v4_tiny.json"

set mo_Path="E:\OAK_Data\OPENVINO\openvino_2021.4.752\deployment_tools\model_optimizer\mo.py"

set setup_Path="E:\OAK_Data\OPENVINO\openvino_2021.4.752\bin\setupvars.bat"

set compile_tool_Path="E:\OAK_Data\OPENVINO\openvino_2021.4.752\deployment_tools\tools\compile_tool\compile_tool.exe"

pip install tensorflow==1.15
python OpenVINO-YOLOV4-master/convert_weights_pb.py --class_names Model/input/myDataset.names --weights_file %weight% --data_format NHWC --output_graph  Model/input/myModel.pb --tiny
pip uninstall tensorflow -y
pip install tensorflow==2.4

python %mo_Path% --input_model Model/input/myModel.pb --output_dir Model/input/ --transformations_config %JSON% --reverse_input_channels --data_type FP16 --input_shape [1,416,416,3] 
                                                                                                                                         ::or --batch 1
start %setup_Path%

%compile_tool_Path% -m Model/input/myModel.xml -ip U8 -d MYRIAD -VPU_NUMBER_OF_SHAVES 6 -VPU_NUMBER_OF_CMX_SLICES 6 -o Model/output/myModel.blob
pause