# Self-Driving Cars: How Safe Are They?
## **Code Name**: _car-crash-2021_
### **Authors**: Trevor Tang (tangtr@uw.edu), Jenna Moon-Earle (jmoone@uw.edu), Sukyung Tae (sukyung@uw.edu), Yeji Kim (yk84@uw.edu)
#### **Affiliation**: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington
#### **Date**: Autumn 2022
<hr>

**Abstract**: Our project will investigate certain crashes involving vehicles equipped with _automatic driving systems_ (**ADS**) / _automatic driving assisted systems_ (**ADAS**) so that consumers can obtain timely and transparent notifications of crashing incidents associated with these vehicles from manufacturers and operators. The purpose of our datasets is to provide information for the development of new technologies and policies to enhance the safety of these technologies, and our main question is to figure out the better option between self-driving vehicles and non self-driving vehicles by examining the number of accidents, key factors that affect the crashes (weather, geography, etc.), and effectiveness of new technologies and policies. This question is important because it helps consumers to be informed whether it's effective to buy ADS/ADAS cars or to avoid it if it doesn't perform well in the places they live. We will analyze the cars with their technologies to visualize how they will perform so that consumers can make better decisions. We recognize that the limitations of the data are crucial for accurate interpretation and analysis, since the crash data did not include the capabilities depending on the brands and manufacturers. To address this concern, we plan to keep in mind the variation in data recording and collect the data by each vehicle’s companies as much as we can.

**Important Clarifications**: 
- **ADAS**: Available for consumer purchase and is an AI driving software that requires drivers to keep their hands on the wheel.
- **ADS**: Not available for consumer purchase, but it is being tested on public roads by automaker companies. 
<hr>

**Keywords**: Automated Vehicle Crashes, Posthumanism, Technology
<hr>

**Introduction**: Autonomous vehicles (self-driving vehicles) are capable of navigating from a destination to another without human input or assistance. By using a variety of technologies, vehicles are able to interpret sensory information, identifying paths, signs, beings, and other objects. However, we found out that there are more than 100 automakers and automated vehicle tech companies who report serious crashes; therefore, some regulations may be needed. The countrywide accident dataset shows the crashes of ADS and ADAS-equipped vehicles and how it results in property damage and injury. In our project, we will figure out and examine the dataset and visualization about the main factors that affect the crashes such as weather, brand, geography and so on. 
<hr>

