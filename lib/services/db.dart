import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:notehub/model/MyNoteModel.dart';
class NotesDatabase{
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;
  NotesDatabase._init();
  Future<Database?>get database async{
    if(_database != null){
      return _database;}
      _database = await _initializeDB('NewNotes.db');
      return _database ;

}

Future<Database>_initializeDB(String filepath) async{
    final dbPath = await getDatabasesPath();
    final path  = join(dbPath, filepath);
    return await openDatabase(path , version: 1 , onCreate: _createDB);
}

Future _createDB(Database db , int version) async{
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = 'BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE Notes(
    ${NotesImpNames.id} $idType,
    ${NotesImpNames.pin} $boolType,
    ${NotesImpNames.isArchive} $boolType,
    ${NotesImpNames.title} $textType,
    ${NotesImpNames.content} $textType,
    ${NotesImpNames.createdTime} $textType
    )
    ''');}
    Future<Note?>InsertEntry(Note note) async{
      final db = await instance.database;
      final id = await db!.insert(NotesImpNames.TableName, note.toJson());
      return note.copy(id :id);

    }

    Future<List<Note>> readAllNotes() async{
    final db = await instance.database ;
    final orderBy = '${NotesImpNames.createdTime} ASC' ;
    final query_result = await db!.query(NotesImpNames.TableName, orderBy: orderBy) ;
    return query_result.map((json) => Note.fromJson(json)).toList();

    }
  Future<Note?>readOneNote(int id)async{
    final db = await instance.database;
    final map = await db!.query(NotesImpNames.TableName ,
      columns: NotesImpNames.values ,
      where: '${NotesImpNames.id}= ?',
        whereArgs: [id]
    );
    if(map.isNotEmpty){
    return Note.fromJson(map.first);
    }
    else{
      return null;
    }

}
//making update method
  Future updateNote(Note note) async{
    final db = await instance.database ;
    return await db!.update(NotesImpNames.TableName, note.toJson()
    ,where: "${NotesImpNames.id} = ?",
      whereArgs: [note.id]
    );
  }

  Future pinNote(Note? note) async{
    final db = await instance.database ;
    return await db!.update(NotesImpNames.TableName, {NotesImpNames.pin : !note!.pin ? 1 : 0}
        ,where: "${NotesImpNames.id} = ?",
        whereArgs: [note.id]
    );
  }

  Future archNote(Note? note) async{
    final db = await instance.database ;
    return await db!.update(NotesImpNames.TableName, {NotesImpNames.isArchive : !note!.isArchive ? 1 : 0}
        ,where: "${NotesImpNames.id} = ?",
        whereArgs: [note.id]
    );
  }
  Future<List<int>> getNoteString(String query) async{

    final db = await instance.database;
    final result = await db!.query(NotesImpNames.TableName);
    //iss upar wali line se jitni bhi table names thi humare query
    //ko satisfy krne wali saari result me save hojaengi
    List<int> resultIds = [];
    result.forEach((element) {
      if(element["title"].toString().toLowerCase().contains(query) || element["content"].toString().toLowerCase().contains(query)){
        resultIds.add(element["id"] as int);
      //ye line check krta ki humari query title me h ya content me
      }

    });


    return resultIds;

  }

//to delete a note
  Future deleteNode(Note? note) async{
  final db = await instance.database ;
  await db!.delete(NotesImpNames.TableName , where: '${NotesImpNames.id} = ?',whereArgs: [note!.id]);
  }

  Future closeDB() async{
    final db = await instance.database ;
    db!.close();
  }
}
