class Tables{
 static String noteTableName = "notes";

 static String noteTable = '''CREATE TABLE IF NOT EXISTS $noteTableName(
 noteId INTEGRER PRIMARY KEY AUTOINCREMENT,
 title TEXT,
 content TEXT,
 createdAT Text
 )''';
}