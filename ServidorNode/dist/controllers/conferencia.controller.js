"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.putConferencia = exports.postConferencia = exports.deleteConferencia = exports.getConferencia = exports.getConferencias = void 0;
const connection_1 = __importDefault(require("../db/connection"));
const getConferencias = (req, res) => {
    connection_1.default.query('SELECT * FROM conferencia', (err, data) => {
        if (err)
            throw err;
        res.json(data);
    });
};
exports.getConferencias = getConferencias;
const getConferencia = (req, res) => {
    const { id } = req.params;
    connection_1.default.query('SELECT * FROM conferencia WHERE id = ?', id, (err, data) => {
        if (err)
            throw err;
        res.json(data[0]);
    });
};
exports.getConferencia = getConferencia;
const deleteConferencia = (req, res) => {
    const { id } = req.params;
    connection_1.default.query('DELETE FROM conferencia WHERE id = ?', id, (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Conferencia eliminada con éxito"
        });
    });
};
exports.deleteConferencia = deleteConferencia;
const postConferencia = (req, res) => {
    const { body } = req;
    connection_1.default.query('INSERT INTO conferencia set ?', [body], (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Conferencia agregada con éxito"
        });
    });
};
exports.postConferencia = postConferencia;
const putConferencia = (req, res) => {
    const { body } = req;
    const { id } = req.params;
    connection_1.default.query('UPDATE conferencia set ? WHERE id = ?', [body, id], (err, data) => {
        if (err)
            throw err;
        res.json({
            msg: "Conferencia actualizada con éxito"
        });
    });
};
exports.putConferencia = putConferencia;
