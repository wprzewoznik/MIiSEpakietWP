#' Obliczanie emisji niskiej - transport
#'
#' @param dane data.frame
#' @param kategoria char
#' @param euro char
#' @param mode vector
#' @param substancja vector
#'
obl_emisji <- function(dane = input,
                       kategoria = "Passenger Cars",
                       euro = "Euro 5",
                       mode = "",
                       substancja = c("CO", "EC")) {

  out <- wskazniki %>%
    dplyr::filter( .data$Category %in% kategoria) %>%
    dplyr::filter( .data$Euro.Standard %in% euro) %>%
    dplyr::filter( .data$Pollutant %in% substancja) %>%
    dplyr::filter( .data$Mode %in% mode)

  out <- dplyr::inner_join(x = out, y = input, by = c("Segment","Fuel","Technology"))

  out <- out %>%
    dplyr::mutate(Emisja = .data$Nat * (( .data$Alpha *  .data$Procent ^ 2 + .data$Beta * .data$Procent + .data$Gamma + ( .data$Delta/ .data$Procent))/
                             ( .data$Epsilon * .data$Procent ^ 2 + .data$Zita * .data$Procent + .data$Hta) * ( 1- .data$Reduction))
    ) %>%
    dplyr::select( .data$Category,  .data$Fuel, .data$Euro.Standard, .data$Technology, .data$Pollutant, .data$Mode, .data$Segment, .data$Nat, .data$Emisja)

  return(out)
}
