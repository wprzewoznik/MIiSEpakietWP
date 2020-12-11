
<!-- README.md is generated from README.Rmd. Please edit that file -->

# MIiSEpakietWP

Pakiet stworzony w jezyku R w ramach zajec z przedmiotu Metody
Inwentaryzacji i Szacowania Emisji przez Wojciecha Przewoznika na
kierunku Geoinformacja (semestr 5.).

Pakiet pozwala na wyznaczanie emisji pochodzacej z transportu wg sposobu
opisanego w podreczniku wydanym przez Europejska Agensje Srodowiska -
EEA. Pakiet sklada sie z dwoch funkcji: - obl\_emisji() \<- obliczanie
emisji na podstawie dostarczonyc danych, - wiz\_emisji() \<-
wizualizacja danych.

## Instalacja z winietą

``` r
# instalacja pakietu devtools (jezeli nie zostal pobrany wczesniej)
if (!require(devtools)) {install.packages("devtools"); require(devtools)}

# instalacja pakietu z GitHub
install_github("wprzewoznik/MIiSEpakietWP", force = T, build_vignettes = T)
library(MIiSEpakietWP)
```

## System pomocy

Skorzystać z niego mozna wywolujac funkcje:

``` r
?"MIiSEpakietWP"
```

Pełny opis pakietu znajduje się też na stronie:
[RPubs](https://rpubs.com/wprzewoznik/MIiSEpakietWP)
