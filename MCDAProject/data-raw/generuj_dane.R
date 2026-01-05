# data-raw/generuj_dane.R

# Ustawiamy ziarno losowosci, aby wyniki byly powtarzalne
set.seed(123)

# Definicje problemu
eksperci <- 1:15
aplikacje <- c("AutoSleep", "Sleep_as_Android", "Garmin_Sleep_Advanced")

# Tworzymy ramke danych: eksperci x aplikacje
mcda_dane_surowe <- expand.grid(
  EkspertID = eksperci,
  Aplikacja = aplikacje
)

n <- nrow(mcda_dane_surowe)

# --- Kryterium 1: Dokladnosc monitorowania snu (Likert 1–5)
mcda_dane_surowe$dokladnosc_faz_snu <- sample(1:5, n, replace = TRUE)

# --- Kryterium 2: Przejrzystosc analiz snu (Likert 1–5)
mcda_dane_surowe$analiza_statystyk <- sample(1:5, n, replace = TRUE)

# --- Kryterium 3: Latwosc obslugi interfejsu (Likert 1–5)
mcda_dane_surowe$ux_latwosc <- sample(1:5, n, replace = TRUE)

# --- Kryterium 4: Zakres zbieranych danych fizjologicznych (Likert 1–5)
mcda_dane_surowe$dane_fizjologiczne <- sample(1:5, n, replace = TRUE)

# --- Kryterium 5: Integracja z urzadzeniami (Likert 1–5)
mcda_dane_surowe$integracja_urzadzenia <- sample(1:5, n, replace = TRUE)

# --- Kryterium 6: Funkcje dodatkowe (Likert 1–5)
mcda_dane_surowe$funkcje_dodatkowe <- sample(1:5, n, replace = TRUE)

# --- Kryterium 7: Zuzycie baterii (Likert 1–5, COST)
mcda_dane_surowe$zuzycie_baterii <- sample(1:5, n, replace = TRUE)

# --- Kryterium 8: Cena / subskrypcja (Likert 1–5, COST)
mcda_dane_surowe$cena_subskrypcja <- sample(1:5, n, replace = TRUE)

# Zapis danych do folderu data/
usethis::use_data(mcda_dane_surowe, overwrite = TRUE)
