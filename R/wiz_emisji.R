#' Funkcja do Wizualizacji danych dostarczonych z pakietem
#'
#' @param df data.frame
#' @param kat1 char
#' @param kat2 char
#' @param kategoryczna char
#' @param numeryczna char
#' @export
#'
#' @examples
#' #Wygenerowanie wykresu dla danych domuslnych
#' wiz_emisji()
#'
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
                              color = "Category")+
                ggplot2::ylim(0, 100)

  return(wykres)
}
