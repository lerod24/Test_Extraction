import yfinance as yf
import sqlite3
import pandas as pd
import time
from datetime import datetime


def extract_financial_data(ticker, interval, start_date, end_date):
    # Télécharger les données de Yahoo Finance
    data = yf.download(ticker, interval=interval, start=start_date, end=end_date)

    # Convertir les données en DataFrame Pandas
    df = pd.DataFrame(data)

    return df


def extract_multiple_tickers(tickers, interval, start_date, end_date):
    # Démarrer le chronomètre total
    total_start_time = time.time()

    # Initialiser une liste pour stocker les DataFrames
    data_frames = {}

    for ticker in tickers:
        # Démarrer le chronomètre pour ce ticker
        start_time = time.time()

        # Extraire les données pour ce ticker
        df = extract_financial_data(ticker, interval, start_date, end_date)

        # Enregistrer le temps d'extraction pour ce ticker
        end_time = time.time()
        extraction_time = end_time - start_time

        # Ajouter le DataFrame au dictionnaire
        data_frames[ticker] = df

        print(f"Le temps d'extraction des données pour {ticker} est de {extraction_time:.2f} secondes.")

    # Enregistrer le temps total d'extraction
    total_end_time = time.time()
    total_extraction_time = total_end_time - total_start_time

    # Créer un fichier Excel avec plusieurs feuilles
    excel_filename = 'financial_data.xlsx'
    with pd.ExcelWriter(excel_filename, engine='openpyxl') as writer:
        for ticker, df in data_frames.items():
            df.to_excel(writer, sheet_name=ticker)

    return total_extraction_time, excel_filename


# Exemple d'utilisation
if __name__ == "__main__":
    tickers = ["ALLK", "AAPL", "META"]   # Liste des tickers
    interval = "1d"  # Intervalle (e.g., '1d', '1wk', '1mo')
    start_date = "2020-01-01"
    end_date = "2023-01-01"

    total_extraction_time, excel_filename = extract_multiple_tickers(tickers, interval, start_date, end_date)

    # Afficher un résumé des résultats
    print(
        f"\nLe temps total d'extraction des données pour tous les tickers est de {total_extraction_time:.2f} secondes.")
    print(f"Les données ont été sauvegardées dans le fichier Excel : {excel_filename}")
