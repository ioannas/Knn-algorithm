function retval=test2(chr,trainData,train_classes,testData,test_classes)

features = round(chr);
if length(unique(features))<length(features)
    retval=1000;
else   
    training = trainData(:,features);
    testing=testData(:,features);
    c = knnclassify(testing,training,train_classes);
    cp = classperf(c,test_classes);
    display(cp.CorrectRate);
    retval=1-cp.CorrectRate;
end