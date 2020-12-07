#' Wizualizacja danych dostarczonych z pakietem wg wskazanych parametrow
#'
#' @param df data.frame
#' @param kat1 charakter
#' @param kat2 charakter
#' @param kategoryczna charakter
#' @param numeryczna charakter
#'
wiz_emisji <- function(df = wskazniki,
                kat1 = .data$Category,
                kat2 = "Passenger Cars",
                kategoryczna = .data$Segment,
                numeryczna = .data$Gamma) {

  kat1 <- rlang::enquo(kat1)
  kategoryczna <- rlang::enquo(kategoryczna)
  numeryczna   <- rlang::enquo(numeryczna)

  if (!is.null(kat2)) {
    df <- df %>%
      dplyr::filter(!!kat1 %in% kat2)
  }


    ggplot2::ggplot(df, ggplot2::aes(x = !!kategoryczna,
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
                          ggplot2::ylim(0, 300)

  return(wykres)
}
