# Housing-Price-Regression-Model
## Project Overview
Real estate agents know the three most important factors in determining the price of a house are
location, location, and location. But what other factors help determine the price at which a house
should be listed? Number of bathrooms? Size of the yard? 
The project aims at building a linear model to predict the selling price using a set of potential predictor variables.

## Exploring Data
The scatter plot matrix and the correlation matrix show that there exists a strong positive linear relationship between Y (selling price) and X1 (living area), and a weak positive linear relationship between Y and X2 (number of bedrooms), also Y and X3 (number of fireplaces). 
There are evidences of moderate multicollinearity. Collinearity between X1 and X2 is moderate. We can also tell that there exists weak collinearity between X2 and X3, X1 and X3.

<div  align="center"><img src="https://user-images.githubusercontent.com/72762392/96947504-5e5f4180-14b1-11eb-99b1-1e57bc44b10a.jpg" width="80%" height="80%">/div>
## Building Regression Models
### Selling Price & Living Area
The numeric variable with the second highest correlation with Selling Price is  Living Area. This is reasonable; big houses are generally more expensive.

<div  align="center"><img src="https://user-images.githubusercontent.com/72762392/97016101-5687b780-151a-11eb-9e49-fdedd9e70804.jpg" width="80%" height="80%">/div>
According to the semi-studentized residuals plot, we can see there’re outliers. The skewed shape indicates nonnormality. 
![residual1](https://user-images.githubusercontent.com/72762392/97018346-0cec9c00-151d-11eb-94c7-858af7db020e.jpg)
![residual2](https://user-images.githubusercontent.com/72762392/97018380-1413aa00-151d-11eb-8773-d5fbb9d63aa6.jpg)

There are simple transformations of Y and X. I used Log price and Square price to transform on Y and Log living area and Square living area to transform on X separately. From the results of QQ plot, we can find that Log living area will make the linear model more appreciate.
<div  align="center"><img src="https://user-images.githubusercontent.com/72762392/97018837-9b611d80-151d-11eb-9007-2e8b38b4224b.jpg" width="80%" height="80%">/div>
<div  align="center"><img src="https://user-images.githubusercontent.com/72762392/97018872-a320c200-151d-11eb-9ef6-762ef8025223.jpg" width="90%" height="90%">/div>
  
### Interaction Effect
Because these two linear lines are overlapped, the slopes are different and there are interaction effects, so the interaction term X1X2 should be included to determine the effect between each variable.

<div  align="center"><img src="https://user-images.githubusercontent.com/72762392/97019451-5689b680-151e-11eb-96e8-0adfbfb11dbc.png" width="80%" height="80%">/div>

ANOVA table is showed as below, indicating that we should include interaction term.
![interaction3](https://user-images.githubusercontent.com/72762392/97020060-1840c700-151f-11eb-8e82-543fb8f543c7.png)

### Best Subset Selection
First, we begin with the model that contains all 11 X variables. Based on the backward elimination approach, the best subset of variables includes Waterfront, Land Value, New Construction, Living area, Central air conditioning, number of Bedrooms and number of Rooms. 

![approach](https://user-images.githubusercontent.com/72762392/97020223-48886580-151f-11eb-9c41-c19cde46658f.png)
![approach2](https://user-images.githubusercontent.com/72762392/97020251-4f16dd00-151f-11eb-8881-f09a941b2c44.png)
