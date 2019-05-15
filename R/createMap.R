#' createMap
#' 
#' Creates a new map using fiftystater based off of given dataframe, variable, title, and subtitle
#' 
#' @param df dataframe
#' @param var variable to plot
#' @param scale_title plot scale title
#' @param plot_title plot title
#' @param subtitle plot subtitle default is an empty string
#' @param low_color lightest color for mapping, default = 'gray100'
#' @param high_color darkest color for mapping, default = 'gray0'
#' @param scale_format changes the scale's formatting, default = comma (not scientific notation)
#'
#' @return returns a fiftystater map 
#' @export
#'
#' @examples
#' avg_per_state<-createMap(StateVsAvgCost, averageCost, "Average total cost", "Average cost of hospital procedures by state")
#' 
createMap <- function (df, var, scale_title, plot_title, subtitle="", low_color='gray100', high_color="gray0", scale_format = comma){
  scale_title = scale_title
  num_vec<-eval(substitute(var),df)
  
  ggplot(df, aes(map_id = StateName)) + 
    # map points to the fifty_states shape data
    ggplot2::geom_map(aes(fill = num_vec), map = fifty_states) + 
    expand_limits(x = fifty_states$long, y = fifty_states$lat) +
    coord_map() +
    scale_fill_continuous(low = low_color, high= high_color, guide = guide_colorbar(title = scale_title), labels = scale_format) +
    scale_x_continuous(breaks = NULL) + 
    scale_y_continuous(breaks = NULL) +
    labs(x = "", y = "") +
    theme(legend.position = "right", panel.background = element_blank()) +
    ggtitle(plot_title, subtitle= subtitle)
}
