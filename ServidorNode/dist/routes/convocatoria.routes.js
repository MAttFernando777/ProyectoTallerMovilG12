"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const convocatoria_controller_1 = require("../controllers/convocatoria.controller");
const router = (0, express_1.Router)();
router.get('/', convocatoria_controller_1.getConvocatorias);
router.get('/:id', convocatoria_controller_1.getConvocatoria);
router.delete('/:id', convocatoria_controller_1.deleteConvocatoria);
router.post('/', convocatoria_controller_1.postConvocatoria);
router.put('/:id', convocatoria_controller_1.putConvocatoria);
exports.default = router;
