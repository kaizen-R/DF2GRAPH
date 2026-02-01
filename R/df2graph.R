
#' Transform DF row to an edges list.
#'
#' @param x
#' A dataframe's row.
#'
#' @returns
#' A matrix of two columns, whereby each row of the matrix is a future graph
#' edge.
#'
.row_to_graph_edge_list <- function(x) {
  x <- sapply(x, \(y) y) ## Weird this is needed... Wouldn't work otherwise...
  if(any(is.null(x)))
    x <- x[-which(is.null(x))]
  if(any(is.na(x)))
    x <- x[-which(is.na(x))]
  if(length(x) < 2L)
    return(NULL)
  cbind(utils::head(x, -1L), utils::tail(x, -1L))
}

#' Create a complete edges list from a Data Frame.
#'
#' @param df
#' A data frame for which each cell will become a node, and each row in turn will
#' be transformed into a list of "edges" for a future graph
#'
#' @returns
#' A list of edges, in matrix form.
#'
.df_to_graph_edges_list <- function(df) {
  edge_list_list <- lapply(1:nrow(df), \(x) .row_to_graph_edge_list(df[x,]))
  do.call(rbind, edge_list_list)
}

#' Transforms a Data Frame to an igraph graph object.
#'
#' @param df
#' A data frame. Each cell of the data frame will become a node, so be careful
#' with the chosen data frame... Long contents might not be the best idea...
#'
#' @returns
#' An (directed) igraph graph object, that can be plotted... Duplicate edges are
#' removed.
#'
#' @export
#'
#' @examples
#' df <- data.frame(a = c(1,2,3), b = c(1,3,4))
#' g <- df_to_graph(df)
#' plot(g)
df_to_graph <- function(df) {
  igraph::simplify(igraph::graph_from_edgelist(.df_to_graph_edges_list(df)),
           remove.multiple = T,
           remove.loops = F)
}
