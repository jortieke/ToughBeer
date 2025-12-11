var express = require("express");
var router = express.Router();

var maturacaoController = require("../controllers/maturacaoController");

router.get("/maturacaoRota", function (req, res) {
    maturacaoController.maturacao(req, res);
})

module.exports = router;