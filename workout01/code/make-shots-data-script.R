# title: make shots data
# description: preparation of GSW shot data
# input(s): .csv files of shots data for 5 GSW players
# output(s): text files of summary of each datables of 5 players, text files of shot table summary, and shot table .csv

# read in the five data sets for the GSW players

column_types <- c('character', 'character', 'character', 'numeric','numeric', 'numeric', 'character', 'character', 'character', 'numeric', 'character', 'numeric', 'numeric')

iguodala <- read.csv("../data/andre-iguodala.csv", colClasses = column_types, stringsAsFactors = FALSE)
green <- read.csv("../data/draymond-green.csv", stringsAsFactors = FALSE, colClasses = column_types)
durant <- read.csv("../data/kevin-durant.csv", stringsAsFactors = FALSE, colClasses = column_types)
thompson <- read.csv("../data/klay-thompson.csv", stringsAsFactors = FALSE, colClasses = column_types)
curry <- read.csv("../data/stephen-curry.csv", stringsAsFactors = FALSE, colClasses = column_types)


# Add a column for the player name
iguodala <- mutate(iguodala, player = 'Andre Iguodala')
green <- mutate(green, player = 'Draymond Green')
durant <- mutate(durant, player = 'Kevin Durant')
thompson <- mutate(thompson, player = 'Klay Thompson')
curry <- mutate(curry, player = 'Stephen Curry')

# change the original values of shot_made_flag to more descriptive values

iguodala[iguodala$shot_made_flag == 'n', 'shot_made_flag'] <- 'shot_no'
iguodala[iguodala$shot_made_flag == 'y', 'shot_made_flag'] <- 'shot_yes'

green[green$shot_made_flag == 'n', 'shot_made_flag'] <- 'shot_no'
green[green$shot_made_flag == 'y', 'shot_made_flag'] <- 'shot_yes'

durant[durant$shot_made_flag == 'n', 'shot_made_flag'] <- 'shot_no'
durant[durant$shot_made_flag == 'y', 'shot_made_flag'] <- 'shot_yes'

thompson[thompson$shot_made_flag == 'n', 'shot_made_flag'] <- 'shot_no'
thompson[thompson$shot_made_flag == 'y', 'shot_made_flag'] <- 'shot_yes'

curry[curry$shot_made_flag == 'n', 'shot_made_flag'] <- 'shot_no'
curry[curry$shot_made_flag == 'y', 'shot_made_flag'] <- 'shot_yes'

# Add a column minute that contains the minute number where a shot occurred.

iguodala <- mutate(iguodala, minute = period*12 - minutes_remaining)
green <- mutate(green, minute = period*12 - minutes_remaining)
durant <- mutate(durant, minute = period*12 - minutes_remaining)
thompson <- mutate(thompson, minute = period*12 - minutes_remaining)
curry <- mutate(curry, minute = period*12 - minutes_remaining)

# Use sink() to send the summary() output of each imported data frame into individual text files.

sink(file = "../output/andre-iguodala-summary.txt")
summary(iguodala)
sink()

sink(file = "../output/draymond-green-summary.txt")
summary(green)
sink()

sink(file = "../output/kevin-durant-summary.txt")
summary(durant)
sink()

sink(file = "../output/klay-thompson-summary.txt")
summary(thompson)
sink()

sink(file = "../output/stephen-curry-summary.txt")
summary(curry)
sink()


# stack the tables into a single dataframe

shots_data <- rbind(iguodala, green ,durant, thompson, curry)


# Export shots_data

write.csv(shots_data, "../data/shots-data.csv")

# Use sink() to send the summary output of shots_data to a text file

sink(file = "../output/shots-data-summary.txt")
summary(shots_data)
sink()
