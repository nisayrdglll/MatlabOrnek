
clear all
close all
 
net = googlenet;
analyzeNetwork(net)

I = imread("peppers.png");
inputSize = net.Layers(1).InputSize;
lgraph = layerGraph(net);

figure
plot(lgraph)
ylim([-5 16])

I = imresize(I,inputSize(1:2));

label = classify(net,I);
figure
imshow(I)
title(string(label))