context("TOM")
library(psychTestR)

app <- AppTester$new("apps/TOM_EN")

# Enter id
app$expect_ui_text("Please enter your ID Continue")
app$set_inputs(p_id = "abcden")
app$click_next()

# Intro
app$expect_ui_text("We are interested in your opinion on musical ability. Read each sentence and select the one option that shows how much you agree with it. There are no right or wrong answers. Continue")
app$click_next()

app$expect_ui_text("Question 1 out of 12 You have a certain level of musical ability and you cannot really do much to change it. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn5_text")

app$expect_ui_text("Question 2 out of 12 To be successful in music you need to learn and regularly practice techniques and skills on your instrument. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn1_text")

app$expect_ui_text("Question 3 out of 12 Even if you try, the level of musical ability you can reach will change very little. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn5_text")

app$expect_ui_text("Question 4 out of 12 You need to have certain 'gifts' to be good at music. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn5_text")

app$expect_ui_text("Question 5 out of 12 You need to learn and work hard to be good at music. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn1_text")

app$expect_ui_text("Question 6 out of 12 You will always get better at music if you work hard at it. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn1_text")

app$expect_ui_text("Question 7 out of 12 To be good at music you need to be born with the qualities which allow you success. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn5_text")

app$expect_ui_text("Question 8 out of 12 You have to go through periods of learning and training to reach a high level of performance in music. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn1_text")

app$expect_ui_text("Question 9 out of 12 How good you are at music will always improve if you work at it. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn1_text")

app$expect_ui_text("Question 10 out of 12 It is difficult to change how good you are at music. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn5_text")

app$expect_ui_text("Question 11 out of 12 You need to be naturally gifted to be good at music. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn5_text")

app$expect_ui_text("Question 12 out of 12 You will always get better at music if you put enough effort into it. Strongly disagree Disagree Neutral Agree Strongly agree")
app$click("btn1_text")

app$expect_ui_text("Your results have been saved. You can close the browser window now.")

results <- app$get_results() %>% as.list()
expect_equal(names(results), c("TOM"))
expect_equal(
  results[["TOM"]],
  list(
    q1 = "btn5_text",
    q2 = "btn1_text",
    q3 = "btn5_text",
    q4 = "btn5_text",
    q5 = "btn1_text",
    q6 = "btn1_text",
    q7 = "btn5_text",
    q8 = "btn1_text",
    q9 = "btn1_text",
    q10 = "btn5_text",
    q11 = "btn5_text",
    q12 = "btn1_text",
    Entity = 5,
    Stable = 5,
    Incremental = 1,
    Learning = 1,
    Gift = 5,
    Improvement = 1
  )
)

app$stop()
