import { Router } from 'express';
import { deleteTramite, getTramite, getTramites, postTramite, putTramite } from '../controllers/tramite.controller';



const router = Router();

router.get('/', getTramites);
router.get('/:id', getTramite);
router.delete('/:id', deleteTramite);
router.post('/', postTramite);
router.put('/:id', putTramite);



export default router;