var database = require("../database/config");

function buscarTanquesPorUsuario(id) {

  var instrucaoSql = `SELECT * FROM tanque a WHERE fk_usuario = ${id}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(id, descricao) {
  
  var instrucaoSql = `INSERT INTO (descricao, fk_usuario) aquario VALUES (${descricao}, ${id})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarTanquesPorUsuario,
  cadastrar
}
