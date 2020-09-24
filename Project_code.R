# Data Mining Final Project By Vivek kumar(CSU ID 2750796)
# And Sankalp Godugu(CSU ID 2705513)
# Step 1: Data Preprocessing
# Importing the datasets 
d.train<- read.csv('training.csv',stringsAsFactors=F)
d.test <- read.csv('test.csv',stringsAsFactors=F)

# sneak peek data
str(d.train)
im.train <- d.train$Image
d.train$Image <- NULL
head(d.train)
# convert strings to integers
# install.packages('doMC') for parallelization
registerDoMC()
im.train <- foreach(im = im.train, .combine=rbind) %dopar% {
  as.integer(unlist(strsplit(im, " ")))
}
str(im.train)
# same for test data

im.test <- d.test$Image
d.test$Image <- NULL
registerDoMC()
im.test <- foreach(im = im.test, .combine = rbind) %dopar% {
  as.integer(unlist(strsplit(im, " ")))
}
str(im.test)
summary(im.test)
summary(im.train)
save(d.train, im.train, d.test, im.test, file='data.Rd')
missing_d.train <- d.train
#taking care of missing value

d.train$left_eye_center_x <- ifelse(is.na(d.train$left_eye_center_x), ave(d.train$left_eye_center_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$left_eye_center_x)
d.train$left_eye_center_y <- ifelse(is.na(d.train$left_eye_center_y), ave(d.train$left_eye_center_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$left_eye_center_y)
d.train$right_eye_center_x <- ifelse(is.na(d.train$right_eye_center_x), ave(d.train$right_eye_center_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$right_eye_center_x)
d.train$right_eye_center_y <- ifelse(is.na(d.train$right_eye_center_y), ave(d.train$right_eye_center_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$right_eye_center_y)
d.train$left_eye_inner_corner_x <- ifelse(is.na(d.train$left_eye_inner_corner_x), ave(d.train$left_eye_inner_corner_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$left_eye_inner_corner_x)
d.train$left_eye_inner_corner_y <- ifelse(is.na(d.train$left_eye_inner_corner_y), ave(d.train$left_eye_inner_corner_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$left_eye_inner_corner_y)
d.train$left_eye_outer_corner_x <- ifelse(is.na(d.train$left_eye_outer_corner_x), ave(d.train$left_eye_outer_corner_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$left_eye_outer_corner_x)
d.train$left_eye_outer_corner_y <- ifelse(is.na(d.train$left_eye_outer_corner_y), ave(d.train$left_eye_outer_corner_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$left_eye_outer_corner_y)
d.train$right_eye_inner_corner_x <- ifelse(is.na(d.train$right_eye_inner_corner_x), ave(d.train$right_eye_inner_corner_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$right_eye_inner_corner_x)
d.train$right_eye_inner_corner_y <- ifelse(is.na(d.train$right_eye_inner_corner_y), ave(d.train$right_eye_inner_corner_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$right_eye_inner_corner_y)
d.train$right_eye_outer_corner_x <- ifelse(is.na(d.train$right_eye_outer_corner_x), ave(d.train$right_eye_outer_corner_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$right_eye_outer_corner_x)
d.train$right_eye_outer_corner_y <- ifelse(is.na(d.train$right_eye_outer_corner_y), ave(d.train$right_eye_outer_corner_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$right_eye_outer_corner_y)
d.train$left_eyebrow_inner_end_x <- ifelse(is.na(d.train$left_eyebrow_inner_end_x), ave(d.train$left_eyebrow_inner_end_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$left_eyebrow_inner_end_x)
d.train$left_eyebrow_inner_end_y <- ifelse(is.na(d.train$left_eyebrow_inner_end_y), ave(d.train$left_eyebrow_inner_end_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$left_eyebrow_inner_end_y)
d.train$left_eyebrow_outer_end_x <- ifelse(is.na(d.train$left_eyebrow_outer_end_x), ave(d.train$left_eyebrow_outer_end_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$left_eyebrow_outer_end_x)
d.train$left_eyebrow_outer_end_y <- ifelse(is.na(d.train$left_eyebrow_outer_end_y), ave(d.train$left_eyebrow_outer_end_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$left_eyebrow_outer_end_y)
d.train$right_eyebrow_inner_end_x <- ifelse(is.na(d.train$right_eyebrow_inner_end_x), ave(d.train$right_eyebrow_inner_end_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$right_eyebrow_inner_end_x)
d.train$right_eyebrow_inner_end_y <- ifelse(is.na(d.train$right_eyebrow_inner_end_y), ave(d.train$right_eyebrow_inner_end_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$right_eyebrow_inner_end_y)
d.train$right_eyebrow_outer_end_x <- ifelse(is.na(d.train$right_eyebrow_outer_end_x), ave(d.train$right_eyebrow_outer_end_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$right_eyebrow_outer_end_x)
d.train$right_eyebrow_outer_end_y <- ifelse(is.na(d.train$right_eyebrow_outer_end_y), ave(d.train$right_eyebrow_outer_end_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$right_eyebrow_outer_end_y)
d.train$nose_tip_x <- ifelse(is.na(d.train$nose_tip_x), ave(d.train$nose_tip_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$nose_tip_x)
d.train$nose_tip_y <- ifelse(is.na(d.train$nose_tip_y), ave(d.train$nose_tip_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$nose_tip_y)
d.train$mouth_left_corner_x <- ifelse(is.na(d.train$mouth_left_corner_x), ave(d.train$mouth_left_corner_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$mouth_left_corner_x)
d.train$mouth_left_corner_y <- ifelse(is.na(d.train$mouth_left_corner_y), ave(d.train$mouth_left_corner_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$mouth_left_corner_y)
d.train$mouth_right_corner_x <- ifelse(is.na(d.train$mouth_right_corner_x), ave(d.train$mouth_right_corner_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$mouth_right_corner_x)
d.train$mouth_right_corner_y <- ifelse(is.na(d.train$mouth_right_corner_y), ave(d.train$mouth_right_corner_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$mouth_right_corner_y)
d.train$mouth_center_top_lip_x <- ifelse(is.na(d.train$mouth_center_top_lip_x), ave(d.train$mouth_center_top_lip_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$mouth_center_top_lip_x)
d.train$mouth_center_top_lip_y <- ifelse(is.na(d.train$mouth_center_top_lip_y), ave(d.train$mouth_center_top_lip_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$mouth_center_top_lip_y)
d.train$mouth_center_bottom_lip_x <- ifelse(is.na(d.train$mouth_center_bottom_lip_x), ave(d.train$mouth_center_bottom_lip_x, FUN = function(x) mean(x, na.rm = TRUE)), d.train$mouth_center_bottom_lip_x)
d.train$mouth_center_bottom_lip_y <- ifelse(is.na(d.train$mouth_center_bottom_lip_y), ave(d.train$mouth_center_bottom_lip_y, FUN = function(x) mean(x, na.rm = TRUE)), d.train$mouth_center_bottom_lip_y)
summary(d.train)
set.seed(147)
split1 = sample.split(d.train,SplitRatio = 0.75)
final_trainingset <- subset(d.train, split1==TRUE)

write.csv(final_trainingset,"data30.train")
write.csv(im.train,"data_imgage.train")
write.csv(im.test,"tdata.test")

# visualize data

#rev reverse the resulting vector to match the interpretation of
#R'simagefunction (which expects the origin to be in the lower left corner)
# visualize image 10

im<-matrix(data=rev(im.train[10,]), nrow=96,ncol=96)
image(1:96, 1:96, im, col = gray((0:255)/255))

# color coordinates for the eyes
points(96-d.train$left_eye_center_x[10], 96-d.train$left_eye_center_y[10], col='blue')
points(96-d.train$right_eye_center_x[10], 96-d.train$right_eye_center_y[10], col='green')
points(96-d.train$left_eyebrow_outer_end_x[10], 96-d.train$left_eyebrow_outer_end_y[10], col='blue')
points(96-d.train$right_eyebrow_outer_end_x[10], 96-d.train$right_eyebrow_outer_end_y[10], col='red')
# Comparison between different sample images taken from the test set
im1<-matrix(data=rev(im.test[10,]), nrow=96,ncol=96)
image(1:96, 1:96, im1, col = gray((0:255)/255))
# color coordinates for the eyes
points(96-d.train$left_eye_center_x[10], 96-d.train$left_eye_center_y[10], col='blue')
points(96-d.train$right_eye_center_x[10], 96-d.train$right_eye_center_y[10], col='green')
points(96-d.train$left_eyebrow_outer_end_x[10], 96-d.train$left_eyebrow_outer_end_y[10], col='blue')
points(96-d.train$right_eyebrow_outer_end_x[10], 96-d.train$right_eyebrow_outer_end_y[10], col='red')

im2<-matrix(data=rev(im.test[16,]), nrow=96,ncol=96)
image(1:96, 1:96, im2, col = gray((0:255)/255))
# color coordinates for the eyes
points(96-d.train$left_eye_center_x[16], 96-d.train$left_eye_center_y[16], col='blue')
points(96-d.train$right_eye_center_x[16], 96-d.train$right_eye_center_y[16], col='green')
points(96-d.train$left_eyebrow_outer_end_x[16], 96-d.train$left_eyebrow_outer_end_y[16], col='blue')
points(96-d.train$right_eyebrow_outer_end_x[16], 96-d.train$right_eyebrow_outer_end_y[16], col='red')

#visualization after training
im4<-matrix(data=rev(im.test[59,]), nrow=96,ncol=96)
image(1:96, 1:96, im4, col = gray((0:255)/255))
# color coordinates for the eyes
points(96-d.train$left_eye_center_x[54], 96-d.train$left_eye_center_y[54], col='yellow')
points(96-d.train$right_eye_center_x[54], 96-d.train$right_eye_center_y[54], col='green')
points(96-d.train$left_eyebrow_outer_end_x[54], 96-d.train$left_eyebrow_outer_end_y[54], col='blue')
points(96-d.train$right_eyebrow_outer_end_x[54], 96-d.train$right_eyebrow_outer_end_y[54], col='red')