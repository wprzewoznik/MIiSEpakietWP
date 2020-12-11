#' MIiSEpakietWP: Pakiet do obliczania emisji wg EEA i wizualizacji tych danych
#'
#' Pakiet powstal w ramach zajec z przedmiotu Metody Inwentaryzacji
#' i Szacowania Emisji z dr Matuszem Rzeszutkiem. Jego zadaniem jest
#' obliczanie emisji zanieczyszczen do srodowiska z emisji komunikacyjnej
#' (samochody, pojazdy) we wskazanych kategoriach. Umozliwia on rowniez
#' wizualizacje danych dostarczonych wraz z pakietem.
#'
#' Pakiet zawiera dwie funkcje:
#' \code{obl_emisji()} obliczanie emisji na podstawie zadanych parametrow
#'                    i dostarczonych danych
#' \code{wiz_emisji()} wizualizacja danych
#'
#' @docType package
#' @name MIiSEpakietWP
#' @import magrittr
#' @import dplyr
#' @import qpdf
NULL

utils::globalVariables(c("input", "wskazniki"))
