import { Router } from 'express';
import { deleteConferencia, getConferencia, getConferencias, postConferencia, putConferencia } from '../controllers/conferencia.controller';



const router = Router();

router.get('/', getConferencias);
router.get('/:id', getConferencia);
router.delete('/:id', deleteConferencia);
router.post('/', postConferencia);
router.put('/:id', putConferencia);



export default router;