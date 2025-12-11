var maturacaoModel = require("../models/maturacaoModel");

function buscarMaturacao(req, res) {
    console.log('Estou no maturacaoController')

    maturacaoModel.buscarMaturacao(id).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(200).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar a data de maturação.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);

    })

}

module.exports = {
buscarMaturacao
}