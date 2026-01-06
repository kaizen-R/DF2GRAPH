# What this is

An R package, meant to help with transforming data frames to graphs.

# How can I get it?

Provided you have the "devtools" and the required packages / R setup, you should be able to do:

```R
library(devtools)
install_github("kaizen-R/RLCS")
```

# How does it work?

There is really just one function to be called: df_to_graph()

Here goes a simple example that hopefully will illustrate the functionality:

```R
library(DF2GRAPH)
## Simplest conceptual example:
df <- data.frame(a = c(1,2,3), b = c(1,3,4))
df
g <- df_to_graph(df)
plot(g)
```

