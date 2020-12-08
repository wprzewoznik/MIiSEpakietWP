#' Obliczanie emisji niskiej - transport
#'
#' @param dane data.frame
#' @param kategoria char
#' @param euro char
#' @param mode vector
#' @param substancja vector
#' @export
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
