"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.putTramite = exports.postTramite = exports.deleteTramite = exports.getTramite = exports.getTramites = void 0;
const connection_1 = __importDefault(require("../db/connection"));
const getTramites = (req, res) => {
    connection_1.default.query('SELECT * FROM tramite', (err, data) => {
        if (err)
            throw err;
        res.json(data);
    });
};
exports.getTramites = getTramites;
const getTramite = (req, res) => {
    const { id } = req.params;
    connection_1.default.query('SELECT * FROM tramite WHERE id = ?', id, (err, data) => {
        if (err)
            throw err;
        res.json(data[0]);
    });
};
exports.getTramite = getTramite;
const deleteTramite = (req, res) => {
    const { id } = req.params;
    connection_1.default.query('DELETE FROM tramite WHERE id = ?', id, (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Tramite eliminado con éxito"
        });
    });
};
exports.deleteTramite = deleteTramite;
const postTramite = (req, res) => {
    const { body } = req;
    connection_1.default.query('INSERT INTO tramite set ?', [body], (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Tramite agregado con éxito"
        });
    });
};
exports.postTramite = postTramite;
const putTramite = (req, res) => {
    const { body } = req;
    const { id } = req.params;
    connection_1.default.query('UPDATE tramite set ? WHERE id = ?', [body, id], (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Tramite actualizado con éxito"
        });
    });
};
exports.putTramite = putTramite;
