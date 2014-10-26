---
title: "Code Book"
author: "Jinson Xu"
date: "Friday, October 17, 2014"
---

###Data Preparation
1. Of the original 561 features, only those with mean() and std() in their names were selected, leaving us with 66 features.
2. Non-word characters within each feature name was replaced with "_"
3. SubjectID and ActivityID were added into the feature names for a total of 68 variables.
4. The appropriate columns were then subsetted and added for both training and testing data, obtaining a training set of 7352 observations and 68 variables, and a test set of 2947 observations with 68 variables.
5. ActivityID was replaced with Activity_Description by merging with the training and testing labels data on the activityID.
6. Feature names were then renamed to make them more readable for humans. 
* Std was replaced with StandardDeviation, Freq with Frequency, Acc with Acceleration, Mag with Magnitude, Gyro with Gyroscope.
* Feature names starting with t had the t replaced with time. Names starting with f had it replaced with frequency.
* "__" (an artifact from the replacement of non-word characters with "_" in step 2, were replaced with "For".
* All ending "_" were deleted as a final step to clean up the names.
7. Both test and training sets were then binded together to create a single dataset and assigned the cleaned column names, giving us a combined dataset with 10299 observations and 68 variables.
8. The tidy dataset was then created by aggregating on both subjectID and activityDescription to get the mean of all features for each subjectID and each activity. Tidy dataset has 180 observations with 68 variables.
9. Tidy dataset then had the feature names prepended with "AverageOf" to reflect the mean aggregation performed in the previous step.
10. Tidy dataset was then output to a tab delimited file.



###Data Dictionary
  Note: All feature variables (excluding subjectID and activityDescription) are the average of normalized recorded/derived values from the gyroscope or accelerometer for each subject doing different activities.

	$subjectID
			[,1]
	Min.     1.0
	1st Qu.  8.0
	Median  15.5
	Mean    15.5
	3rd Qu. 23.0
	Max.    30.0

	$AverageOfTimeBodyAccelerationMeanForX
			  [,1]
	Min.    0.2216
	1st Qu. 0.2712
	Median  0.2770
	Mean    0.2743
	3rd Qu. 0.2800
	Max.    0.3015

	$AverageOfTimeBodyAccelerationMeanForY
				 [,1]
	Min.    -0.040510
	1st Qu. -0.020020
	Median  -0.017260
	Mean    -0.017880
	3rd Qu. -0.014940
	Max.    -0.001308

	$AverageOfTimeBodyAccelerationMeanForZ
				[,1]
	Min.    -0.15250
	1st Qu. -0.11210
	Median  -0.10820
	Mean    -0.10920
	3rd Qu. -0.10440
	Max.    -0.07538

	$AverageOfTimeBodyAccelerationStandardDeviationForX
			   [,1]
	Min.    -0.9961
	1st Qu. -0.9799
	Median  -0.7526
	Mean    -0.5577
	3rd Qu. -0.1984
	Max.     0.6269

	$AverageOfTimeBodyAccelerationStandardDeviationForY
				[,1]
	Min.    -0.99020
	1st Qu. -0.94210
	Median  -0.50900
	Mean    -0.46050
	3rd Qu. -0.03077
	Max.     0.61690

	$AverageOfTimeBodyAccelerationStandardDeviationForZ
			   [,1]
	Min.    -0.9877
	1st Qu. -0.9498
	Median  -0.6518
	Mean    -0.5756
	3rd Qu. -0.2306
	Max.     0.6090

	$AverageOfTimeGravityAccelerationMeanForX
			   [,1]
	Min.    -0.6800
	1st Qu.  0.8376
	Median   0.9208
	Mean     0.6975
	3rd Qu.  0.9425
	Max.     0.9745

	$AverageOfTimeGravityAccelerationMeanForY
				[,1]
	Min.    -0.47990
	1st Qu. -0.23320
	Median  -0.12780
	Mean    -0.01621
	3rd Qu.  0.08773
	Max.     0.95660

	$AverageOfTimeGravityAccelerationMeanForZ
				[,1]
	Min.    -0.49510
	1st Qu. -0.11730
	Median   0.02384
	Mean     0.07413
	3rd Qu.  0.14950
	Max.     0.95790

	$AverageOfTimeGravityAccelerationStandardDeviationForX
			   [,1]
	Min.    -0.9968
	1st Qu. -0.9825
	Median  -0.9695
	Mean    -0.9638
	3rd Qu. -0.9509
	Max.    -0.8296

	$AverageOfTimeGravityAccelerationStandardDeviationForY
			   [,1]
	Min.    -0.9942
	1st Qu. -0.9711
	Median  -0.9590
	Mean    -0.9524
	3rd Qu. -0.9370
	Max.    -0.6436

	$AverageOfTimeGravityAccelerationStandardDeviationForZ
			   [,1]
	Min.    -0.9910
	1st Qu. -0.9605
	Median  -0.9450
	Mean    -0.9364
	3rd Qu. -0.9180
	Max.    -0.6102

	$AverageOfTimeBodyAccelerationJerkMeanForX
			   [,1]
	Min.    0.04269
	1st Qu. 0.07396
	Median  0.07640
	Mean    0.07947
	3rd Qu. 0.08330
	Max.    0.13020

	$AverageOfTimeBodyAccelerationJerkMeanForY
				  [,1]
	Min.    -0.0386900
	1st Qu.  0.0004664
	Median   0.0094700
	Mean     0.0075650
	3rd Qu.  0.0134000
	Max.     0.0568200

	$AverageOfTimeBodyAccelerationJerkMeanForZ
				 [,1]
	Min.    -0.067460
	1st Qu. -0.010600
	Median  -0.003861
	Mean    -0.004953
	3rd Qu.  0.001958
	Max.     0.038050

	$AverageOfTimeBodyAccelerationJerkStandardDeviationForX
			   [,1]
	Min.    -0.9946
	1st Qu. -0.9832
	Median  -0.8104
	Mean    -0.5949
	3rd Qu. -0.2233
	Max.     0.5443

	$AverageOfTimeBodyAccelerationJerkStandardDeviationForY
			   [,1]
	Min.    -0.9895
	1st Qu. -0.9724
	Median  -0.7756
	Mean    -0.5654
	3rd Qu. -0.1483
	Max.     0.3553

	$AverageOfTimeBodyAccelerationJerkStandardDeviationForZ
				[,1]
	Min.    -0.99330
	1st Qu. -0.98270
	Median  -0.88370
	Mean    -0.73600
	3rd Qu. -0.51210
	Max.     0.03102

	$AverageOfTimeBodyGyroscopeMeanForX
				[,1]
	Min.    -0.20580
	1st Qu. -0.04712
	Median  -0.02871
	Mean    -0.03244
	3rd Qu. -0.01676
	Max.     0.19270

	$AverageOfTimeBodyGyroscopeMeanForY
				[,1]
	Min.    -0.20420
	1st Qu. -0.08955
	Median  -0.07318
	Mean    -0.07426
	3rd Qu. -0.06113
	Max.     0.02747

	$AverageOfTimeBodyGyroscopeMeanForZ
				[,1]
	Min.    -0.07245
	1st Qu.  0.07475
	Median   0.08512
	Mean     0.08744
	3rd Qu.  0.10180
	Max.     0.17910

	$AverageOfTimeBodyGyroscopeStandardDeviationForX
			   [,1]
	Min.    -0.9943
	1st Qu. -0.9735
	Median  -0.7890
	Mean    -0.6916
	3rd Qu. -0.4414
	Max.     0.2677

	$AverageOfTimeBodyGyroscopeStandardDeviationForY
			   [,1]
	Min.    -0.9942
	1st Qu. -0.9629
	Median  -0.8017
	Mean    -0.6533
	3rd Qu. -0.4196
	Max.     0.4765

	$AverageOfTimeBodyGyroscopeStandardDeviationForZ
			   [,1]
	Min.    -0.9855
	1st Qu. -0.9609
	Median  -0.8010
	Mean    -0.6164
	3rd Qu. -0.3106
	Max.     0.5649

	$AverageOfTimeBodyGyroscopeJerkMeanForX
				[,1]
	Min.    -0.15720
	1st Qu. -0.10320
	Median  -0.09868
	Mean    -0.09606
	3rd Qu. -0.09110
	Max.    -0.02209

	$AverageOfTimeBodyGyroscopeJerkMeanForY
				[,1]
	Min.    -0.07681
	1st Qu. -0.04552
	Median  -0.04112
	Mean    -0.04269
	3rd Qu. -0.03842
	Max.    -0.01320

	$AverageOfTimeBodyGyroscopeJerkMeanForZ
				 [,1]
	Min.    -0.092500
	1st Qu. -0.061720
	Median  -0.053430
	Mean    -0.054800
	3rd Qu. -0.048980
	Max.    -0.006941

	$AverageOfTimeBodyGyroscopeJerkStandardDeviationForX
			   [,1]
	Min.    -0.9965
	1st Qu. -0.9800
	Median  -0.8396
	Mean    -0.7036
	3rd Qu. -0.4629
	Max.     0.1791

	$AverageOfTimeBodyGyroscopeJerkStandardDeviationForY
			   [,1]
	Min.    -0.9971
	1st Qu. -0.9832
	Median  -0.8942
	Mean    -0.7636
	3rd Qu. -0.5861
	Max.     0.2959

	$AverageOfTimeBodyGyroscopeJerkStandardDeviationForZ
			   [,1]
	Min.    -0.9954
	1st Qu. -0.9848
	Median  -0.8610
	Mean    -0.7096
	3rd Qu. -0.4741
	Max.     0.1932

	$AverageOfTimeBodyAccelerationMagnitudeMean
			   [,1]
	Min.    -0.9865
	1st Qu. -0.9573
	Median  -0.4829
	Mean    -0.4973
	3rd Qu. -0.0919
	Max.     0.6446

	$AverageOfTimeBodyAccelerationMagnitudeStandardDeviation
			   [,1]
	Min.    -0.9865
	1st Qu. -0.9430
	Median  -0.6074
	Mean    -0.5439
	3rd Qu. -0.2090
	Max.     0.4284

	$AverageOfTimeGravityAccelerationMagnitudeMean
			   [,1]
	Min.    -0.9865
	1st Qu. -0.9573
	Median  -0.4829
	Mean    -0.4973
	3rd Qu. -0.0919
	Max.     0.6446

	$AverageOfTimeGravityAccelerationMagnitudeStandardDeviation
			   [,1]
	Min.    -0.9865
	1st Qu. -0.9430
	Median  -0.6074
	Mean    -0.5439
	3rd Qu. -0.2090
	Max.     0.4284

	$AverageOfTimeBodyAccelerationJerkMagnitudeMean
			   [,1]
	Min.    -0.9928
	1st Qu. -0.9807
	Median  -0.8168
	Mean    -0.6079
	3rd Qu. -0.2456
	Max.     0.4345

	$AverageOfTimeBodyAccelerationJerkMagnitudeStandardDeviation
			   [,1]
	Min.    -0.9946
	1st Qu. -0.9765
	Median  -0.8014
	Mean    -0.5842
	3rd Qu. -0.2173
	Max.     0.4506

	$AverageOfTimeBodyGyroscopeMagnitudeMean
			   [,1]
	Min.    -0.9807
	1st Qu. -0.9461
	Median  -0.6551
	Mean    -0.5652
	3rd Qu. -0.2159
	Max.     0.4180

	$AverageOfTimeBodyGyroscopeMagnitudeStandardDeviation
			   [,1]
	Min.    -0.9814
	1st Qu. -0.9476
	Median  -0.7420
	Mean    -0.6304
	3rd Qu. -0.3602
	Max.     0.3000

	$AverageOfTimeBodyGyroscopeJerkMagnitudeMean
				[,1]
	Min.    -0.99730
	1st Qu. -0.98520
	Median  -0.86480
	Mean    -0.73640
	3rd Qu. -0.51190
	Max.     0.08758

	$AverageOfTimeBodyGyroscopeJerkMagnitudeStandardDeviation
			   [,1]
	Min.    -0.9977
	1st Qu. -0.9805
	Median  -0.8809
	Mean    -0.7550
	3rd Qu. -0.5767
	Max.     0.2502

	$AverageOfFrequencyBodyAccelerationMeanForX
			   [,1]
	Min.    -0.9952
	1st Qu. -0.9787
	Median  -0.7691
	Mean    -0.5758
	3rd Qu. -0.2174
	Max.     0.5370

	$AverageOfFrequencyBodyAccelerationMeanForY
				[,1]
	Min.    -0.98900
	1st Qu. -0.95360
	Median  -0.59500
	Mean    -0.48870
	3rd Qu. -0.06341
	Max.     0.52420

	$AverageOfFrequencyBodyAccelerationMeanForZ
			   [,1]
	Min.    -0.9895
	1st Qu. -0.9619
	Median  -0.7236
	Mean    -0.6297
	3rd Qu. -0.3183
	Max.     0.2807

	$AverageOfFrequencyBodyAccelerationStandardDeviationForX
			   [,1]
	Min.    -0.9966
	1st Qu. -0.9820
	Median  -0.7470
	Mean    -0.5522
	3rd Qu. -0.1966
	Max.     0.6585

	$AverageOfFrequencyBodyAccelerationStandardDeviationForY
				[,1]
	Min.    -0.99070
	1st Qu. -0.94040
	Median  -0.51340
	Mean    -0.48150
	3rd Qu. -0.07913
	Max.     0.56020

	$AverageOfFrequencyBodyAccelerationStandardDeviationForZ
			   [,1]
	Min.    -0.9872
	1st Qu. -0.9459
	Median  -0.6441
	Mean    -0.5824
	3rd Qu. -0.2655
	Max.     0.6871

	$AverageOfFrequencyBodyAccelerationJerkMeanForX
			   [,1]
	Min.    -0.9946
	1st Qu. -0.9828
	Median  -0.8126
	Mean    -0.6139
	3rd Qu. -0.2820
	Max.     0.4743

	$AverageOfFrequencyBodyAccelerationJerkMeanForY
			   [,1]
	Min.    -0.9894
	1st Qu. -0.9725
	Median  -0.7817
	Mean    -0.5882
	3rd Qu. -0.1963
	Max.     0.2767

	$AverageOfFrequencyBodyAccelerationJerkMeanForZ
			   [,1]
	Min.    -0.9920
	1st Qu. -0.9796
	Median  -0.8707
	Mean    -0.7144
	3rd Qu. -0.4697
	Max.     0.1578

	$AverageOfFrequencyBodyAccelerationJerkStandardDeviationForX
			   [,1]
	Min.    -0.9951
	1st Qu. -0.9847
	Median  -0.8254
	Mean    -0.6121
	3rd Qu. -0.2475
	Max.     0.4768

	$AverageOfFrequencyBodyAccelerationJerkStandardDeviationForY
			   [,1]
	Min.    -0.9905
	1st Qu. -0.9737
	Median  -0.7852
	Mean    -0.5707
	3rd Qu. -0.1685
	Max.     0.3498

	$AverageOfFrequencyBodyAccelerationJerkStandardDeviationForZ
				 [,1]
	Min.    -0.993100
	1st Qu. -0.983700
	Median  -0.895100
	Mean    -0.756500
	3rd Qu. -0.543800
	Max.    -0.006236

	$AverageOfFrequencyBodyGyroscopeMeanForX
			   [,1]
	Min.    -0.9931
	1st Qu. -0.9697
	Median  -0.7300
	Mean    -0.6367
	3rd Qu. -0.3387
	Max.     0.4750

	$AverageOfFrequencyBodyGyroscopeMeanForY
			   [,1]
	Min.    -0.9940
	1st Qu. -0.9700
	Median  -0.8141
	Mean    -0.6767
	3rd Qu. -0.4458
	Max.     0.3288

	$AverageOfFrequencyBodyGyroscopeMeanForZ
			   [,1]
	Min.    -0.9860
	1st Qu. -0.9624
	Median  -0.7909
	Mean    -0.6044
	3rd Qu. -0.2635
	Max.     0.4924

	$AverageOfFrequencyBodyGyroscopeStandardDeviationForX
			   [,1]
	Min.    -0.9947
	1st Qu. -0.9750
	Median  -0.8086
	Mean    -0.7110
	3rd Qu. -0.4813
	Max.     0.1966

	$AverageOfFrequencyBodyGyroscopeStandardDeviationForY
			   [,1]
	Min.    -0.9944
	1st Qu. -0.9602
	Median  -0.7964
	Mean    -0.6454
	3rd Qu. -0.4154
	Max.     0.6462

	$AverageOfFrequencyBodyGyroscopeStandardDeviationForZ
			   [,1]
	Min.    -0.9867
	1st Qu. -0.9643
	Median  -0.8224
	Mean    -0.6577
	3rd Qu. -0.3916
	Max.     0.5225

	$AverageOfFrequencyBodyAccelerationMagnitudeMean
			   [,1]
	Min.    -0.9868
	1st Qu. -0.9560
	Median  -0.6703
	Mean    -0.5365
	3rd Qu. -0.1622
	Max.     0.5866

	$AverageOfFrequencyBodyAccelerationMagnitudeStandardDeviation
			   [,1]
	Min.    -0.9876
	1st Qu. -0.9452
	Median  -0.6513
	Mean    -0.6210
	3rd Qu. -0.3654
	Max.     0.1787

	$AverageOfFrequencyBodyBodyAccelerationJerkMagnitudeMean
			   [,1]
	Min.    -0.9940
	1st Qu. -0.9770
	Median  -0.7940
	Mean    -0.5756
	3rd Qu. -0.1872
	Max.     0.5384

	$AverageOfFrequencyBodyBodyAccelerationJerkMagnitudeStandardDeviation
			   [,1]
	Min.    -0.9944
	1st Qu. -0.9752
	Median  -0.8126
	Mean    -0.5992
	3rd Qu. -0.2668
	Max.     0.3163

	$AverageOfFrequencyBodyBodyGyroscopeMagnitudeMean
			   [,1]
	Min.    -0.9865
	1st Qu. -0.9616
	Median  -0.7657
	Mean    -0.6671
	3rd Qu. -0.4087
	Max.     0.2040

	$AverageOfFrequencyBodyBodyGyroscopeMagnitudeStandardDeviation
			   [,1]
	Min.    -0.9815
	1st Qu. -0.9488
	Median  -0.7727
	Mean    -0.6723
	3rd Qu. -0.4277
	Max.     0.2367

	$AverageOfFrequencyBodyBodyGyroscopeJerkMagnitudeMean
			   [,1]
	Min.    -0.9976
	1st Qu. -0.9813
	Median  -0.8779
	Mean    -0.7564
	3rd Qu. -0.5831
	Max.     0.1466

	$AverageOfFrequencyBodyBodyGyroscopeJerkMagnitudeStandardDeviation
			   [,1]
	Min.    -0.9976
	1st Qu. -0.9802
	Median  -0.8941
	Mean    -0.7715
	3rd Qu. -0.6081
	Max.     0.2878

	$activityDescription
					   [,1]
	LAYING               30
	SITTING              30
	STANDING             30
	WALKING              30
	WALKING_DOWNSTAIRS   30
	WALKING_UPSTAIRS     30
  