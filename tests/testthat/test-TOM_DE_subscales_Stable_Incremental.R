context("TOM")
library(psychTestR)

app <- AppTester$new("apps/TOM_DE_subscales_Stable_Incremental")

# Enter id
app$expect_ui_text("Bitte gib Deine ID ein Weiter")
app$set_inputs(p_id = "abcde")
app$click_next()

# Intro
app$expect_ui_text("Wir interessieren uns für deine Meinung zu musikalischen Fähigkeiten. Lies die folgenden Sätze und wähle aus, wie sehr du mit der Aussage übereinstimmst. Es gibt keine richtigen oder falschen Antworten. Weiter")
app$click_next()

app$expect_ui_text("Frage 1 von 9 Man hat ein gewisses Level an musikalischen Fähigkeiten und kann nicht viel tun, um das zu ändern. Stimme überhaupt nicht zu Stimme nicht zu Weder noch Stimme zu Stimme sehr zu")
app$click("btn5_text")

app$expect_ui_text("Frage 2 von 9 Um erfolgreich Musik zu machen, muss man regelmäßig Techniken und Fertigkeiten an seinem Instrument lernen und üben. Stimme überhaupt nicht zu Stimme nicht zu Weder noch Stimme zu Stimme sehr zu")
app$click("btn2_text")

app$click("btn1_text")

app$click("btn3_text")
app$click("btn4_text")

app$click("btn4_text")
app$click("btn5_text")
app$click("btn2_text")

app$click("btn1_text")

app$expect_ui_text("Deine Ergebnisse wurden gespeichert. Du kannst das Browserfenster jetzt schließen.")

results <- app$get_results() %>% as.list()

expect_equal(names(results), c("TOM"))
expect_equal(
  results[["TOM"]],
  list(
    q1 = "btn5_text",
    q2 = "btn2_text",
    q3 = "btn1_text",
    q5 = "btn3_text",
    q6 = "btn4_text",
    q8 = "btn4_text",
    q9 = "btn5_text",
    q10 = "btn2_text",
    q12 = "btn1_text",
    Stable = 2.6666667,
    Incremental = 3.1666667
  )
)

app$stop()
