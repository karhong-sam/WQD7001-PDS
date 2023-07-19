library(ggplot2)
df_bar<-read.csv(file="sales_by_category.csv")

barplot(df_bar$Sales, names.arg=df_bar$Products)

df_line <- read.csv(file="products_order_by_months.csv")
df_line
# Rename values in Month column
df_line <- df_line %>%
  mutate(Months = recode(Months, "April" = "Apr", "June" = "Jun", "July" = "Jul"))

# Convert Months column to factor with correct order
df_line$Months <- factor(df_line$Months, levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"))

View(df_line)

# Create line chart
ggplot(df_line, aes(x = Months, y = Number_of_Orders)) +
  geom_line() +
  labs(title = "Number of Orders by Month", x = "Month", y = "Number of Orders")