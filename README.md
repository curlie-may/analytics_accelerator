-- List competitors: Newegg, etc.  List competitors numbers?

-- Prices have not increased since 2021.  Adjust for tariffs and inflation.

-- Job as Data Analyst is to 1). Provide responses to stakeholders questions based on an analysis of customer data 2). Provide feedback regarding gaps in the provided customer data. 3). Provide observations that have come about from having a close relationship with the data.

-- My responsibility as a Data Analyst for GHopper
Analyze customer data to provide clear insights into stakeholders questions.
Identify gaps or inconsistencies in the available customer data and recommend improvements.
Share insights and observations derived from deep engagement with the data.

-- Table of contents.  
  GHopper: Company Profile (link)
  My Role As Data Analyst (link)
  Business Questions Addressed (link)
  Customer Data (ERD) 
  Identified Customer Data Gaps (Remove?)
  Insights from Additional Data Analysis (link)
  Footnotes & References (link)

-- Include document revision. 

-- Give hard % metrics




# Company name:  GHopper (see logo)
Ghopper is an e-commerce company founded in 2018 by two Community College graduates.  The company began as an online site selling returned, slightly-used electronic components and equipment, mostly to hobbyists.  GHopper remains an e-commerce company selling a wider range of popular electronics and has expanded globally.  It is a data-forward company.  It continues to improve customer satisfaction by tracking customer metrics such as refund rates, loyalty program response and fulfillment times.  With the rapid rise of AI, GHopper is extending its product line to cover AI-supporting electronics.

#  My role as a Data Analyst hired by GHopper are to provide:  
1) Responses to stakeholders' questions based on an analysis of customer data. 
2) Feedback regarding gaps in the provided customer data. 
3) Observations that have come about from having a close relationship with the data.

# Business Questions Addressed:
  As part of my analysis, I investigated teh following key business questions using GHopper's customer data, for 2019 to 2022. (link to customer data ERD)  
  1) What were the overall trends in sales during this time? (link)
  2) Where were our monthly and yearly growth rates? (link)
  3) How is the new loyalty program performing?  Should we keep using it? (Link)
  4) What were our refund rates and average order value? (link)

    
# How is the loyalty program performing and should we keep using it?
Notes: To determin how the loyalty program is performing, I compared two metrics: a) the USD prices and b) number of purchases for each group. 
1. Before analysis I removed entries where USD price is listed as $0. (Qty: 35 entries for the loyalty program and 169 entries for the non-loyalty program) 
## I began by using a ttest to determine if the two distributions were significantly diffierent (need to check if the two distributions are normalized!!).  
