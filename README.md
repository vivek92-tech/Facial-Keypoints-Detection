# Facial-Keypoints-Detection


  ### Table Of Content
    * Aim
    * Description
    * Data Specification
    * Major Task Involved
    * Methodology
    * Simple Linear Regression
    * Data visualization
    * Artificial Neural Network (Multilayer Perceptron)
 
 
 ### Aim
   * To develop an algorithm which will help to detect the facial key point on an achromatic image of a human face. Facial key point means that eyes, mouth corners, nose tip and other similar key features of a human face.
 
 ### Description
 
Kaggle’s website (https://www.kaggle.com/c/facial-keypoints-detection/data) is the source of the data set used in this study.  Provided data sets are divided into two parts:

*	Training data set - consists of (x, y) coordinates of each of the 15-facial key points of 7049 gray- scale images represented as two-dimensional. A single image is represented by a 96 × 96-pixel matrix integers from 0 through 255 which is present as Image Data attribute (row ordered list of pixels). Thus, 96 × 96 = 9216 pixels would represent each image in a row. In short, the training data set contains 7049 gray scale human face images with 31 attributes, first 30 attributes are the (x,y) values of the 15-facial key-points for example left_eye_center_x, right_eyebrow_outer_end_x, right_eyebrow_outer_end_x and so on and the last column contains a string of 9216 numbers (for each image) that represent the pixel matrix. As expected, the training data (in form of .csv file) need to be preprocessed since it has missing values.

*	Test data set – consists of 1783 images where each row contains ImageId and image data (presented in a .csv file) as row-ordered list of pixels.

 ### Major Task Involved
 
  *	Data Preprocessing is the one of the major tasks that addresses the problem of cleaning and preprocessing of the data for usage.

*	Core Algorithms to be used: 
1.	Linear Regression 
2.	Artificial Neural Network
3.	Image Patches.

### Methodology
* Data Preprocessing: Data Preprocessing is one of the major tasks that addresses the problem of cleaning and processing the data for usage. Following steps were followed:

* Bizarre format and structure of Attributes: Image data attribute, which is the row ordered list of pixels, was present in a continuous string format in both training and test sets which made its interpretation hard and thought-provoking.
![image](https://user-images.githubusercontent.com/61467017/94097320-5483e900-fdf4-11ea-8710-4d67ad801e22.png)

*	Several Missing values in 30 key-points attributes in the training dataset:  
The training data set had several attributes with missing values for several images.  
Some key-points had only 3000 values out of 7049 and some key-points with over 6000 values available out of 7049
![image](https://user-images.githubusercontent.com/61467017/94097698-fe637580-fdf4-11ea-8e99-e10467200482.png)


* To start with training.csv file and test.csv was fed to R and the output was analyzed:
![image](https://user-images.githubusercontent.com/61467017/94097526-a75da080-fdf4-11ea-9828-d519b9653edb.png)

Note that the last column in training dataset and the whole test is a string representation of the image, identified as a string. This last column is the reason for the stringsAsFactors argument: if you omit it R might treat this column as a factor.

*	Attribute separation: Image data attribute is extracted from the 30 other attributes which represent (x, y) coordinates of 15-facial features. This was done to better understand each attribute and locate anomalies, redundancy and missing values.

![image](https://user-images.githubusercontent.com/61467017/94097594-c78d5f80-fdf4-11ea-8a6f-af7ea3cab2f2.png)
![image](https://user-images.githubusercontent.com/61467017/94097620-d4aa4e80-fdf4-11ea-995b-cc4b9a22a9d4.png)
![image](https://user-images.githubusercontent.com/61467017/94097634-dffd7a00-fdf4-11ea-89cd-c9c3b5751213.png)

•	Now converting string dataset of image_training set to vectors.
![image](https://user-images.githubusercontent.com/61467017/94097751-189d5380-fdf5-11ea-9452-0b22af7d44aa.png)
![image](https://user-images.githubusercontent.com/61467017/94097770-25ba4280-fdf5-11ea-9259-0e3aa57686f5.png)

•	Similarly, we convert test dataset as vectors
![image](https://user-images.githubusercontent.com/61467017/94097815-3bc80300-fdf5-11ea-81a5-918beefab32f.png)
![image](https://user-images.githubusercontent.com/61467017/94097819-3ff42080-fdf5-11ea-935d-ed4f2217dff9.png)

•	Now we remove all the NA values with mean, from training dataset, which now only contain 30 attributes after image column separation.


![image](https://user-images.githubusercontent.com/61467017/94097883-631ed000-fdf5-11ea-9116-49490d0e7130.png)

![image](https://user-images.githubusercontent.com/61467017/94099382-d4ac4d80-fdf8-11ea-9c7d-81afbba6f8f0.png)

![image](https://user-images.githubusercontent.com/61467017/94097899-6a45de00-fdf5-11ea-93bb-9166428aaa0e.png)
![image](https://user-images.githubusercontent.com/61467017/94097973-96615f00-fdf5-11ea-9456-e74fe46634da.png)
![image](https://user-images.githubusercontent.com/61467017/94097976-995c4f80-fdf5-11ea-8107-b327954ba3ec.png)
![image](https://user-images.githubusercontent.com/61467017/94097983-9c574000-fdf5-11ea-8529-5beb9c9e88ce.png)

•	Dropping rows - The lower half of the training data set records had several values missing. Half of those rows were dropped as it would have biased the result (because missing values were replaced with Mean), so taking into consideration 75% of the total dataset.

![image](https://user-images.githubusercontent.com/61467017/94098020-ada04c80-fdf5-11ea-8c8b-1cadf7b9c788.png)

•	After that we save our file so that it can trained using Weka


![image](https://user-images.githubusercontent.com/61467017/94098079-d45e8300-fdf5-11ea-8c9e-fe20c6745251.png)

•	Feature Subset Selection - While merging the Image attribute with other attributes an “Id” attribute was created. Since this did not have any use or relevance to the 31 attributes, it was removed.


![image](https://user-images.githubusercontent.com/61467017/94098111-e6402600-fdf5-11ea-8e5f-95c3e759b534.png)

###	Simple Linear Regression

•	Simple Linear Regression models the past relationship between the variables to predict their future behavior.

•	Running this algorithm on our dataset provided us with a good estimate of the facial x, y coordinates. The algorithm works by picking the attributes that result in the lowest squared error. Deals with only numeric attribute.

•	Each of the 30 attributes were trained using this Simple Linear Regression Algorithm


![image](https://user-images.githubusercontent.com/61467017/94098248-39b27400-fdf6-11ea-9abf-4ea8abbe55bf.png)
![image](https://user-images.githubusercontent.com/61467017/94098254-3d45fb00-fdf6-11ea-80b5-2c0dff759cea.png)
![image](https://user-images.githubusercontent.com/61467017/94098266-43d47280-fdf6-11ea-8a75-673a4b9461ea.png)
![image](https://user-images.githubusercontent.com/61467017/94098271-4767f980-fdf6-11ea-8e61-b6bf9507bb25.png)
![image](https://user-images.githubusercontent.com/61467017/94098285-4b941700-fdf6-11ea-99b7-cc633f6e2cfb.png)
![image](https://user-images.githubusercontent.com/61467017/94098290-4fc03480-fdf6-11ea-8689-35db361a5a15.png)
![image](https://user-images.githubusercontent.com/61467017/94098303-55b61580-fdf6-11ea-82ee-f5216c7de053.png)
![image](https://user-images.githubusercontent.com/61467017/94098310-58b10600-fdf6-11ea-9e20-43599847fb47.png)
![image](https://user-images.githubusercontent.com/61467017/94098313-5cdd2380-fdf6-11ea-8802-1b8280bda193.png)
![image](https://user-images.githubusercontent.com/61467017/94098321-5f3f7d80-fdf6-11ea-9c80-060461cfe3d6.png)
![image](https://user-images.githubusercontent.com/61467017/94098324-62d30480-fdf6-11ea-9017-03a9c503754f.png)
![image](https://user-images.githubusercontent.com/61467017/94098327-66668b80-fdf6-11ea-974e-ed49894c9652.png)
![image](https://user-images.githubusercontent.com/61467017/94098339-6a92a900-fdf6-11ea-8a46-a562ec29dfee.png)
![image](https://user-images.githubusercontent.com/61467017/94098346-6d8d9980-fdf6-11ea-9377-c766c32c42dd.png)
![image](https://user-images.githubusercontent.com/61467017/94098358-71212080-fdf6-11ea-82b1-68be21ba30ce.png)
![image](https://user-images.githubusercontent.com/61467017/94098370-741c1100-fdf6-11ea-82b9-f6ad12261d99.png)
![image](https://user-images.githubusercontent.com/61467017/94098379-78482e80-fdf6-11ea-958d-539a50f78a21.png)
![image](https://user-images.githubusercontent.com/61467017/94098386-7b431f00-fdf6-11ea-8f4d-f0160b5975dc.png)
![image](https://user-images.githubusercontent.com/61467017/94098394-81390000-fdf6-11ea-9cd7-4fee6d385ee7.png)
![image](https://user-images.githubusercontent.com/61467017/94098401-8433f080-fdf6-11ea-9a6c-529ebec6c485.png)
![image](https://user-images.githubusercontent.com/61467017/94098407-87c77780-fdf6-11ea-966a-53799541b719.png)
![image](https://user-images.githubusercontent.com/61467017/94098416-8b5afe80-fdf6-11ea-9fcb-b75e0842b119.png)
![image](https://user-images.githubusercontent.com/61467017/94098535-d248f400-fdf6-11ea-864a-a3b1a1e630a6.png)
![image](https://user-images.githubusercontent.com/61467017/94098542-d4ab4e00-fdf6-11ea-8a68-754d75a9e141.png)
![image](https://user-images.githubusercontent.com/61467017/94098549-d7a63e80-fdf6-11ea-992b-70a6737f69b1.png)
![image](https://user-images.githubusercontent.com/61467017/94098551-da089880-fdf6-11ea-8c07-f06dab7e7b89.png)
![image](https://user-images.githubusercontent.com/61467017/94098558-decd4c80-fdf6-11ea-8384-40724a2d399f.png)
![image](https://user-images.githubusercontent.com/61467017/94098561-e1c83d00-fdf6-11ea-9c3c-a3149c2575dc.png)
![image](https://user-images.githubusercontent.com/61467017/94098568-e4c32d80-fdf6-11ea-9582-108f990868dc.png)
![image](https://user-images.githubusercontent.com/61467017/94098574-e7be1e00-fdf6-11ea-808e-6fe2aa93442d.png)

####	Data visualization
After training every 30 coordinates of 15 facial points, we first create an image by combining data pixels from image training set and then we plot the facial keypoint on the created image. In the below case, I am taking four points to be plotted on the image and image row number 10 from image training set.

![image](https://user-images.githubusercontent.com/61467017/94099005-e6412580-fdf7-11ea-9a1e-4e13818f72d0.png)
![image](https://user-images.githubusercontent.com/61467017/94099011-eb05d980-fdf7-11ea-846b-9e1620c921a8.png)

![image](https://user-images.githubusercontent.com/61467017/94099020-ef31f700-fdf7-11ea-8bd6-9800acb95601.png)

The facial keypoint plot came out perfectly on out training image number 10

Now we will test our model on 2 test set images.


![image](https://user-images.githubusercontent.com/61467017/94099080-0e308900-fdf8-11ea-87fd-dada6cb7766b.png)
![image](https://user-images.githubusercontent.com/61467017/94099091-12f53d00-fdf8-11ea-83d5-58b6d6216cd2.png)
![image](https://user-images.githubusercontent.com/61467017/94099104-17215a80-fdf8-11ea-9e89-fb6811f4433e.png)


### Artificial Neural Network (Multilayer Perceptron)
•	A perceptron is also called Artificial Neural Network and takes several binary inputs like x1, x2… The result is a single binary output.
•	The perceptron has three inputs, x1, x2, and x3. These values can vary from fewer to more than 3. Weights, w1, w2…, were introduced. The neuron's output, 0 or 1, is determined by whether the weighted sum ∑wi. xj is less than or greater than some threshold value. Just like the weights, the threshold is a real number which is a parameter of the neuron.


![image](https://user-images.githubusercontent.com/61467017/94098727-42577a00-fdf7-11ea-86a4-c836379ba063.png)

Neural Network Algorithm run on our dataset is shown and training each point coordinates on reduced training data for better result.
![image](https://user-images.githubusercontent.com/61467017/94098760-556a4a00-fdf7-11ea-8428-7b2e82d20a36.png)
![image](https://user-images.githubusercontent.com/61467017/94098767-58fdd100-fdf7-11ea-8790-22bd32961beb.png)

![image](https://user-images.githubusercontent.com/61467017/94098793-6b780a80-fdf7-11ea-932f-c4c34a8e50d9.png)

*	As we can see that the training data is sizeable, but the plot of neural network remains unreadable.

*	This is because of the data being too massive i.e., 9216 labels had to be assigned over 7049 images

#### Now visualizing the trained model on the test set image number 59 


![image](https://user-images.githubusercontent.com/61467017/94098835-8ba7c980-fdf7-11ea-8ec3-ea9919707062.png)

![image](https://user-images.githubusercontent.com/61467017/94098852-92ced780-fdf7-11ea-9fc8-a19e77ab0cc4.png)

#### Now the facial keypoints are plotted with better accuracy rate on the test set image.  

