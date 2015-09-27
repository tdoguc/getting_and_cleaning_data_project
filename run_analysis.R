
run_analysis<-function(){
  features<-read.table("features.txt", sep=NULL, header=F)
  features<-features[,2]
  
  #STEP1
  #get test dataset
  x_test<-read.table("test/X_test.txt", sep=NULL, header=F)
  names(x_test)<-features
  y_test<-read.table("test/y_test.txt", sep=NULL, header=F)
  names(y_test)<-"Activity"
  subject_test<-read.table("test/subject_test.txt", sep=NULL, header=F)
  names(subject_test)<-"ID"
  #get test dataset 
  #get train dataset
  x_train<-read.table("train/X_train.txt", sep=NULL, header=F)
  names(x_train)<-features
  y_train<-read.table("train/y_train.txt", sep=NULL, header=F)
  names(y_train)<-"Activity"
  subject_train<-read.table("train/subject_train.txt", sep=NULL, header=F)
  names(subject_train)<-"ID"
  #get train dataset  
  #STEP1 

  #STEP2  
  #merge test and train datasets
  x_all<-rbind(x_test,x_train)
  y_all<-rbind(y_test,y_train)
  subject_all<-rbind(subject_test,subject_train)
  #merge test and train datasets
  #filter the measurements on the mean and standart deviation
  filter<-grep("mean()",features)
  filter<-append(filter,grep("std()",features),after=length(filter))
  x_all_filtered<-x_all[filter]
  alldataset<-cbind(subject_all,y_all,x_all_filtered)  
  #filter the measurements on the mean and standart deviation
  #STEP2  
  #STEP3
  activity<-read.table("activity_labels.txt", sep=NULL, header=F)
  names(activity)<-c("ACTIVITY_NO","ACTIVITY_LABEL")
  alldataset<-merge(activity,alldataset, by.x ="ACTIVITY_NO",by.y ="Activity")
  alldataset<-alldataset[,2:length(alldataset)]
  mynames<-names(alldataset)
  alldataset<-cbind(ID=alldataset[,2],ACTIVITY_LABEL=alldataset[,1],alldataset[,3:length(alldataset)])
  names(alldataset)<-mynames
  #STEP3  
  #STEP4  
  library(stringi)
  mynames<-names(alldataset)
  mynames<-stri_replace_all_fixed(mynames,"-","_")
  mynames<-stri_replace_all_fixed(mynames,"()","")
  #mynames<-stri_replace_first(mynames,replacement = "time_",fixed = "t")
  #mynames<-stri_replace_first(mynames,replacement = "frequency_",fixed = "f")
  mynames<-tolower(mynames)
  names(alldataset)<-mynames
  #STEP4  

  #STEP5
  library(dplyr)
  tidydataset<-group_by(alldataset, activity_label, id) %>% summarise_each(c("mean"))
  write.table(tidydataset,file="gettingandcleaningdata_project.txt",row.names = FALSE)
  tidydataset
  #STEP5  
}
