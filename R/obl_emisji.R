#' Funkcja do bliczanie emisji pochodzacej z transportu
#'
#'  Funkcja oblicza emisje na korzystajac z danych zawartych w obiekcie
#' \code{wskazniki}, a tazke z obiektu \code{input}.
#' W obiekcie \code{wskazniki} zapisane sa dane o emisji, prygotowane wczesniej.
#' W obiekcie \code{input} zapisane sa stworzone losowo dane o natezenia ruchu.
#'
#' @details Wzor do obliczen emisji:
#' Emisja = Nat x ((Alpha  x Procent^2 + Beta x Procent + Gamma +
#' (Delta/Procent)) / (Epsilon x Procent^2 + Zita x Procent + Hta) x (1- Reduction))
#'
#' @param dane data.frame - obiekt wejsciowy
#' @param kategoria char - kategoria pojazdu
#' @param euro char - norma spalin
#' @param mode char - tryb jazdy
#' @param substancja char - mitowane zanieczyszczenie
#'
#' @export
#' @examples
#' # Obliczenie emisji dla parametrow domyslnych
#'   tmp <- obl_emisji()
#'
obl_emisji <- function(dane = input,
                       kategoria = "Passenger Cars",
                       euro = "Euro 5",
                       mode = "",
                       substancja = c("CO", "EC")) {

  out <- wskazniki %>%
    dplyr::filter(Category %in% kategoria) %>%
    dplyr::filter(Euro.Standard %in% euro) %>%
    dplyr::filter(Pollutant %in% substancja) %>%
    dplyr::filter(Mode %in% mode)

  out <- dplyr::inner_join(x = out, y = input, by = c("Segment","Fuel","Technology"))

  out <- out %>%
    dplyr::mutate(Emisja = Nat * ((Alpha *  Procent ^ 2 + Beta * Procent + Gamma + ( Delta/ Procent))/
                             ( Epsilon * Procent ^ 2 + Zita * Procent + Hta) * ( 1- Reduction))
    ) %>%
    dplyr::select( Category,  Fuel, Euro.Standard, Technology, Pollutant, Mode, Segment, Nat, Emisja)

  return(out)
}
