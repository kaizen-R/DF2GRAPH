library(DF2GRAPH)

## Simplest conceptual example:
df <- data.frame(a = c(1,2,3), b = c(1,3,4))
df
g <- df_to_graph(df)
plot(g)

## With more columns:
df <- data.frame(
  v1 = sample(letters[1:5], 4),
  v2 = c(NA, sample(letters[1:5], 3)),
  v3 = sample(letters[1:5], 4),
  v4 = sample(letters[1:5], 4),
  v5 = c("a", NA, NA, "c")
)
df
## Removes duplicates
g <- df_to_graph(df)

igraph::edges(g)
plot(g)
