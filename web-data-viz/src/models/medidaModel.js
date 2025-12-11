var database = require("../database/config");

function buscarUltimasMedidas(idTanque, limite_linhas) {

    var instrucaoSql = `SELECT 
        volume as Volume, 
		dataMedida,
                        DATE_FORMAT(dataMedida,'%H:%i:%s') as momento_grafico
                    FROM medida
                    WHERE fk_tanque= ${idTanque}
                    ORDER BY id DESC LIMIT ${limite_linhas}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idTanque) {

    var instrucaoSql = `SELECT 
        volume as Volume, 
		dataMedida,
                    DATE_FORMAT(dataMedida,'%H:%i:%s') as momento_grafico
                    FROM medida
                        fk_tanque
                        FROM medida WHERE fk_tanque = ${idTanque} 
                    ORDER BY id DESC LIMIT 1`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}
