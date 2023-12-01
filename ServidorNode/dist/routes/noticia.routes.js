"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const noticia_controller_1 = require("../controllers/noticia.controller");
const router = (0, express_1.Router)();
router.get('/', noticia_controller_1.getNoticias);
router.get('/:id', noticia_controller_1.getNoticia);
router.delete('/:id', noticia_controller_1.deleteNoticia);
router.post('/', noticia_controller_1.postNoticia);
router.put('/:id', noticia_controller_1.putNoticia);
exports.default = router;
