SetWorkingDir D:\Downloads\ ;C:\Program Files\EqualizerAPO\config\

F1::FileCopy Setting1.txt,config.txt,1
F2::FileCopy Setting2.txt,config.txt,1

F3::FileCopy % (t:=!t)?"Setting1.txt":"Setting2.txt",config.txt,1
