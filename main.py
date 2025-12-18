import mysql.connector
from mysql.connector import Error

def connect_to_database():
	try:
		connection = mysql.connector.connect(
			host='localhost',  # à adapter selon votre config
			user='votre_utilisateur',
			password='votre_mot_de_passe',
			database='votre_base_de_donnees'
		)
		if connection.is_connected():
			print('Connexion réussie à la base de données MySQL')
			return connection
	except Error as e:
		print(f"Erreur lors de la connexion à MySQL : {e}")
		return None

if __name__ == "__main__":
	conn = connect_to_database()
	if conn:
		# ... ici vous pouvez ajouter vos opérations sur la base ...
		conn.close()
		print('Connexion fermée.')
