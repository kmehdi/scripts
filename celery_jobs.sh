#!/bin/bash
filename='chk.log'
maxtime=12


timenow=`date| awk '{print $4}'`
timenow_hr=`echo $timenow| cut -d':' -f1`
timenow_min=`echo $timenow| cut -d':' -f2`

appending_log=`ls -l chk.log | awk '{print $8}'`
appending_log_hr=`echo $appending_log | cut -d':' -f1`
appending_log_min=`echo $appending_log | cut -d':' -f2`


function restart_celery_jobs {
  echo -e "Restarting celery jobs"
  sudo  service supervisor stop
#  java -jar tika-server-1.4.jar
#  java -mx1000m -cp stanford-ner.jar edu.stanford.nlp.ie.NERServer -loadClassifier org-model-15.ser.gz -port 9799 -outputFormat inlineXML
#  java -mx1000m -cp stanford-ner.jar edu.stanford.nlp.ie.NERServer -loadClassifier classifiers/english.all.3class.distsim.crf.ser.gz -port 9999 -outputFormat inlineXML
#  target/universal/stage/bin/skillapp -Dhttp.port=9699
#
#  celery -A celery_task1.app worker -l info --concurrency 30
#  python mongo_dup.py
#  ps auxww | grep 'celery' | awk '{print $2}' | xargs kill -9
#  celery purge
#
#  echo "starting supervisor"
#  sudo  service supervisor start
}

if (($timenow_hr == $appending_log_hr)); then
  if (($timenow_min > $appending_log_min )); then
    min_diff=`expr $timenow_min - $appending_log_min`
    if (($min_diff > $maxtime)); then
      #Add conditions
      echo 'Hi'
      restart_celery_jobs
    fi
  fi


elif (($timenow_hr > $appending_log_hr)); then
  min_sec=60
  min_diff=`expr $min_sec-$appending_log_min+$timenow_min`
  if (($min_diff > $maxtime)); then
      #Add conditions
      echo 'greater Hi'
      restart_celery_jobs
    fi
fi

