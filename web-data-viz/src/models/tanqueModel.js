var database = require("../database/config");

function buscarTanquesPorUsuario(id) {

  var instrucaoSql = `SELECT * FROM aquario a WHERE fk_usuario = ${id}`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(empresaId, descricao) {
  
  var instrucaoSql = `INSERT INTO (descricao, fk_empresa) aquario VALUES (${descricao}, ${empresaId})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarTanquesPorUsuario,
  cadastrar
}
