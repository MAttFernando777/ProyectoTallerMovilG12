import { Router } from 'express';
import { deleteConvocatoria, getConvocatoria, getConvocatorias, postConvocatoria, putConvocatoria } from '../controllers/convocatoria.controller';



const router = Router();

router.get('/', getConvocatorias);
router.get('/:id', getConvocatoria);
router.delete('/:id', deleteConvocatoria);
router.post('/', postConvocatoria);
router.put('/:id', putConvocatoria);



export default router;