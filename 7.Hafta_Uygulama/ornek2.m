
clear all
close all

load digitsNet

layers = net.Layers

digitDatasetPath = fullfile(toolboxdir("nnet"),"nndemos","nndatasets","DigitDataset");
imdsTest = imageDatastore(digitDatasetPath,"IncludeSubfolders",true);

YTest = classify(net,imdsTest);


numImages = 9;
idx = randperm(numel(imdsTest.Files),numImages);

figure
tiledlayout("flow")
for i = 1:numImages
    nexttile
    imshow(imdsTest.Files{idx(i)});
    title("Predicted Label: " + string(YTest(idx(i))))
end