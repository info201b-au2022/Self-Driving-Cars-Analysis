library(shiny)
library(shinythemes)
library(plotly)
library(markdown)

ui <- navbarPage(
  theme = shinytheme("cerulean"),
  title = strong("A.I. Car Crash Analysis"),
  
  # INTRODUCTION PAGE
  tabPanel(
    title = strong("Introduction"),
    h4("Is self-driving car safe enough?"),
    p("Without human input or help, autonomous cars (also known as self-driving vehicles) are able to navigate from one location to another. By using a variety of technologies, vehicles are able to interpret sensory information, identifying paths and signs. However, we find out that there are more than 100 automakers and automated vehicle tech companies to report serious crashes and some regulations may be needed. The nationwide accident dataset displays crashes involving vehicles with ADS/ADAS and the resulting injuries and property damage. Here, we will investigate the primary causes of automobile accidents by analyzing the datasets we discovered."),
    hr(),
    
    h4("What is an autonomous car?"),
    p("A vehicle that can sense its surroundings and operate without human intervention is said to be autonomous. There is no requirement for a human passenger to operate the car at any moment or even to be inside the vehicle at all. An autonomous vehicle can go anywhere a traditional vehicle can go and can perform any task that a skilled human driver can."),
    img(src = "https://imageio.forbes.com/specials-images/imageserve/60c35192ba409e6fc1b4012e/Self-Driving-car/0x0.jpg", height=200, width=300),
    hr(),
    h4("Brief Summary of our Project"),
    p("The government assesses whether producers of ADAS and ADS systems, as well as producers of prototype vehicles and equipment, are upholding their legal requirements to make sure that their products are free of flaws that pose unreasonably high hazards to motor vehicle safety. Although self-driving car use is carefully regulated and limited, numerous automated car accidents have been documented. In order for consumers to receive prompt and transparent notifications of crashing incidents related to these vehicles from manufacturers and operators, our project will investigate specific crashes involving vehicles equipped with automatic driving systems (ADS) or automatic driving assisted systems (ADAS).Even though we set our goals to give better informations to both direct stakeholders (automakers and manufacturers) and indirect stakeholders (consumers who consider buying the self driving cars) to make a better self-driving cars and to help them decide whether they need to buy the self driving cars, it was more important to consider the indirect stakeholders because they don’t even know whether they can trust the AI technologies to be as flawless and safe as possible. For the problem domain, we must take into account AI technology, the advantages and disadvantages of self-driving cars, and precise collision statistics in order to ensure that we can earn the trustability of readers. We set three research questions: “What type of roadway tends to have the most crashes?”, “What type of car crash is most prevalent in ADS vs ADAS? What might be the cause of this?”, and “Which companies have the most reported car crashes for ADS and ADAS? If so, what were the most common causes for each crash?” and all of these are very significant because it helps buyers to be informed well and helps them make a choice whether they are going to buy ADS/ADAS cars or not. Moreover, this project with lots of visualizations and tables to show how self-driving cars perform in typical locations, types of roadways, and types of cars will help the readers of our project (buyers for self-driving cars) easily understand the key concepts.It is also important to recognize that we have a limit of the data that is crucial for accurate interpretation and analysis since the crash data did not include the capabilities depending on the brands and manufacturers. To address this concern, we have to consider the problems of automated cars more deeply. We conclude that California was the state where both ADS and ADAS crashes occurred the most frequently. Tesla had the most ADAS crashes, and Jaguar had the most ADS crashes. We discovered that ADS had less collisions than vehicles with ADAS, therefore we expect that this knowledge will assist consumers in decision-making and manufacturers in furthering the development of ADAS technology. And last, it is discovered that whereas the majority of ADS crashes occur at intersections, the majority of ADAS crashes occur on highways. We are happy to provide readers with exact and reliable data for both ADS and ADAS crashes regarding how the kind of road, the kinds of vehicles, and the locations affect the number of autonomous vehicle crashes."),
    hr(),
    h4("Research quesstions and the Datasets"),
    p("We tried to examine three research questions. First one is “What States have the most crashes?” and it’s important to help consumers make a right decision by informing them of the correct data within the States. Second one is “What type of car crash is most prevalent in ADS vs ADAS?” and it’s significant to predict how the different technologies will perform in the future by comparing technologies. The last one is “What type of roadway tends to have the most crashes? What about the roadway surface (dry, ice, etc)?” since it’s an important factor to consider for consumers to avoid buying these cars for the AI if it seems to perform worse in certain types of roadways."),
    p("We will use the 'Automated Driving Crashes' datasets from Kaggle for this research project. The National Highway Traffic Safety Administration (NHTSA) gathered the information between July 2021 and September 2022. In order to respond to accidents and address concerns about the safety of both ADS and ADAS through enforcement and inquiry, NHTSA (which they refer to as the General Order) has mandated this data collecting. It offers reliable crash data for ADS and ADAS on how the kind of road, the make and model of the automobile, and the locations affect the frequency of autonomous vehicle crashes. The datasets that we used are easily readable since it’s split into ADS and ADAS solums, so it is easy to compare them both since they are separate with the same column. The datasets can be viewable from this document (https://static.nhtsa.gov/odi/ffdd/sgo-2021-01/SGO-2021-01_Data_Element_Definitions.pdf)."),
    hr(),
    h4("What are the key findings?"),
    p("In fact, we are able to answer all of the three research questions based on the datasets that we used. We figured out that the states with the most crashes for both ADS and ADAS happened in California. Passenger cars are the most common cases in ADS and the fixed objects are the most common cases in ADAS. And at last, it’s seen that the most crashes for ADAS happens on the highway, while it’s on the intersection for ADS. We are glad to provide precise and accurate data for both ADS and ADAS crashes of how the type of roadway, types of car, and locations affect the number of self-driving car crashes to the readers."),
  ),
    
  
  # CHART 1 PAGE
  tabPanel(
    title = strong("Chart 1"),
    selectInput(inputId = "chart_1_type_input", label = "Select ADAS or ADS",
                choices = c("ADAS", "ADS")),
    uiOutput("slider"),
    plotlyOutput(outputId = "chart_1_output"),
    p(span("Chart 1: A map depicting where ADAS and ADS crashes have happened around
      the United States. Users can select between the ADAS and ADS map using
           the select input, while the slider allows them to select the minimum
           number of crashes shown to make the map more readable."), style = "font-size: 16px"),
    hr(),
    p(span("The reason this graphic was chosen was for a better
           visualization on how A.I. car crashes are spread around the United
           States. The data itself doesn't quite show this as it is more
           organized around the type of car crashes, but it isn't prominent
           on where it happened as geographic features might be important
           in analyzing why A.I. car crashes might happen. Thus, the number of crashes
           is represented as a circle with the more intense red and larger
           circles indicating that more crashes have been reported at that 
           location."), style = "font-size: 14px")
  ),
  
  # CHART 2 PAGE
  tabPanel(
    title = strong("Chart 2"),
    
    selectInput("chart_2_type", label = "Choose ADAS / ADS", choices = c("ADAS", "ADS")),
    selectInput("Manufacturer", label = "Select Manufacturer", choices = manufacturer),
    plotlyOutput("chart_2"),
    p(span("Chart 2: The pie charts illustrate what types of car crash are most prevalent
           in ADAS and ADS in the United States. The user can select the manufacturer to see
           how the prevalence of crash types differ by their selection."), 
      style = "font-size: 16px"),
    hr(),
    p(span("The purpose of this visualization is to explore what types of car crashes happend 
           from AI authomobile technology in the United States. The data can further provide
           an insight to manufacturer of what are the potential car crashes based on ADAS or ADS
           and in which way the technology should develop to prevent them for customer's safety."),
      style = "font-size: 14px")
    
  ),
  
  # CHART 3 PAGE
  tabPanel(
    title = strong("Chart 3"),
    selectInput("Type", label = "Select ADS or ADAS", choices = c("ADAS", "ADS")),
    plotlyOutput(outputId = "chart_3"),
    hr(),
    p("These bar graphs depict which roadway types are most prevalent 
      in the crashes of ADAS and ADS in the United States. It is seen 
      that the most crashes for ADAS happens on the highway, while it 
      is on the intersection for ADS. The ADAS roadway types might be 
      the result that drivers like to turn on ADAS most likely when 
      they are on highways. For ADS, it might mean that these cars 
      struggle to identify red lights. This is important because it shows
      what manufactorers can do to better their products.")
  ),
  
  # SUMMARY PAGE
  tabPanel(
    title = strong("Summary"),
    h4("Key Takeaways"),
    p("There are 1,167 total observations in the ADAS dataset. Tesla has experienced 875 ADAS crashes, making it the company with the most. The Tesla Model 3 has experienced the most ADAS crashes. There are 436 observations in the entire ADS dataset. Jaguar has experienced 875 ADS crashes, making it the company with the most. The Jaguar I-Pace, with 186 crashes, is the model with the most ADS crashes."),
    hr(),
    h4("Tables"),
    p("These tables were added because it's crucial to assess how AI cars behave on various types of roads because the highway surface has a significant impact on how cars drive. These tables demonstrate that ADAS and ADS vehicle crashes occur more frequently on dry highway surfaces. Therefore, the performance of the AI vehicles is unaffected by the type of road surface. This indicates that another factor, such as the type of road or automobile manufacturer, must have contributed to the collision."),
    img(src = "https://i.ibb.co/PCNJNMb/Tables-final.png"),
    hr(),
    h4("Key Findings"),
    p("For our first research question, we tried to examine the distribution of ADAS/ADS car crashes per location in the United States. Through the visualization maps, readers can see where and how many crashes are occurring across the United States. Because of this, the majority of collisions appear to take place in California especially in Los Angeles, Texas, and New York."),
    img(src = "https://i.ibb.co/zGh7X5Y/ads-map.png", height=200, width=250),
    img(src = "https://i.ibb.co/zxm10jn/map-adas.png", height=200, width=250),
    hr(),
    p("For the second research question, we tried to identify the types of car crashes in both ADAS and ADS. The majority of ADAS cases involve fixed objects, whereas the top 3 ADS cases involve pickup trucks, SUVs, and passenger cars. Given that the majority of these vehicles are driven on busy roads with lots of other vehicles, this makes sense."),
    img(src = "https://i.ibb.co/D47mYXT/ads-types-of-car.png", height=200, width=250),
    img(src = "https://i.ibb.co/cTyM5J2/adas-types-of-car.png", height=200, width=250),
    hr(),
    p("For the last research question, we figured out the number of ADAS and ADS crashes per roadway. As a result, while ADS crashes tend to occur at intersections, ADAS crashes tend to occur on highways. The fact that drivers prefer to turn on ADAS more frequently when they are on highways may be the cause of the different ADAS roadway types. It can imply to ADS that these vehicles have trouble recognizing the red lights."),
    img(src = "https://i.ibb.co/mtLxRvG/types-of-roadway.png", height=110, width=500), 
    hr(),
    h4("Conclusion"),
    p("We are pleased to inform readers that the datasets we used allowed us to answer all three research questions. Since our goal was to provide better information to both manufacturers (direct stakeholders) and consumers considering purchasing self-driving cars (indirect stakeholders), we hope they can use our research to equip and develop self-driving cars and make a better decision whether they need to buy self-driving cars or not by examining our visualizations and data analysis. Because our project is important and useful for future industry and safety to reduce car accidents, we hope that these resources are used wisely."),
  ),
  
  # REPORT PAGE
  tabPanel(
    title = strong("Report"),
    includeMarkdown("www/docs/p01-proposal.md")
  )
)