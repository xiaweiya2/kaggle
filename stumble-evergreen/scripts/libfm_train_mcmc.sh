#!/bin/bash

EXPECTED_ARGS=1
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: `basename $0` file_prefix"
  exit 1
fi

PREFIX=$1

../libFM -task c -train $PREFIX'_train_1.lifbm' -test $PREFIX'_valid_1.lifbm' -dim '1,1,20' -iter 100 -out $PREFIX'_out1'  -init_stdev 0.01
../libFM -task c -train $PREFIX'_train_2.lifbm' -test $PREFIX'_valid_2.lifbm' -dim '1,1,20' -iter 100 -out $PREFIX'_out2'  -init_stdev 0.01
../libFM -task c -train $PREFIX'_train_3.lifbm' -test $PREFIX'_valid_3.lifbm' -dim '1,1,20' -iter 100 -out $PREFIX'_out3'  -init_stdev 0.01
../libFM -task c -train $PREFIX'_train_4.lifbm' -test $PREFIX'_valid_4.lifbm' -dim '1,1,20' -iter 100 -out $PREFIX'_out4'  -init_stdev 0.01
../libFM -task c -train $PREFIX'_train_5.lifbm' -test $PREFIX'_valid_5.lifbm' -dim '1,1,20' -iter 100 -out $PREFIX'_out5'  -init_stdev 0.01
../libFM -task c -train $PREFIX'_train_6.lifbm' -test $PREFIX'_valid_6.lifbm' -dim '1,1,20' -iter 100 -out $PREFIX'_out6'  -init_stdev 0.01
../libFM -task c -train $PREFIX'_train_7.lifbm' -test $PREFIX'_valid_7.lifbm' -dim '1,1,20' -iter 100 -out $PREFIX'_out7'  -init_stdev 0.01
../libFM -task c -train $PREFIX'_train_8.lifbm' -test $PREFIX'_valid_8.lifbm' -dim '1,1,20' -iter 100 -out $PREFIX'_out8'  -init_stdev 0.01
../libFM -task c -train $PREFIX'_train_9.lifbm' -test $PREFIX'_valid_9.lifbm' -dim '1,1,20' -iter 100 -out $PREFIX'_out9'  -init_stdev 0.01
../libFM -task c -train $PREFIX'_train_10.lifbm' -test $PREFIX'_valid_10.lifbm' -dim '1,1,20' -iter 100 -out $PREFIX'_out10'  -init_stdev 0.01


awk '{print $1}' $PREFIX'_valid_1.lifbm' > $PREFIX'_actual1' 
awk '{print $1}' $PREFIX'_valid_2.lifbm' > $PREFIX'_actual2'
awk '{print $1}' $PREFIX'_valid_3.lifbm' > $PREFIX'_actual3' 
awk '{print $1}' $PREFIX'_valid_4.lifbm' > $PREFIX'_actual4' 
awk '{print $1}' $PREFIX'_valid_5.lifbm' > $PREFIX'_actual5' 
awk '{print $1}' $PREFIX'_valid_6.lifbm' > $PREFIX'_actual6' 
awk '{print $1}' $PREFIX'_valid_7.lifbm' > $PREFIX'_actual7' 
awk '{print $1}' $PREFIX'_valid_8.lifbm' > $PREFIX'_actual8' 
awk '{print $1}' $PREFIX'_valid_9.lifbm' > $PREFIX'_actual9' 
awk '{print $1}' $PREFIX'_valid_10.lifbm' > $PREFIX'_actual10' 
 
cat $PREFIX'_actual1' $PREFIX'_actual2' $PREFIX'_actual3' $PREFIX'_actual4' $PREFIX'_actual5' $PREFIX'_actual6' $PREFIX'_actual7' $PREFIX'_actual8' $PREFIX'_actual9' $PREFIX'_actual10' > $PREFIX'_actual.mcmc'
cat $PREFIX'_out1' $PREFIX'_out2' $PREFIX'_out3' $PREFIX'_out4' $PREFIX'_out5' $PREFIX'_out6' $PREFIX'_out7' $PREFIX'_out8' $PREFIX'_out9' $PREFIX'_out10' > $PREFIX'_predict.mcmc''

python cal_libfm_val_score.py $PREFIX'_actual.mcmc' $PREFIX'_predict.mcmc'