**Problem Domain**: 
- **Project Framing**: Examine the problems automated cars may have with automated car crash data. Determine how advanced is the technology of automated cars and what issues arise from people using these technologies. This looks at social and economic issues as if there are concerns with these technologies, people might stop investing in them. This affects the population, as are people driving automated cars really safe? We ask not only for the people driving these technologically advanced vehicles, but also for people using the same roads as them. Are there areas of improvement that can be made to make the roads safer?
  - To observe the science behind how ADA / ADAS work, we visited the following links: 
    - [Deep Learning for Object Recognition](https://www.sciencedirect.com/science/article/pii/S2590005621000059)
    - [The Ethics of Accident-Algorithms for Self-Driving Cars](https://link.springer.com/article/10.1007/s10677-016-9745-2)
  - The datasets we are using for our project also came with a deep explanation of how the dataset was collected, the purposes, features and the limitations which can be found [here](https://link.springer.com/article/10.1007/s10677-016-9745-2)


- **Human Values**: The project takes into account trust and security, as consumers want to make sure that they can be safe while using the driving technologies. Though, this does not only involve people using the automated car technologies, but people on the same road as them as well. Making sure that these technologies are safe of use will assure people on the roads will be safer. With the rise of A.I. technology, this project will help answer whether people can trust A.I. technologies to be as flawless and safe as possible. 
  - [Will A.I. Cars End All Car Crashes?](https://www.nytimes.com/2022/04/19/technology/ai-road-car-safety.html)

- **Direct Stakeholders**: Direct stakeholders include the automakers, the manufacturers, the engineers behind the AI driving software, and the government (since it is their dataset, and they can make policies based on it).
  - [Who is Responsible for Self-Driving Crashes?](https://theconversation.com/when-self-driving-cars-crash-whos-responsible-courts-and-insurers-need-to-know-whats-inside-the-black-box-180334)

- **Indirect Stakeholders**: Indirect stakeholders include the consumers buying the cars, the areas they drive the cars at, investors, suppliers, the objects / lifeforms involved in each car crash.

- **Possible Harms**: There is a lack of potentially crucial data (in the form of redacted or personally identifiable information) which removes possible critical information needed to analyze the reasons behind some car crashes. This dataset can also cause consumers to stop investing in certain AI car brands and in AI associated stocks. 

- **Possible Benefits**: Engineers can learn about the flaws in their AI driving product and improve upon it, consumers will more likely to use AI driving features if it is deemed safe, automaker CEOs can decide whether they want to continue investing in AI driving development, more consumers may invest in these AI companies. 
<hr>

**Research Questions**:
  1. _**What type of roadway tends to have the most crashes?**_
      - Might influence consumers to avoid buying these cars for the AI if it seems to perform worse in certain types of roadways. Important for those that live in places where certain types of weather is common that affects the roadway surface. This question is motivated by interest in seeing how AI functions in differing types of roadways and roadway surface conditions. 

  2. _**What type of car crash is most prevalent in ADS vs ADAS? What might be the cause of this?**_
      - Comparing technologies is essential to visualize how they will perform in the future, as well as predict how consumers will react to them. For example, should consumers feel safer moving to ADS (the prototype “no-hands” AI driving experience) or will ADAS (the current one in the market) remain the most popular? As such, we are motivated to find out whether ADS are safe enough to hype up, or if ADAS will remain to stay.  
  
  3. _**Which companies have the most reported car crashes for ADS and ADAS? If so, what were the most common causes for each crash?**_
      - This question is important for investors, consumers, and even the suppliers of the technologies as they should know whether the company they are supporting has effective means of preventing car crashes. However, it is also critical for the engineers of each company to understand what part of their AI technology is most flawed, so they can find solutions to it. This question is motivated by an analysis of which companies are leading in the AI driving industry, but we must consider factors such as the number of models in production, the economies of scale of each company, and the level of knowledge of AI driving technologies.

  4. _**What states have the most crashes? What does this say about the spread of automated car technology in the United States?**_ 
     - This question is important to help consumers make a right decision by informing them a correct data and information as mentioned in Data Feminism. Moreover, the states that have the most crashes can develop their policies about self-driving vehicles and systems for the safety so that they reduce the number of accidents. Looking at differing crashes in each state might give insight into weather or terrain which these cars are having accidents in. As such, a motivation to this question is how can self-driving cars adapt to their environments, and are they suitable for every state or should there be limits?

<hr>

**The Dataset**:
- The dataset comes with columns that can help us solve our research questions. For example, each row represents a self-report of a crash, with each column listing all possible information about the crash as given by the reporter (and some automatically generated). The datasets are split into ADS and ADAS, so it is easy to compare them both since they are separate with the same columns. One other dataset is included which is for reports that didn't list if the car had ADS or ADAS capabilities (but did have one of them). For more information about each feature, the NHTSA defined all 122 columns in this document found [here](https://static.nhtsa.gov/odi/ffdd/sgo-2021-01/SGO-2021-01_Data_Element_Definitions.pdf)

![Table of our datasets](img/table.jpg)

- **Citations**:
  - Bryant, Michael. “Automated Driving Crashes.” _Kaggle_, 22 Oct. 2022, https://www.kaggle.com/datasets/michaelbryantds/automated-driving-crashes?select=SGO-2021-01_Incident_Reports_ADAS.csv. 
  - Bryant, Michael. “Automated Driving Crashes.” _Kaggle_, 22 Oct. 2022, https://www.kaggle.com/datasets/michaelbryantds/automated-driving-crashes?select=SGO-2021-01_Incident_Reports_ADS.csv
  - Bryant, Michael. “Automated Driving Crashes.” _Kaggle_, 22 Oct. 2022, https://www.kaggle.com/datasets/michaelbryantds/automated-driving-crashes?select=SGO-2021-01_Incident_Reports_OTHER.csv

a) The data was collected by the **NHTSA** (National Highway Traffic Safety Administration) from July 2021 to September 2022. The purpose of this data collection is required by NHTSA (which they call the General Order) as they want to be able to respond to crashes and raise concerns with the safety about both ADS and ADAS in the form of enforcement and investigation. For example, if they find a safety defect, then they will force automakers to take their cars off the public roads. <br><br>
b) The data collection effort was most likely funded by the U.S. Government, since it was collected by a government agency for the government to take action upon. Those who benefit can be the manufacturers, as the NHTSA will give them data for them to research and develop prototype technologies to enhance the safety of AI driving. The government will also benefit as they can enforce policies that AI driving car manufacturers must follow to maintain the safety of public roads. <br><br>
c) The trustworthiness of the data depends on those who were affected by an AI driving car crash (whether it be a consumer or the manufacturers) as they are the ones that must give information related to the crash. There is also a lot of missing / redacted  / incomplete / unverified data as a cause of this, so it is hard whether we can trust it or not. It really comes down to whether the way the crashes were self-reported can be trusted or not. However, since the dataset comes from a site affiliated with the U.S. government and has documentation on all the features and limitations of the dataset, it can be considered credible. <br><br>
d) The dataset came from Kaggle, which then was sourced to an official NHTSA website. I credit the source of the data if it comes from a .gov site, since they are more trustworthy than .com or .net sites. Also, the website explains everything you need to know about the data, including features and limitations. We obtained the data by extracting the CSV file from Kaggle itself, and got more information about it from the NHTSA website.
<hr>

**Expected Implications**: There have been more crashes from ADS than ADAS, possibly because reporting requirements for ADS and ADAS are different. Thus, ADS reported less severity rates than ADAS, and the ADS vehicles have less diversely distributed rate of the collision kinds. This proposes that ADS can decrease the number of crashes by improving the detecting technology of two or three most colliding features while keeping a higher no injury level. Furthermore, California outnumbers the crashes both in ADS and ADAS from other states while implying that drivers in California adopt the auto driving system the most. This suggests that they are highly potential for locating themselves in a positive stance and being active users of it. Integrating two outcomes, investigation on features of California's roads and traffic conditions by implementing ADS technology for development may also reduce car crashes all over the United States.
<hr>

**Limitations**: Understanding the data requires understanding the requirements of the General Order. There are specific definitions of terms - ADS, ADAS, crash, and subject vehicles. The reporting requirements for ADS and ADAS are different. ADS reports the crash when its usage happened at any time within 30 seconds and results in property damage or injury, while ADAS reports the crash when a vulnerable road user uses the technology at any time within 30 seconds and results in airbag deployment, fatality, or transportation to hospital. There can be multiple reports for a single crash when the entity requires submitting multiple reports or more than one entity is responsible for reporting. Data may be incomplete or unverified, since there is no responsibility for the entity to update the initial incident report that lacks unaware circumstances. The report summary data are not normalized, since incident rates regarding number of manufacturers or operators are limited to normalize. 

To address these limitations, we will create a summarized dataset of columns that are found in both ADS and ADAS datasets and are necessary (since there are 122 columns). We will also clean each dataset by making sure there are only columns that have the most complete data in them and not have any unknown values.
<hr>

**Findings**:

1. _**What type of roadway tends to have the most crashes? What type of roadway surfaces (dry, wet, ice, etc.) tend to have more crashes?**_

This differed for both ADS and ADAS. For ADS, the most amount of crashes happened on highways / freeways (469) with no close secondary roadway types, while for ADAS it was intersection (197) followed closely by streets (173). For the roadway surface types, most happen on dry surfaces for both ADS and ADAS, so weather is potentially not a factor that leads to these crashes. Thus, it can be attributed that AI technology is more to blame than weather for crashes. 

2. _**What type of car crash is most prevalent in ADS vs ADAS? What might be the cause of this?**_

For ADAS vehicles, the most common type of crash was attributed with various fixed objects not attributed to telephone poles or trees followed closely by passenger cars. Since most ADAS crashes happened on highways / freeways, it is possible that these vehicles might have crashed into the side walls or exit barriers (found near off-ramps) at high speeds. For ADS vehicles, the most prevalent type of crash was with other passenger cars. This makes sense since most of these crashes have happened on streets / intersections where cars can come out of nowhere meaning the AI has little time to react. 

3. _**Which companies have the most reported car crashes for ADS and ADAS? If so, what were the most common causes for each crash?**_

The company with the most ADAS crashes was Tesla with 875 crashes. Since ADAS is commercially available, and Tesla is the leading AI driving software company in the consumer market, it makes sense that most commercial crashes are with them. For ADS, the company with the most crashes was Jaguar with 188 crashes. This was surprising, mainly because we did not know that Jaguar had experimented with AI technology, nor that they were the leaders in crashes. We thought this number would also be lead by Tesla. The common causes for both crashes were quite similar as they happened on mainly dry roads, but on different road types. We can assume that Tesla's crashes happened most on roadways / intersections, while Jaguar's crashes happened most on highways / freeways.

4. _**What states have the most crashes? What does this say about the spread of automated car technology in the United States?**_ 

The states with the most crashes for both ADS and ADAS happened in California, but in differing cities. For ADS, it was in San Francisco (265) while for ADAS it was in Los Angeles (34). However, there is a higher density of crashes for ADAS that have happened on the East Coast. It is not clear why this trend is prevalent, it might be that the East Coast has more people, a higher interest in AI cars, or simply that the East Coast driving experience is worse than the rest of America. However, the high amount of points for ADAS car crashes spread around the United States shows that AI car technology is definitely becoming more popular, and we might be seeing a growth in the number of AI cars that appear on American roads. 

<hr>

**Discussion**:

1. The reason most ADS might happen on highways / freeways is because ADS is not commercially available right now, and freeways are more simple to test AI driving on since streets have many complexities such as stop signs, lights, and pedestrians. ADAS, on the other hand, is commercially available, so it is possible that the reason why most crashes are not highway related is because driver's have to worry about more things on the streets and intersections compared to freeways.

<hr>

**Conclusion**: Vehicles with autonomous technology are capable of either entirely or partially self-driving based on their equipped systems: _automatic driving systems_ (**ADS**) or _automatic driving assisted systems_ (**ADAS**). Besides the convenience of self-driving, one important question to answer is the driver’s safety. Consumers should be aware of newly developed technologies and their effectiveness while operators enhance software and policies through thoroughly analyzed crash incidents. The type of roadway surfaces and the state of most crashes were common in ADS and ADAS. Both reported the highest on dry roadway surfaces in California. This implies that there might be factors other than the weather in AI driving and needs more investigation into the popularity of autonomous vehicles and roadway conditions in California. In contrast, the crashes between ADS and ADAS differ in types of roadways, crashes, and manufacturers. The most amount of ADS crashes was from the company of Jaguar on highways or freeways by colliding with other passenger cars, and ADAS crashes were frequent from Tesla on intersections or streets by hitting various fixed objects. This indicates how systems operate dissimilarly in the complexities of driving conditions and the software of manufacturers. Thus, future research should focus on factors of crashes to reduce the incidents that, importantly, are to ensure the safety of self-driving vehicle drivers. 

<hr>

**Acknowledgements**: We would like to acknowledge Kaggle user Michael Bryant and the NHTSA for their work on this public dataset. This project would not be possible without their contributions.
<hr>

**References**:
  - Abhishek Gupta, Alagan Anpalagan, Ling Guan, Ahmed Shaharyar Khwaja,
_Deep learning for object detection and scene perception in self-driving cars: Survey,  challenges, and open issues_, Array, Volume 10, 2021, 100057, ISSN 2590-0056, https://doi.org/10.1016/j.array.2021.100057. (https://www.sciencedirect.com/science/article/pii/S2590005621000059)
  - Bryant, Michael. “Automated Driving Crashes.” _Kaggle_, 22 Oct. 2022, https://www.kaggle.com/datasets/michaelbryantds/automated-driving-crashes?select=SGO-2021-01_Incident_Reports_ADAS.csv
  - Bryant, Michael. “Automated Driving Crashes.” _Kaggle_, 22 Oct. 2022, https://www.kaggle.com/datasets/michaelbryantds/automated-driving-crashes?select=SGO-2021-01_Incident_Reports_ADS.csv 
  - Bryant, Michael. “Automated Driving Crashes.” _Kaggle_, 22 Oct. 2022, https://www.kaggle.com/datasets/michaelbryantds/automated-driving-crashes?select=SGO-2021-01_Incident_Reports_OTHER.csv 
  - Mohn, Tanya. “Can A.I. All but End Car Crashes? the Potential Is There.” _The New York Times_, The New York Times, 19 Apr. 2022, https://www.nytimes.com/2022/04/19/technology/ai-road-car-safety.html. 
  - Nyholm, S., Smids, J. _The Ethics of Accident-Algorithms for Self-Driving Cars: an Applied Trolley Problem?_. Ethic Theory Moral Prac 19, 1275–1289 (2016). https://doi.org/10.1007/s10677-016-9745-2
  - Snoswell, Aaron J., et al. “When Self-Driving Cars Crash, Who's Responsible? Courts and Insurers Need to Know What's inside the 'Black Box'.” _The Conversation_, The Conversation, 15 Sept. 2022, https://theconversation.com/when-self-driving-cars-crash-whos-responsible-courts-and-insurers-need-to-know-whats-inside-the-black-box-180334. 
  - _Standing General Order 2021-01 Incident Report_, NHTSA, 15 Oct. 2022, https://static.nhtsa.gov/odi/ffdd/sgo-2021-01/SGO-2021-01_Data_Element_Definitions.pdf. 
  - “Standing General Order on Crash Reporting.” _NHTSA_, 2022, https://www.nhtsa.gov/laws-regulations/standing-general-order-crash-reporting. 
  - “Summary Report: Standing General Order on Crash Reporting for ... - NHTSA.” _Summary Report: Standing General Order on Crash Reporting for Automated Driving Systems_, June 2022, https://www.nhtsa.gov/sites/nhtsa.gov/files/2022-06/ADS-SGO-Report-June-2022.pdf. 
<hr>