wiz_emisji <- function(df = wskazniki,
                kat1 = Category,
                kat2 = "Passenger Cars",
                kategoryczna = Segment,
                numeryczna = Gamma) {

  kat1 <- enquo(kat1)
  kategoryczna <- enquo(kategoryczna)
  numeryczna   <- enquo(numeryczna)

  if (!is.null(kat2)) {
    df <- df %>%
      filter(!!kat1 %in% kat2)
  }

  df %>%
    ggplot(., aes(x = !!kategoryczna,
                  y = !!numeryczna,
                  fill = !!kategoryczna)) +
    geom_boxplot(outlier.shape = NA,
                 col="blue")+
    theme_minimal() -> p

  wykres <- p + labs(title = "Zalezosc wartosci parametru emisji
                     od wybranej kategorii",
                     subtitle = "Funkcja wizualizacji pakietu",
                     x = "Wybrana kategoria",
                     y = "Wartosc wybranego paramteru",
                     caption = "Opracowano na podstawie danych z EEA",
                     color = "Category") +
    ylim(0, 500)

  return(wykres)
}
