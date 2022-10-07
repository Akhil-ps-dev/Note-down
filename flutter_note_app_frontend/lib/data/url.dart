class Url {
  // String baseUrl = 'http://localhost:3000';
  //! Error -- SocketException: Connection refused (OS Error: Connection refused, errno = 111), address = localhost, port = 45196
  //
  String baseUrl = 'http://10.0.2.2:3000';

  String createNote = '/note/create';
  String updateNote = '/note/update';
  String deleteNote = '/note/delete/{id}';
  String getAllNote = '/note/getAll';
}
