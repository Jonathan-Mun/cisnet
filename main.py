import json
import mysql.connector
from mysql.connector import Error
import os
import time
def connect_to_database():
	try:
		connection = mysql.connector.connect(
			host='localhost',
			user='root',
			password='root1234',
			database='cisnet'
		)
		if connection.is_connected():
			print('Connexion réussie à la base de données MySQL')
			return connection
	except Error as e:
		print(f"Erreur lors de la connexion à MySQL : {e}")
		return None
	

def list_cours(connection):
	try:
		dict_cours = {}
		cursor = connection.cursor()
		cursor.execute(""" \
			SELECT
			c.id_cours,
			c.intitule AS nom_cours,
			c.code_cours AS matricule,
			c.credit,
			c.semestre,

			CONCAT(p.nom, ' ', p.postnom, ' ', p.prenom) AS professeur,

			IFNULL(
				CONCAT(a.nom, ' ', a.postnom, ' ', a.prenom),
				'Aucun'
			) AS assistant,

			CONCAT(pr.niveau, ' ', f.abreviation) AS promotion

		FROM cours c
		JOIN professeurs p ON c.professeur = p.id_professeur
		LEFT JOIN assistants a ON c.assistant = a.id_assistant
		JOIN promotions pr ON c.promotion = pr.id_promotion
		JOIN facultes f ON pr.faculte = f.id_faculte;
		""")
		Cours = cursor.fetchall()
		for cours in Cours:
			dict_cours[cours[0]] = {
				"nom": cours[1],
				"matricule": cours[2],
				"credits": cours[3],
				"semestre": cours[4],
				"professeur": cours[5],
				"assistant": cours[6],
				"promotion": cours[7]
			}

		return dict_cours
	except Error as e:
		print(f"Erreur lors de la récupération des cours : {e}")

def clear_screen():
	os.system('cls' if os.name == 'nt' else 'clear')

def cisnet_connection(connexion):
	print("1. Se connecter")
	print("2. Quitter")
	choix = input("Choisissez une option : ")
	clear_screen()
	if choix == '1':
		cursor = connexion.cursor()
		username = input("votre matricule ou email: ")
		password = input("Mot de passe: ")
		cursor.execute("SELECT matricule, mail, password FROM etudiants WHERE (matricule = %s or mail = %s) and password = %s", (username, username, password))
		result = cursor.fetchone()
		clear_screen()
		if result:
			cursor.execute("SELECT nom FROM etudiants")
			etudiant_nom = cursor.fetchone()[0]
			print(f"Connexion réussie. Bienvenue, {etudiant_nom}!")
			input("Appuyez sur Entrée pour continuer...")
			clear_screen()
		else:
			print("Échec de la connexion. Nom d'utilisateur ou mot de passe incorrect.")
			time.sleep(2)
			clear_screen()
			cisnet_connection(connexion)
	elif choix == '2':
		print("Au revoir!")
	else:
		print("Option invalide. Veuillez réessayer.")






if __name__ == "__main__":
	conn = connect_to_database()
	if conn:
		cisnet_connection(conn)
		conn.close()
