function buscarMaturacao() {
    console.log('Acessei a data de maturação')

    var instrucaoSql = `
    SELECT 
    tempoMaturacao,
    TIMESTAMPDIFF(DAY, dataCadastro, NOW()) AS 'diaMaturacao'
    FROM tanque;
    `

    return database.executar(instrucaoSql);

}