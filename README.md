# Amazon_Vine_Analysis

## Overview of Analysis
The purpose of this analysis is to use the ETL process to extract the dataset, transform the data, connect to an AWS RDS instance, and load the transformed data into pgAdmin for one of the Amazon review datasets. The dataset I chose is for pet products. PostgreSQL was also used to determine if the dataset had bias toward 5-star reviews.

## Results

### How many Vine reviews and non-Vine reviews were there?
* Filtered for products with at least 20 total ratings with a percentage of helpful votes at least 50% of total votes...
* Total paid (Vine = Yes) votes = 170
* <img width="68" alt="Number of Vines - Yes" src="https://user-images.githubusercontent.com/101011641/177228775-bedee94e-00b4-4203-aeb7-3177258b04db.png">
* Total unpaid (Vine = No) votes = 37,840
* <img width="74" alt="Number of Vines - No" src="https://user-images.githubusercontent.com/101011641/177228825-fccb367d-86b6-4998-9946-c6a56e9f55a8.png">

### How many Vine reviews were 5 stars? How many non-Vine reviews were 5 stars?
* Filtered for products with at least 20 total ratings with a percentage of helpful votes at least 50% of total votes...
* Total paid (Vine = Yes) 5-star reviews = 65
* <img width="69" alt="5 star reviews - Yes" src="https://user-images.githubusercontent.com/101011641/177228921-80f41ac5-9e9e-4a00-9622-2d7cd5376dbf.png">
* Total unpaid (Vine = No) 5-star reviews = 20,612
* <img width="74" alt="5 star reviews - No" src="https://user-images.githubusercontent.com/101011641/177228955-088c4718-e3f8-4555-b070-23bd85a3f7e3.png">

### What percentage of Vine reviews were 5 stars? What percentage of non-Vine reviews were 5 stars?
* Filtered for products with at least 20 total ratings with a percentage of helpful votes at least 50% of total votes...
* Percentage of 5-star, paid reviews = 38.34%
* <img width="116" alt="Percent five-star - Yes" src="https://user-images.githubusercontent.com/101011641/177229080-7db75a33-08c7-4ac5-89d6-22bbe9e5daff.png">
* Percentage of 5-star, unpaid reviews = 54.47%
* <img width="93" alt="Percent five-star - No" src="https://user-images.githubusercontent.com/101011641/177229194-b76e33c5-ebb9-4d48-a308-c85e8953ac8c.png">

## Summary
At a glance, there does appear to be bias in this study, but in an odd way. The percentage of 5-star reviews is actually lower for the paid portion versus the unpaid portion. Perhaps in the paid votes, honesty is more important to the pet products in order to provide higher quality or better service. However, additional analysis shows that the weighted average of the total votes for the paid reviews is higher than the unpaid reviews

<img width="154" alt="weighted avg" src="https://user-images.githubusercontent.com/101011641/177229905-a538cecd-2980-4022-aa71-78ddc8adf9fb.png">

Based on this additional analysis, the paid reviews bias toward a higher rating than the unpaid.

Studies in statistics show that people who feel strongly about a product or a service are more likely to write reviews for said product or service. That being said, I expect the rating scale to be bimodal, not normally distributed or evenly distributed across the ratings. Additionally, sometimes companies penalize employees for low ratings, so there is pressure to obtain higher ratings at whatever cost. If there was a way to gather honest ratings from people without penalizing the employees, then that would promote a more accurate system for analyzing ratings data.
