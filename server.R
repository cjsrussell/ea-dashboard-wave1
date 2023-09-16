#-------------------------SERVER INFO--------------------------------------------------------

server <- function(input, output) {
  set.seed(122)
  
#--------------------- Info ----------------------------------
  
  
  output$text1 <- renderUI({
    text <- "Hi!<br><br>Welcome to the dashboard for the first wave of data for the Explaining Atheism project. This is currently a dummy/test site with fake data as we have not yet released our real data. This site will be updated to have the real data as soon as its out. <br><br> The dashboard is organised into our 5 surveys within the study:
    <br><br> 
    - Morals/Values <br>
    - Cognitive Styles <br> 
    - Socialisation <br>
    - Motivational <br>
    - Cogntive Bias <br><br>
    
    For more details about the variables and the project see our <a href='https://cjsrussell.quarto.pub/explaining-atheism-pilot-1-codebook/'>codebook</a>."
      
      
      
    return(HTML(paste("<div style='font-size: 24px; font-family: Verdana, serif; color: #253f8c;'>", text, "</div>")))
  })
  
 #--------------------- Survey 1 ----------------------------------

# Plots
  
  # Variable information box
  
  output$varinfo1<- renderUI({
    case_when(
      input$select_var1_p1 == "Age" ~ HTML("<strong> Age: </strong> <br/> ", "Axis refers to numerical age."),
      input$select_var1_p1 == "Country" ~ HTML("<strong> Country: </strong> <br/> ", "Axis refers to Country."),
      input$select_var1_p1 == "Sex" ~ HTML("<strong> Sex: </strong> <br/> ", "Axis refers to sex."),
      input$select_var1_p1 == "Belief In God (categorical)" ~ HTML("<strong> Belief In God: </strong> <br/> ", "Axis refers category selected regarding belief in God."),
      input$select_var1_p1 == "Belief Identity" ~ HTML("<strong> Belief Identity: </strong> <br/> ", "Axis refers category selected regarding belief identity"),
      input$select_var1_p1 == "Religious Identity" ~ HTML("<strong> Belief Identity: </strong> <br/> ", "Axis refers category selected regarding religious identity"),
      
      input$select_var1_p1 == "Individualism" ~ HTML("<strong> Individualism: </strong> <br/> ", "Axis refers to score on individualism questionnaire, with higher scores denoting higher individualism and lower score higher collectivism."),
      input$select_var1_p1 == "Rebelliousness" ~ HTML("<strong> Rebelliousness: </strong> <br/> ", "Axis refers to score on rebelliousness questionnaire, with higher scores denoting higher rebelliousness."),
      input$select_var1_p1 == "Choice Norms" ~ HTML("<strong> Individual Choice Norms: </strong> <br/> ", "Axis refers to score on individual choice norms questionnaire, with higher scores denoting higher agreement with individual choice norms (e.g. abortion, homosexuality)"),
      input$select_var1_p1 == "Belief in God (continuous)" ~ HTML("<strong> Belief in God: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'I believe that God exists' </em>."),
      input$select_var1_p1 == "Possibility of Knowing" ~ HTML("<strong> Possibility of Knowing: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'It is not possible to know if God exists' </em>."),
      input$select_var1_p1 == "Confidence in Belief" ~ HTML("<strong> Confidence in Belief: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'I am confident that my beliefs about God's existence are the right ones' </em>."),
      input$select_var1_p1 == "Anti Religiosity" ~ HTML("<strong> Anti Religiosity: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'We would all be better off if people left religion behind' </em>."),
      input$select_var1_p1 == "God Apatheism" ~ HTML("<strong> God Apatheism: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Whether or not God exists is a question that doesn’t interest me much' </em>."),
      input$select_var1_p1 == "Purpose Apatheism" ~ HTML("<strong> Purpose Apatheism: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Whether or not there is an ultimate purpose to life is a question that doesn’t interest me much.' </em>."),
      input$select_var1_p1 == "Agnosticism" ~ HTML("<strong> Agnosticism: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> '	I don’t know whether there is a God, and I don’t believe there is any way to find out' </em>."),
      input$select_var1_p1 == "Objective Truth Discovery" ~ HTML("<strong> Objective Truth Discovery: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'For most things in the world, we will never be able to discover the real objective truth' </em>."),
      
      input$select_var1_p1 == "Religious Identification (y/n)" ~ HTML("<strong> Religious Identification: </strong> <br/> ", "Axis refers to yes/no response to <em> 'Do you regard yourself as belonging to a particular religion?' </em>."),
      input$select_var1_p1 == "Religious Attendance" ~ HTML("<strong> Religious Attendance: </strong> <br/> ", "Axis refers to how frequently participants report attending religious services, with 1 being More than once a week, and 7 being Never"),
      input$select_var1_p1 == "Prayer Frequency" ~ HTML("<strong> Prayer Frequency: </strong> <br/> ", "Axis refers to how frequently participants report praying, , with 1 being More than once a week, and 7 being Never"),
      input$select_var1_p1 == "Religious Artefacts" ~ HTML("<strong> Religious Artefacts: </strong> <br/> ", "Axis refers to participants' responses to whether they have religious objects in their home"),
      input$select_var1_p1 == "Life After Death" ~ HTML("<strong> Life After Death: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There is some sort of life after death' </em>."),
      input$select_var1_p1 == "Reincarnation" ~ HTML("<strong> Reincarnation: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Sometime after I die, I expect that I’ll be born again in another body.' </em>."),
      input$select_var1_p1 == "Astrology" ~ HTML("<strong> Astrology: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'The positions of the stars and planets affect people’s lives' </em>."),
      input$select_var1_p1 == "Mystical Powers (people)" ~ HTML("<strong> Mystical Powers (people): </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Some people have mystical powers (e.g. to heal, harm, or bring good luck)' </em>."),
      input$select_var1_p1 == "Mystical Powers (objects)" ~ HTML("<strong> Mystical Powers (objects): </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Some objects have mystical powers (e.g. to heal, harm, or bring good luck)' </em>."),
      input$select_var1_p1 == "Good and Evil Powers" ~ HTML("<strong> Good and Evil Powers: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There are underlying forces of good and evil in this world.' </em>."),
      input$select_var1_p1 == "Universal Life Force" ~ HTML("<strong> Universal Life Force: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There exists a universal spirit or life force.' </em>."),
      input$select_var1_p1 == "Karma" ~ HTML("<strong> Karma: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There is a power in the universe that causes good things to happen to people who behave morally and bad things to happen to people who behave immorally.' </em>."),
      input$select_var1_p1 == "Fate" ~ HTML("<strong> Fate: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Most significant life events are meant to be and happen for a reason.' </em>."),
      input$select_var1_p1 == "Supernatural Beings" ~ HTML("<strong> Supernatural Beings: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Supernatural beings of some kind exist' </em>."),
      input$select_var1_p1 == "Good Supernatural Beings" ~ HTML("<strong> Good Supernatural Beings: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There exist supernatural beings that are good/kind (e.g. COUNTRY SPECIFIC)' </em>."),
      input$select_var1_p1 == "Harmful Supernatural Beings" ~ HTML("<strong> Harmful Supernatural Beings: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There exist supernatural beings that are harmful (e.g. COUNTRY SPECIFIC)' </em>."),
      input$select_var1_p1 == "Afterlife Punishment" ~ HTML("<strong> Afterlife Punishment: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Some people will be punished after they die' </em>."),
      input$select_var1_p1 == "Afterlife Reward" ~ HTML("<strong> Afterlife Reward: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Some people will be rewarded after they die' </em>."),
      input$select_var1_p1 == "Evil Eye" ~ HTML("<strong> Evil Eye: </strong> <br/> ", "Making other people envious of you can cause illness or misfortune' </em>."),
      input$select_var1_p1 == "Spiritual Force" ~ HTML("<strong> Spiritual Force: </strong> <br/> ", "Axis refers to yes/no response to the statement <em> 'Have you ever felt as though you were connected to a powerful spiritual force?' </em>."),
      input$select_var1_p1 == "Lucky/Protection Objects Force" ~ HTML("<strong> Lucky/Protection Objects: </strong> <br/> ", "Axis refers to yes/no response to the statement <em> 'Do you carry any objects for luck or protection?' </em>.")
    )
  })
  
  
  output$varinfo2<- renderUI({
    case_when(
      input$select_var2_p1 == "Age" ~ HTML("<strong> Age: </strong> <br/> ", "Axis refers to numerical age."),
      input$select_var2_p1 == "Country" ~ HTML("<strong> Country: </strong> <br/> ", "Axis refers to Country."),
      input$select_var2_p1 == "Sex" ~ HTML("<strong> Sex: </strong> <br/> ", "Axis refers to sex."),
      input$select_var2_p1 == "Belief In God (categorical)" ~ HTML("<strong> Belief In God: </strong> <br/> ", "Axis refers category selected regarding belief in God."),
      input$select_var2_p1 == "Belief Identity" ~ HTML("<strong> Belief Identity: </strong> <br/> ", "Axis refers category selected regarding belief identity"),
      input$select_var2_p1 == "Religious Identity" ~ HTML("<strong> Belief Identity: </strong> <br/> ", "Axis refers category selected regarding religious identity"),
      
      input$select_var2_p1 == "Individualism" ~ HTML("<strong> Individualism: </strong> <br/> ", "Axis refers to score on individualism questionnaire, with higher scores denoting higher individualism and lower score higher collectivism."),
      input$select_var2_p1 == "Rebelliousness" ~ HTML("<strong> Rebelliousness: </strong> <br/> ", "Axis refers to score on rebelliousness questionnaire, with higher scores denoting higher rebelliousness."),
      input$select_var2_p1 == "Choice Norms" ~ HTML("<strong> Individual Choice Norms: </strong> <br/> ", "Axis refers to score on individual choice norms questionnaire, with higher scores denoting higher agreement with individual choice norms (e.g. abortion, homosexuality)"),
      input$select_var2_p1 == "Belief in God (continuous)" ~ HTML("<strong> Belief in God: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'I believe that God exists' </em>."),
      input$select_var2_p1 == "Possibility of Knowing" ~ HTML("<strong> Possibility of Knowing: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'It is not possible to know if God exists' </em>."),
      input$select_var2_p1 == "Confidence in Belief" ~ HTML("<strong> Confidence in Belief: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'I am confident that my beliefs about God's existence are the right ones' </em>."),
      input$select_var2_p1 == "Anti Religiosity" ~ HTML("<strong> Anti Religiosity: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'We would all be better off if people left religion behind' </em>."),
      input$select_var2_p1 == "God Apatheism" ~ HTML("<strong> God Apatheism: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Whether or not God exists is a question that doesn’t interest me much' </em>."),
      input$select_var2_p1 == "Purpose Apatheism" ~ HTML("<strong> Purpose Apatheism: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Whether or not there is an ultimate purpose to life is a question that doesn’t interest me much.' </em>."),
      input$select_var2_p1 == "Agnosticism" ~ HTML("<strong> Agnosticism: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> '	I don’t know whether there is a God, and I don’t believe there is any way to find out' </em>."),
      input$select_var2_p1 == "Objective Truth Discovery" ~ HTML("<strong> Objective Truth Discovery: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'For most things in the world, we will never be able to discover the real objective truth' </em>."),
      
      input$select_var2_p1 == "Religious Identification (y/n)" ~ HTML("<strong> Religious Identification: </strong> <br/> ", "Axis refers to yes/no response to <em> 'Do you regard yourself as belonging to a particular religion?' </em>."),
      input$select_var2_p1 == "Religious Attendance" ~ HTML("<strong> Religious Attendance: </strong> <br/> ", "Axis refers to how frequently participants report attending religious services, with 1 being More than once a week, and 7 being Never"),
      input$select_var2_p1 == "Prayer Frequency" ~ HTML("<strong> Prayer Frequency: </strong> <br/> ", "Axis refers to how frequently participants report praying, , with 1 being More than once a week, and 7 being Never"),
      input$select_var2_p1 == "Religious Artefacts" ~ HTML("<strong> Religious Artefacts: </strong> <br/> ", "Axis refers to participants' responses to whether they have religious objects in their home"),
      input$select_var2_p1 == "Life After Death" ~ HTML("<strong> Life After Death: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There is some sort of life after death' </em>."),
      input$select_var2_p1 == "Reincarnation" ~ HTML("<strong> Reincarnation: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Sometime after I die, I expect that I’ll be born again in another body.' </em>."),
      input$select_var2_p1 == "Astrology" ~ HTML("<strong> Astrology: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'The positions of the stars and planets affect people’s lives' </em>."),
      input$select_var2_p1 == "Mystical Powers (people)" ~ HTML("<strong> Mystical Powers (people): </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Some people have mystical powers (e.g. to heal, harm, or bring good luck)' </em>."),
      input$select_var2_p1 == "Mystical Powers (objects)" ~ HTML("<strong> Mystical Powers (objects): </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Some objects have mystical powers (e.g. to heal, harm, or bring good luck)' </em>."),
      input$select_var2_p1 == "Good and Evil Powers" ~ HTML("<strong> Good and Evil Powers: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There are underlying forces of good and evil in this world.' </em>."),
      input$select_var2_p1 == "Universal Life Force" ~ HTML("<strong> Universal Life Force: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There exists a universal spirit or life force.' </em>."),
      input$select_var2_p1 == "Karma" ~ HTML("<strong> Karma: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There is a power in the universe that causes good things to happen to people who behave morally and bad things to happen to people who behave immorally.' </em>."),
      input$select_var2_p1 == "Fate" ~ HTML("<strong> Fate: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Most significant life events are meant to be and happen for a reason.' </em>."),
      input$select_var2_p1 == "Supernatural Beings" ~ HTML("<strong> Supernatural Beings: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Supernatural beings of some kind exist' </em>."),
      input$select_var2_p1 == "Good Supernatural Beings" ~ HTML("<strong> Good Supernatural Beings: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There exist supernatural beings that are good/kind (e.g. COUNTRY SPECIFIC)' </em>."),
      input$select_var2_p1 == "Harmful Supernatural Beings" ~ HTML("<strong> Harmful Supernatural Beings: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'There exist supernatural beings that are harmful (e.g. COUNTRY SPECIFIC)' </em>."),
      input$select_var2_p1 == "Afterlife Punishment" ~ HTML("<strong> Afterlife Punishment: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Some people will be punished after they die' </em>."),
      input$select_var2_p1 == "Afterlife Reward" ~ HTML("<strong> Afterlife Reward: </strong> <br/> ", "Axis refers to level of agreement with the statement <em> 'Some people will be rewarded after they die' </em>."),
      input$select_var2_p1 == "Evil Eye" ~ HTML("<strong> Evil Eye: </strong> <br/> ", "Making other people envious of you can cause illness or misfortune' </em>."),
      input$select_var2_p1 == "Spiritual Force" ~ HTML("<strong> Spiritual Force: </strong> <br/> ", "Axis refers to yes/no response to the statement <em> 'Have you ever felt as though you were connected to a powerful spiritual force?' </em>."),
      input$select_var2_p1 == "Lucky/Protection Objects Force" ~ HTML("<strong> Lucky/Protection Objects: </strong> <br/> ", "Axis refers to yes/no response to the statement <em> 'Do you carry any objects for luck or protection?' </em>.")
    )
  })
  
  
  # Plot Outputs
  
  output$plot_s1 <- renderPlot(
    funPlot1(
      data1,
      var1 = input$select_var1_p1,
      var2 = input$select_var2_p1,
      country = input$select_country_s1,
      line = input$line_s1
    )
  )
  
  # Table outputs
  
    # Demographics
  
  output$demotab.s1 <-  reactive(funTab1(
    data1,
    country = input$select_countryx,
    type = input$tabletype_s1
  ))
  
    # Correlation Matrix
  
  output$cormat.s1 <- renderTable({
    data_tab <- funTab1(data1,
                        country = input$select_countryx,
                        type = input$tabletype_s1, 
                        cormatvars = input$cormatvars)
    
    as.data.frame(data_tab)  #  ensure a data frame not tibble
  },
  
  include.rownames = TRUE)  #include rownames
  
  
  # Correlation Matrix Plot
  
  output$cormatplot <- renderPlot(funTabPlot1(
    data1,
    country = input$select_countryx,
    type = input$tabletype_s1,
    cormatvars = input$cormatvars
  ))
  
  # Crosstabs
  
  output$crosstabs.s1 <-  render_gt(
    funTab1(
      data1,
      country = input$select_countryx,
      type = input$tabletype_s1,
      var1 = input$ctabsrow,
      var2 = input$ctabscol
    )
  )
  
  # Summary Stats
  
  output$summarystats.s1 <-  render_gt(
    funTab1(
      data1,
      country = input$select_countryx,
      type = input$tabletype_s1,
      var1 = input$sumstatsgrp.s1,
      var2 = input$sumstatsvars.s1
    )
  )
  
  
  
  
  
#--------------------- Survey 2 ----------------------------------
  
  
}