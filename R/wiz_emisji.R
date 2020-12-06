#' Title
#'
#' @param df
#' @param kat1
#' @param kat2
#' @param kategoryczna
#' @param numeryczna
#'
#' @return
#' @export
#'
#' @examples
wiz_emisji <- function(df = wskazniki,
                kat1 = Category,
                kat2 = "Passenger Cars",
                kategoryczna = Segment,
                numeryczna = Gamma) {

  kat1 <- rlang::enquo(kat1)
  kategoryczna <- rlang::enquo(kategoryczna)
  numeryczna   <- rlang::enquo(numeryczna)

  if (!is.null(kat2)) {
    df <- df %>%
      dplyr::filter(!!kat1 %in% kat2)
  }

  df %>%
    ggplot2::ggplot(., ggplot2::aes(x = !!kategoryczna,
                  y = !!numeryczna,
                  fill = !!kategoryczna)) +
    ggplot2::geom_boxplot(outlier.shape = NA,
                 col="blue")+
    ggplot2::theme_minimal() -> p

  wykres <- p + ggplot2::labs(title = "Zalezosc wartosci parametru emisji
                                      od wybranej kategorii",
                              subtitle = "Funkcja wizualizacji pakietu",
                              x = "Wybrana kategoria",
                              y = "Wartosc wybranego paramteru",
                              caption = "Opracowano na podstawie danych z EEA",
                              color = "Category") +
                          ggplot2::ylim(0, 500)

  return(wykres)
}
